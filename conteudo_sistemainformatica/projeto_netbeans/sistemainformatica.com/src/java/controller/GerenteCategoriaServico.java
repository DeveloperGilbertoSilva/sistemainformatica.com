/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class GerenteCategoriaServico extends HttpServlet {

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
            out.println("<title>Servlet GerenteCategoriaServico</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String op = "";
            String nome = "";
            String nome_diretorio = "";
            String nomeAntigoCategoria = "";
            String servico = "";
            String nomeImagem = "";
            int id = 0;
            int idServico = 0;

            String opExcluir = request.getParameter("opExcluir");
            int idExcluir = 0;
            int idServ = 0;
            String imagemExcluir = request.getParameter("imagem");
            String diretorio = request.getParameter("diretorio");
            String categoria = request.getParameter("categoria");

            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            CategoriaServico cs = new CategoriaServico();
            CategoriaServicoDAO csDAO = new CategoriaServicoDAO();

            GaleriaCategoriaDAO gcDAO = new GaleriaCategoriaDAO();
            ArrayList<GaleriaCategoria> arrayGaleria = new ArrayList<GaleriaCategoria>();

            try {
                arrayGaleria = gcDAO.listaImagemGaleria();
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
                            if (item.getFieldName().equals("nome_categoria")) {
                                nome = item.getString();
                            }
                            if (item.getFieldName().equals("nome_diretorio")) {
                                nome_diretorio = item.getString();
                            }
                            if (item.getFieldName().equals("nome_antigo")) {
                                nomeAntigoCategoria = item.getString();
                            }

                            if (item.getFieldName().equals("categoria_servico")) {
                                servico = item.getString();
                            }

                            /*======RENOMEANDO DIRETÓRIO======*/
                            if (op.equals("alterar")) {
                                cs = csDAO.listaCategoriaServicoEspecifica(id);
                                if (!nome_diretorio.equals(cs.getDiretorio())) {
                                    File file = new File(caminho + File.separator + servico + File.separator + cs.getDiretorio());
                                    
                                    file.renameTo(new File(caminho + File.separator + servico + File.separator + nome_diretorio));
                                }
                            }

                            if (op.equals("alterar")) {
                                for (GaleriaCategoria gc : arrayGaleria) {
                                    if (!nome_diretorio.equals(gc.getCategoria())) {
                                        gc.setCategoria(nome_diretorio);
                                        gcDAO.alterarDiretorioGaleria(nome_diretorio, nomeAntigoCategoria);
                                    }
                                }
                            }

                        } else {
                            imagem = new File(item.getName()).getName();
                            if (op.equals("inserir")) {
                                File f = null;
                                f = new File(caminho + File.separator + servico + File.separator + nome_diretorio);
                                if (!f.exists()) {
                                    f.mkdir();
                                }

                                item.write(new File(caminho + File.separator + servico + File.separator + nome_diretorio + File.separator + imagem));

                                nomeImagem = imagem;
                            } else if (op.equals("alterar")) {
                                imagemPattern = cs.getImagem();

                                if (imagem.isEmpty()) {
                                    nomeImagem = imagemPattern;
                                } else {
                                    cs = csDAO.listaCategoriaServicoEspecifica(id);
                                    item.write(new File(caminho + File.separator + cs.getServico() + File.separator + nome_diretorio + File.separator + imagem));
                                    nomeImagem = imagem;
                                }
                            }
                        }
                    }
                }
                cs.setId(id);
                cs.setNome(nome);
                cs.setDiretorio(nome_diretorio);
                cs.setServico(servico);
                cs.setImagem(nomeImagem);

                switch (op) {
                    case "inserir":
                        csDAO.inserirCategoria(cs);
                        response.sendRedirect("admin/form_alterar_servico.jsp?id=" + idServico + "&function=default");
                        break;
                    case "alterar":
                        csDAO.alterarCategoria(cs);
                        response.sendRedirect("admin/form_alterar_servico.jsp?id=" + idServico + "&function=default");
                }

            } catch (Exception e) {
                out.print("ERRO: " + e.getMessage());
            }

            try {
                if (opExcluir.equals("excluir")) {
                    idExcluir = Integer.parseInt(request.getParameter("idExcluir"));
                    idServ = Integer.parseInt(request.getParameter("idServ"));

                    cs = csDAO.listaCategoriaServicoEspecifica(idExcluir);

                    cs.setId(idExcluir);
                    csDAO.excluirCategoria(cs);
                    
                    gcDAO.deletarGaleriaPorCategoria(categoria);

                    String caminho = getServletContext().getRealPath("/servico");

                    boolean success = (new File(caminho + File.separator + cs.getServico() + File.separator + diretorio)).delete();
                    if (!success) {
                        File f = new File(caminho + File.separator + cs.getServico() + File.separator + diretorio);
                        csDAO.deleteDir(f);
                    }
                }
                response.sendRedirect("admin/form_alterar_servico.jsp?id=" + idServ + "&function=default");
            } catch (Exception e) {
                out.println("ERRO: " + e.getMessage());
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
