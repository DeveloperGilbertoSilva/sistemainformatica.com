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
import model.Parceiro;
import model.ParceiroDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Gilberto
 */
public class GerenteParceiro extends HttpServlet {

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
            out.println("<title>Servlet GerenteParceiro</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String op = "";
            int id = 0;
            String nome = "";
            String site = "";
            String descricao = "";
            String nomeImagem = "";

            /*=========EXCLUIR=========*/
            int idExcluir = 0;
            String opExcluir = request.getParameter("opExcluir");
            String imagemExcluir = request.getParameter("imagemExcluir");

            
            Parceiro p = new Parceiro();
            Parceiro pAltera = new Parceiro();
            ParceiroDAO pDAO = new ParceiroDAO();

            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            try {
                if (isMultipart) {

                    try {
                        String caminho = getServletContext().getRealPath("/parceiro");
                        String imagem = "";
                        String imgPattern = "";

                        DiskFileItemFactory factory = new DiskFileItemFactory();
                        ServletFileUpload upload = new ServletFileUpload(factory);

                        List<FileItem> itens = upload.parseRequest(request);
                        Iterator<FileItem> iter = itens.iterator();

                        while (iter.hasNext()) {
                            FileItem item = iter.next();

                            if (item.isFormField()) {
                                if (item.getFieldName().equals("op")) {
                                    op = item.getString();
                                }
                                if (item.getFieldName().equals("id")) {
                                    id = Integer.parseInt(item.getString());
                                }
                                if (item.getFieldName().equals("nome")) {
                                    nome = item.getString();
                                }
                                if (item.getFieldName().equals("site")) {
                                    site = item.getString();
                                }
                                if (item.getFieldName().equals("desc")) {
                                    descricao = item.getString();
                                }
                            } else {
                                if (op.equals("alterar")) {
                                    imagem = new File(item.getName()).getName();
                                    pAltera = pDAO.listaParceiroEspecifico(id);
                                    imgPattern = pAltera.getLogo();

                                    if (imagem.isEmpty()) {
                                        nomeImagem = imgPattern;
                                    } else {
                                        imagem = new File(item.getName()).getName();
                                        item.write(new File(caminho + File.separator + imagem));

                                        nomeImagem = imagem;
                                    }
                                } else if (op.equals("inserir")) {
                                    imagem = new File(item.getName()).getName();
                                    item.write(new File(caminho + File.separator + imagem));

                                    nomeImagem = imagem;
                                }
                            }
                        }
                    } catch (Exception e) {
                        out.println("ERRO: " + e.getMessage());
                    }
                }
                p.setId(id);
                p.setNome(nome);
                p.setSite(site);
                p.setDesc(descricao);
                p.setLogo(nomeImagem);

                switch (op) {
                    case "inserir":
                        pDAO.inserirParceiro(p);
                        break;
                    case "alterar":
                        pDAO.alterarParceiro(p);
                }

                response.sendRedirect("admin/lista_parceiro.jsp");

            } catch (Exception e) {
                out.println("Não foi possível realizar a ação: " + e.getMessage());
            }
            try {
                if (opExcluir.equals("excluir")) {
                    idExcluir = Integer.parseInt(request.getParameter("idExcluir"));

                    p.setId(idExcluir);
                    pDAO.excluirParceiro(p);

                    String caminho = getServletContext().getRealPath("/parceiro");
                    new File(caminho + File.separator + imagemExcluir).delete();
                    
                    response.sendRedirect("admin/lista_parceiro.jsp");
                }
            } catch (Exception e) {
                out.print("Não foi possível realizar a ação: " + e.getMessage());
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
