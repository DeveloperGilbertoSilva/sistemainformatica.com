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
import model.Empresa;
import model.EmpresaDAO;

/**
 *
 * @author Gilberto
 */
public class GerenteEmpresa extends HttpServlet {

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
            out.println("<title>Servlet GerenteEmpresa</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String tema = request.getParameter("tema");
            String descricao = request.getParameter("descricao");
            int id = 1;

            
            
            try {
                
                Empresa e = new Empresa();
                EmpresaDAO eDAO = new EmpresaDAO();
                
                switch(tema){
                    case "historico":
                        e.setHistorico(descricao);
                        eDAO.updateHistorico(e);
                    break;
                    case "visao":
                        e.setVisao(descricao);
                        eDAO.updateVisao(e);
                    break;
                    case "missao":
                        e.setMissao(descricao);
                        eDAO.updateMissao(e);
                    break;
                    case "valores":
                        e.setValores(descricao);
                        eDAO.updateValores(e);
                    break;
                    case "equipe":
                        e.setEquipe(descricao);
                        eDAO.updateEquipe(e);
                    break;
                }
                
                response.sendRedirect("admin/lista_tema_empresa.jsp");
                
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
