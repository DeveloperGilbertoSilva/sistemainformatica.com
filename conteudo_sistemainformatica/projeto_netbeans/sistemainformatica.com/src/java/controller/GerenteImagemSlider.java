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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.Slider;
import model.SliderDAO;
/**
 *
 * @author Gilberto
 */
public class GerenteImagemSlider extends HttpServlet {

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
            out.println("<title>Servlet GerenteImagemSlider</title>");            
            out.println("</head>");
            out.println("<body>");
            
             int id = 0;
            String nome = "";
            
            Slider s = new Slider();
            SliderDAO sDAO = new SliderDAO();
            
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            
            try {
                        
                if(isMultipart){
                    String caminho = getServletContext().getRealPath("/slider");
                    String imagem = "";
                    
                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    List<FileItem> list = upload.parseRequest(request);
                    Iterator<FileItem> iter = list.iterator();
                    
                    while(iter.hasNext()){
                        FileItem item = iter.next();
                        
                        if(item.isFormField()){
                            if(item.getFieldName().equals("idSlider")){
                                id = Integer.parseInt(item.getString());
                            }
                            if(item.getFieldName().equals("nome")){
                                nome = item.getString();
                            }
                            new File(caminho + File.separator + nome).delete();
                        }
                    }
                
            }
                s.setId(id);
                s.setImagem("");
                sDAO.updateImagemImagemSlider(s);
                
                response.sendRedirect("admin/form_alterar_imagem_slider.jsp?id="+id);
            } 
            catch (Exception e) {
                out.print("ERRO: "+e.getMessage());
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