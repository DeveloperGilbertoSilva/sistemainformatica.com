package model;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;

public class CategoriaServicoDAO extends ConexaoDAO {

    public void inserirCategoria(CategoriaServico cs) throws Exception {
        abreConexao();
        String insert = "INSERT INTO categoria_servico (nome,diretorio,servico,imagem) VALUES (?,?,?,?)";

        PreparedStatement pstmt = cn.prepareStatement(insert);
        pstmt.setString(1, cs.getNome());
        pstmt.setString(2, cs.getDiretorio());
        pstmt.setString(3, cs.getServico());
        pstmt.setString(4, cs.getImagem());
        pstmt.execute();

        desconectar();

    }

    public ArrayList<CategoriaServico> listaCategoria() throws Exception {
        abreConexao();

        ArrayList<CategoriaServico> arrayCategoria = new ArrayList<CategoriaServico>();
        String select = "SELECT * FROM categoria_servico";

        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(select);

        while (rs.next()) {
            CategoriaServico cs = new CategoriaServico();

            cs.setId(rs.getInt("id"));
            cs.setNome(rs.getString("nome"));
            cs.setDiretorio(rs.getString("diretorio"));
            cs.setServico(rs.getString("servico"));
            cs.setImagem(rs.getString("imagem"));

            arrayCategoria.add(cs);
        }
        desconectar();

        return arrayCategoria;
    }

    public int limitaIcons(String servico) throws Exception {
        abreConexao();
        int quantidade = 0;

        String select_count = "Select count(id) FROM categoria_servico WHERE servico ="+"'"+servico+"'";

        PreparedStatement pstmt = cn.prepareStatement(select_count);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            quantidade = rs.getInt("COUNT(id)");
        }

        desconectar();
        return quantidade;
    }

    public CategoriaServico listaCategoriaServicoEspecifica(int id) throws Exception {
        abreConexao();
        String select_especifico = "SELECT * FROM categoria_servico WHERE id =" + id;

        CategoriaServico cs = new CategoriaServico();

        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(select_especifico);

        if (rs.next()) {
            cs.setId(rs.getInt("id"));
            cs.setNome(rs.getString("nome"));
            cs.setDiretorio(rs.getString("diretorio"));
            cs.setServico(rs.getString("servico"));
            cs.setImagem(rs.getString("imagem"));
        }

        desconectar();

        return cs;
    }
    public CategoriaServico listaCategoriaPorCategoria(String categoria) throws Exception {
        abreConexao();
        String select_especifico = "SELECT * FROM categoria_servico WHERE nome="+"'"+categoria+"'";

        CategoriaServico cs = new CategoriaServico();

        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(select_especifico);

        if (rs.next()) {
            cs.setId(rs.getInt("id"));
            cs.setNome(rs.getString("nome"));
            cs.setDiretorio(rs.getString("diretorio"));
            cs.setServico(rs.getString("servico"));
            cs.setImagem(rs.getString("imagem"));
        }

        desconectar();

        return cs;
    }

    public void alterarCategoria(CategoriaServico cs) throws Exception {
        abreConexao();
        String alterar = "UPDATE categoria_servico SET nome=?,diretorio=?,servico=?,imagem=? WHERE id = ?";

        PreparedStatement pstmt = cn.prepareStatement(alterar);
        pstmt.setString(1, cs.getNome());
        pstmt.setString(2, cs.getDiretorio());
        pstmt.setString(3, cs.getServico());
        pstmt.setString(4, cs.getImagem());
        pstmt.setInt(5, cs.getId());
        pstmt.execute();

        desconectar();
    }

    public void alterarImagemCategoria(CategoriaServico cs) throws Exception {
        abreConexao();
        String alterar = "UPDATE categoria_servico SET imagem=? WHERE id = ?";

        PreparedStatement pstmt = cn.prepareStatement(alterar);
        pstmt.setString(1, cs.getImagem());
        pstmt.setInt(2, cs.getId());
        pstmt.execute();

        desconectar();
    }
    public void alterarDiretorioCategoria(String novoDiretorio, String diretorioAntigo) throws Exception {
        abreConexao();
        String alterar = "UPDATE categoria_servico SET servico="+"'"+novoDiretorio+"'"+"WHERE servico="+"'"+diretorioAntigo+"'";
        
        PreparedStatement pstmt = cn.prepareStatement(alterar);
        pstmt.execute();

        desconectar();
    }

    public void excluirCategoria(CategoriaServico cs) throws Exception {
        abreConexao();
        String delete = "DELETE FROM categoria_servico WHERE id = ?";

        PreparedStatement pstmt = cn.prepareStatement(delete);
        pstmt.setInt(1, cs.getId());
        pstmt.execute();

        desconectar();
    }
    public void deletarCategoriaPorServico(String servico) throws Exception {
        abreConexao();
        String delete = "DELETE FROM categoria_servico WHERE servico="+"'"+servico+"'";

        PreparedStatement pstmt = cn.prepareStatement(delete);
        pstmt.execute();

        desconectar();
    }

    public boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (int i = 0; i < children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }

        // Agora o diretório está vazio, restando apenas deletá-lo.
        return dir.delete();
    }
}
