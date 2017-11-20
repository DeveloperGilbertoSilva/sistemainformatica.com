/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategoriaServico;
import model.CategoriaServicoDAO;
import model.GaleriaCategoria;
import model.GaleriaCategoriaDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Gilberto
 */
public class GerenteGaleriaCategoria extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenteGaleriaCategoria</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String op = "";
            int id = 0;
            String categoria = "";
            String servico = "";
            String nomeImagem = "";

            String opExcluir = request.getParameter("opExcluir");
            int idExcluir = 0;
            int idServico = 0;
            String imagemExcluir = request.getParameter("imagemExcluir");
            String diretorio = request.getParameter("diretorio");
            String cat = request.getParameter("cat");

            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            GaleriaCategoria galeria = new GaleriaCategoria();
            GaleriaCategoriaDAO galeriaDAO = new GaleriaCategoriaDAO();

            CategoriaServico cs = new CategoriaServico();
            CategoriaServicoDAO csDAO = new CategoriaServicoDAO();

            try {
                if (isMultipart) {
                    String caminho = getServletContext().getRealPath("/servico");
                    String imagem = "";
                    String imagemPattern = "";

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    List<FileItem> list = upload.parseRequest(request);
                    Iterator<FileItem> iter = list.iterator();

                    while (iter.hasNext()) {
                        FileItem item = iter.next();

                        if (item.isFormField()) {
                            if (item.getFieldName().equals("op")) {
                                op = item.getString();
                            }
                            if (item.getFieldName().equals("id")) {
                                id = Integer.parseInt(item.getString());
                            }
                            if (item.getFieldName().equals("idServico")) {
                                idServico = Integer.parseInt(item.getString());
                            }
                            if (item.getFieldName().equals("categoria_galeria")) {
                                categoria = item.getString();
                                cs = csDAO.listaCategoriaPorCategoria(categoria);
                            }
                            if (item.getFieldName().equals("servico")) {
                                servico = item.getString();
                            }
                        } else {
                            imagem = new File(item.getName()).getName();
                            if (op.equals("inserir")) {
                                File f = null;
                                f = new File(caminho + File.separator + servico + File.separator + categoria + File.separator + "galeria");
                                if (!f.exists()) {
                                    f.mkdir();
                                }

                                item.write(new File(caminho + File.separator + servico + File.separator + categoria + File.separator + "galeria" + File.separator + imagem));

                                nomeImagem = imagem;
                            } else if (op.equals("alterar")) {
                                galeria = galeriaDAO.listaImagemGaleriaEspecifica(id);
                                imagemPattern = galeria.getImagem();

                                if (imagem.isEmpty()) {
                                    nomeImagem = imagemPattern;
                                } else {
                                    item.write(new File(caminho + File.separator + categoria + File.separator + imagem));
                                    nomeImagem = imagem;
                                }
                            }
                        }

                    }
                }
                galeria.setId(id);
                galeria.setCategoria(categoria);
                galeria.setImagem(nomeImagem);
                galeria.setServico(servico);

                switch (op) {
                    case "inserir":
                        galeriaDAO.inserirImagemGaleria(galeria);
                        response.sendRedirect("admin/form_alterar_servico.jsp?id="+idServico+"&function=default");
                        break;
                    case "alterar":
                        galeriaDAO.alterarGaleria(galeria);
                        response.sendRedirect("admin/lista_imagemGaleria.jsp");
                }
            } catch (Exception e) {
                out.print("ERRO: " + e.getMessage());
            }

            try {
                if (opExcluir.equals("excluir")) {
                    idExcluir = Integer.parseInt(request.getParameter("idExcluir"));
                    idServico = Integer.parseInt(request.getParameter("idServico"));

                    String caminho = getServletContext().getRealPath("/servico");
                    new File(caminho + File.separator + diretorio + File.separator + cat + File.separator + "galeria" + File.separator + imagemExcluir).delete();
                    galeria.setId(idExcluir);
                    galeriaDAO.deletarImagemGaleria(galeria);
                }

                response.sendRedirect("admin/form_alterar_servico.jsp?id=" + idServico + "&function=default");

            } catch (Exception e) {
                out.print("ERRO: " + e.getMessage());
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}