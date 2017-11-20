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
public class GerenteLogoParceiro extends HttpServlet {

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
            out.println("<title>Servlet GerenteLogoParceiro</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String logo = "";
            int id = 0;

            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            Parceiro p = new Parceiro();
            Parceiro pList = new Parceiro();
            ParceiroDAO pDAO = new ParceiroDAO();

            if (isMultipart) {
                try {

                    DiskFileItemFactory factory = new DiskFileItemFactory();

                    ServletFileUpload upload = new ServletFileUpload(factory);

                    List<FileItem> itens = upload.parseRequest(request);

                    Iterator<FileItem> iter = itens.iterator();

                    String fieldName = "";
                    String caminho = getServletContext().getRealPath("/parceiro");

                    while (iter.hasNext()) {
                        FileItem item = iter.next();

                        if (item.isFormField()) {
                            if (item.getFieldName().equals("id")) {
                                id = Integer.parseInt(item.getString());
                            }

                            if (item.getFieldName().equals("logo")) {
                                logo = item.getString();
                            }
                            new File(caminho + File.separator + logo).delete();
                        } else {
                            out.print("Não é form field");

                        }

                    }
                    p.setId(id);
                    pDAO.alterarLogo(p);

                    response.sendRedirect("admin/form_alterar_parceiro.jsp?id=" + id);

                } catch (Exception e) {
                    out.println("Não foi possível realizar a inserção da imagem: " + e.getMessage());
                }
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
