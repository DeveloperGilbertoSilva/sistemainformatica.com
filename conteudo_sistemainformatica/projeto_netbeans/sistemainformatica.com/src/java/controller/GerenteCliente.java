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
import model.Cliente;
import model.ClienteDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Gilberto
 */
public class GerenteCliente extends HttpServlet {

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
            out.println("<title>Servlet GerenteCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String op = "";
            int id = 0;
            String nome = "";
            String site = "";
            String descricao = "";
            String nomeImagem = "";
            
            /*=========EXCLUIR=========*/
            String opExcluir = request.getParameter("opExcluir");
            String imagemExcluir = request.getParameter("imagemExcluir");
            int idExcluir = 0;

            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            Cliente c = new Cliente();
            Cliente cAltera = new Cliente();
            ClienteDAO cDAO = new ClienteDAO();

            try {
                if (isMultipart) {
                    try {
                        String caminho = getServletContext().getRealPath("/cliente");
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
                                if (item.getFieldName().equals("descricao")) {
                                    descricao = item.getString();
                                }
                            } else {
                                if (op.equals("alterar")) {
                                    imagem = new File(item.getName()).getName();
                                    cAltera = cDAO.listaClienteEspecifico(id);
                                    imgPattern = cAltera.getLogo();

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
                        out.println("ERRO: "+e.getMessage());
                    }
                }
                
                c.setId(id);
                c.setNome(nome);
                c.setSite(site);
                c.setDesc(descricao);
                c.setLogo(nomeImagem);
                
                switch(op){
                    case "inserir":cDAO.inserirCliente(c);
                    break;
                    case "alterar":cDAO.alterarCliente(c);
                }

                response.sendRedirect("admin/lista_cliente.jsp");
            } catch (Exception e) {
                out.println("ERRO: "+e.getMessage());
            }
            try{
                if(opExcluir.equals("excluir")){
                    idExcluir=Integer.parseInt(request.getParameter("idExcluir"));
                    
                    c.setId(idExcluir);
                    cDAO.excluirCliente(c);
                    
                    String caminho = getServletContext().getRealPath("/cliente");
                    new File(caminho + File.separator + imagemExcluir).delete();
                    
                    response.sendRedirect("admin/lista_cliente.jsp");
                }
            }
            catch(Exception e){
                out.println("ERRO: "+e.getMessage());
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
