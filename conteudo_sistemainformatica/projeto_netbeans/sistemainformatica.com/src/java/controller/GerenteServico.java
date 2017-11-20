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
import model.Servico;
import model.ServicoDAO;
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
public class GerenteServico extends HttpServlet {

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
            out.println("<title>Servlet GerenteServico</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String op = "";
            int id = 0;
            String nome = "";
            String nome_diretorio = "";
            String nomeAntigo = "";
            String conteudo = "";
            String nomeImagem = "";

            /*========EXCLUIR========*/
            String opExcluir = request.getParameter("opExcluir");
            int idExcluir = 0;
            String imagemExcluir = request.getParameter("imagemExcluir");
            String diretorio = request.getParameter("diretorio");
            String servico = request.getParameter("servico");

            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);

            Servico s = new Servico();
            Servico sAlterar = new Servico();
            ServicoDAO sDAO = new ServicoDAO();

            GaleriaCategoriaDAO gDAO = new GaleriaCategoriaDAO();
            CategoriaServicoDAO csDAO = new CategoriaServicoDAO();
            ArrayList<CategoriaServico> arrayCategoria = new ArrayList<CategoriaServico>();
            ArrayList<GaleriaCategoria> arrayGaleria = new ArrayList<GaleriaCategoria>();

            try {
                arrayCategoria = csDAO.listaCategoria();
                arrayGaleria = gDAO.listaImagemGaleria();

                if (isMultiPart) {
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
                            if (item.getFieldName().equals("nome")) {
                                nome = item.getString();
                            }
                            if (item.getFieldName().equals("nome_diretorio")) {
                                nome_diretorio = item.getString();
                            }
                            if (item.getFieldName().equals("nomeAntigo")) {
                                nomeAntigo = item.getString();
                            }
                            if (item.getFieldName().equals("descricao")) {
                                conteudo = item.getString();
                            }

                            if (op.equals("alterar")) {
                                s = sDAO.listaServicoEspecifico(id);
                                if (!nome_diretorio.equals(s.getDiretorio())) {
                                    File file = new File(caminho + File.separator + s.getDiretorio());
                                    file.renameTo(new File(caminho + File.separator + nome_diretorio));
                                }
                            }

                            if (op.equals("alterar")) {
                                for (CategoriaServico cs : arrayCategoria) {
                                    if (!nome_diretorio.equals(cs.getServico())) {
                                        cs.setServico(nome_diretorio);
                                        csDAO.alterarDiretorioCategoria(nome_diretorio, nomeAntigo);
                                    }
                                }
                                for (GaleriaCategoria g : arrayGaleria) {
                                    if (!nome_diretorio.equals(g.getServico())) {
                                        g.setServico(nome_diretorio);
                                        gDAO.alterarServicoGaleria(nome_diretorio, nomeAntigo);
                                    }
                                }
                            }

                        } else {
                            if (op.equals("alterar")) {
                                imagem = new File(item.getName()).getName();
                                s = sDAO.listaServicoEspecifico(id);
                                imagemPattern = s.getImagem();

                                if (imagem.isEmpty()) {
                                    nomeImagem = imagemPattern;
                                } else {
                                    imagem = new File(item.getName()).getName();
                                    item.write(new File(caminho + File.separator + nome_diretorio + File.separator + imagem));

                                    nomeImagem = imagem;
                                }
                            } else if (op.equals("inserir")) {
                                imagem = new File(item.getName()).getName();

                                File f = null;
                                f = new File(caminho + File.separator + nome_diretorio);
                                if (!f.exists()) {
                                    f.mkdir();
                                }
                                item.write(new File(caminho + File.separator + nome_diretorio + File.separator + imagem));

                                nomeImagem = imagem;

                            }
                        }
                    }
                }
                s.setId(id);
                s.setNome(nome);
                s.setDiretorio(nome_diretorio);
                s.setConteudo(conteudo);
                s.setImagem(nomeImagem);

                switch (op) {
                    case "inserir":
                        sDAO.inserirServico(s);
                        break;
                    case "alterar":
                        sDAO.alterarServico(s);
                }

                response.sendRedirect("admin/lista_servico.jsp");
            } catch (Exception e) {
                out.print("Não foi possível realizar a ação do serviço: " + e.getMessage());
            }

            try {
                if (opExcluir.equals("excluir")) {
                    idExcluir = Integer.parseInt(request.getParameter("idExcluir"));

                    s.setId(idExcluir);
                    sDAO.deletarServico(s);

                    csDAO.deletarCategoriaPorServico(servico);
                    gDAO.deletarGaleriaPorServico(servico);

                    String caminho = getServletContext().getRealPath("/servico");
                    new File(caminho + File.separator + imagemExcluir).delete();

                    boolean success = (new File(caminho + File.separator + diretorio)).delete();
                    if (!success) {
                        File f = new File(caminho + File.separator + diretorio);
                        sDAO.deleteDir(f);
                    }

                    response.sendRedirect("admin/lista_servico.jsp");
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
