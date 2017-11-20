package model;

import java.sql.*;
import java.util.ArrayList;

public class GaleriaCategoriaDAO extends ConexaoDAO {

    public void inserirImagemGaleria(GaleriaCategoria g) throws Exception {
        abreConexao();
        String inserir = "INSERT INTO galeria (categoria,imagem,servico) VALUES (?,?,?)";

        PreparedStatement pstmt = cn.prepareStatement(inserir);
        pstmt.setString(1, g.getCategoria());
        pstmt.setString(2, g.getImagem());
        pstmt.setString(3, g.getServico());
        pstmt.execute();

        desconectar();
    }

    public ArrayList<GaleriaCategoria> listaImagemGaleria() throws Exception {
        abreConexao();
        String select = "SELECT * FROM galeria";

        ArrayList<GaleriaCategoria> arrayGaleria = new ArrayList<GaleriaCategoria>();

        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(select);

        while (rs.next()) {
            GaleriaCategoria g = new GaleriaCategoria();
            g.setId(rs.getInt("id"));
            g.setCategoria(rs.getString("categoria"));
            g.setImagem(rs.getString("imagem"));
            g.setServico(rs.getString("servico"));
            arrayGaleria.add(g);
        }
        desconectar();

        return arrayGaleria;
    }
    
    public ArrayList<GaleriaCategoria> listaGaleriaCategoria(String categoria) throws Exception {
        abreConexao();
        String select = "SELECT * FROM galeria WHERE categoria = "+"'"+categoria+"'";

        ArrayList<GaleriaCategoria> arrayGaleria = new ArrayList<GaleriaCategoria>();

        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(select);

        while (rs.next()) {
            GaleriaCategoria g = new GaleriaCategoria();
            g.setId(rs.getInt("id"));
            g.setCategoria(rs.getString("categoria"));
            g.setImagem(rs.getString("imagem"));
            arrayGaleria.add(g);
        }
        desconectar();

        return arrayGaleria;
    }

    public GaleriaCategoria listaImagemGaleriaEspecifica(int id) throws Exception {
        abreConexao();
        GaleriaCategoria g = new GaleriaCategoria();

        String selectEspecifico = "SELECT * FROM galeria WHERE id =" + id;
        PreparedStatement pstmt = cn.prepareStatement(selectEspecifico);
        ResultSet rs = pstmt.executeQuery(selectEspecifico);

        if (rs.next()) {
            g.setId(rs.getInt("id"));
            g.setCategoria(rs.getString("categoria"));
            g.setImagem(rs.getString("imagem"));

        }

        return g;
    }

    public void alterarGaleria(GaleriaCategoria g) throws Exception {
        abreConexao();
        String alterar = "UPDATE galeria SET categoria=?, imagem=? WHERE id=?";

        PreparedStatement pstmt = cn.prepareStatement(alterar);
        pstmt.setString(1, g.getCategoria());
        pstmt.setString(2, g.getImagem());
        pstmt.setInt(3, g.getId());
        pstmt.execute();

        desconectar();
    }
    public void alterarImagem(GaleriaCategoria g) throws Exception {
        abreConexao();
        String alterar = "UPDATE galeria SET imagem=? WHERE id=?";

        PreparedStatement pstmt = cn.prepareStatement(alterar);
        pstmt.setString(1, g.getImagem());
        pstmt.setInt(2, g.getId());
        pstmt.execute();

        desconectar();
    }
    public void alterarDiretorioGaleria(String novaCategoria, String categoriaAntiga) throws Exception {
        abreConexao();
        String alterar = "UPDATE galeria SET categoria="+"'"+novaCategoria+"'"+"WHERE categoria="+"'"+categoriaAntiga+"'";
        
        PreparedStatement pstmt = cn.prepareStatement(alterar);
        pstmt.execute();

        desconectar();
    }
    public void alterarServicoGaleria(String servicoAntigo, String novoServico) throws Exception {
        abreConexao();
        String alterar = "UPDATE galeria SET servico="+"'"+servicoAntigo+"'"+"WHERE servico="+"'"+novoServico+"'";
        
        PreparedStatement pstmt = cn.prepareStatement(alterar);
        pstmt.execute();

        desconectar();
    }

    public void deletarImagemGaleria(GaleriaCategoria g) throws Exception {
        abreConexao();
        String deletar = "DELETE FROM galeria WHERE id=?";
        PreparedStatement pstmt = cn.prepareStatement(deletar);
        pstmt.setInt(1, g.getId());
        pstmt.execute();
        desconectar();
    }
    public void deletarGaleriaPorCategoria(String categoria) throws Exception {
        abreConexao();
        String delete = "DELETE FROM galeria WHERE categoria ="+"'"+categoria+"'";

        PreparedStatement pstmt = cn.prepareStatement(delete);
        pstmt.execute();

        desconectar();
    }
    public void deletarGaleriaPorServico(String servico) throws Exception {
        abreConexao();
        String delete = "DELETE FROM galeria WHERE servico ="+"'"+servico+"'";

        PreparedStatement pstmt = cn.prepareStatement(delete);
        pstmt.execute();

        desconectar();
    }
}
