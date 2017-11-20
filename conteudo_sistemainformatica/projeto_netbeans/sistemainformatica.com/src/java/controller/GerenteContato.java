/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Contato;
import model.ContatoDAO;

/**
 *
 * @author Gilberto
 */
public class GerenteContato extends HttpServlet {

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
            out.println("<title>Servlet GerenteContato</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String op = request.getParameter("op");
            String nome = request.getParameter("nome");
            String tipoContato = request.getParameter("tipo");
            String telefone = request.getParameter("telefone_contato");
            String endereco = request.getParameter("endereco_contato");
            String redeSocial = request.getParameter("redeSocial_contato");
            String outro = request.getParameter("outro_contato");
            String conteudo = "";
            int id = 0;

            Contato c = new Contato();
            ContatoDAO cDAO = new ContatoDAO();

            try {
                
                if(op.equals("alterar")||op.equals("excluir")){
                    id = Integer.parseInt(request.getParameter("id"));
                }
                
                if (op.equals("inserir")) {
                    if (tipoContato.equals("Telefone")) {
                        if (telefone.isEmpty()) {
                            out.print("<script> alert('Preencha com o TELEFONE');location='admin/form_inserirContato.jsp';</script>");
                        }else{
                            c.setConteudo(telefone);}
                    } else if (tipoContato.equals("Endereco")) {
                        if (endereco.isEmpty()) {
                            out.print("<script> alert('Preencha com o ENDEREÇO');location='admin/form_inserirContato.jsp';</script>");
                        }else{
                            c.setConteudo(endereco);
                        }
                    } else if (tipoContato.equals("Rede Social")) {
                        if (redeSocial.isEmpty()) {
                            out.print("<script> alert('Preencha com a REDE SOCIAL');location='admin/form_inserirContato.jsp';</script>");
                        }else{
                            c.setConteudo(redeSocial);}
                    } else if (tipoContato.equals("Outro")) {
                        if (outro.isEmpty()) {
                            out.print("<script> alert('Preencha com o campo OUTROS');location='admin/form_inserirContato.jsp';</script>");
                        }else{
                            c.setConteudo(outro);}
                    }
                }
                if (op.equals("alterar")) {
                    String url = "admin/form_alterarContato.jsp.jsp?id=" + id;
                    if (tipoContato.equals("Telefone")) {
                        if (telefone.isEmpty()) {
                            out.print("<script> alert('Preencha com o TELEFONE');" + "location=" + "'" + url + "'" + "</script>");
                        }else{
                            c.setConteudo(telefone);}
                    } else if (tipoContato.equals("Endereco")) {
                        if (endereco.isEmpty()) {
                            out.print("<script> alert('Preencha com o ENDEREÇO');" + "location=" + "'" + url + "'" + "</script>");
                        }else{
                            c.setConteudo(endereco);}
                    } else if (tipoContato.equals("Rede Social")) {
                        if (redeSocial.isEmpty()) {
                            out.print("<script> alert('Preencha com o REDE SOCIAL');" + "location=" + "'" + url + "'" + "</script>");
                        }else{
                            c.setConteudo(redeSocial);}
                    } else if (tipoContato.equals("Outro")) {
                        if (outro.isEmpty()) {
                            out.print("<script> alert('Preencha com o campo OUTRO');" + "location=" + "'" + url + "'" + "</script>");
                        }else{
                            c.setConteudo(outro);}
                    }
                }
                
                c.setId(id);
                c.setNome(nome);
                c.setTipo(tipoContato);
                
                
                switch(op){
                    case "inserir":cDAO.inserirContato(c);
                    break;
                    case "alterar":cDAO.alterarContato(c);
                    break;
                    case "excluir":cDAO.excluirContato(c);
                }
                response.sendRedirect("admin/lista_contato.jsp");
                
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
