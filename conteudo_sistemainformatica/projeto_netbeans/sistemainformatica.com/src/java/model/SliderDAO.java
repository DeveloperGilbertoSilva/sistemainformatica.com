package model;

import java.sql.*;
import java.util.ArrayList;

public class SliderDAO extends ConexaoDAO {

    public void inserirImagemImagemSlider(Slider s) throws Exception {
        abreConexao();
        String sql = "INSERT INTO slider (id,imagem,ordem) VALUES(?,?,?)";

        PreparedStatement pstmt = cn.prepareStatement(sql);
        pstmt.setInt(1, s.getId());
        pstmt.setString(2, s.getImagem());
        pstmt.setString(3, s.getOrdem());
        pstmt.execute();

        desconectar();
    }

    public ArrayList<Slider> listaImagens() throws Exception {
        abreConexao();
        String sql = "SELECT * FROM slider";

        ArrayList<Slider> arrayImagemSlider = new ArrayList<Slider>();

        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            Slider s = new Slider();
            s.setId(rs.getInt("id"));
            s.setImagem(rs.getString("imagem"));
            s.setOrdem(rs.getString("ordem"));
            arrayImagemSlider.add(s);
        }

        desconectar();
        return arrayImagemSlider;
    }
    public ArrayList<Slider> ordenaImagemSlider() throws Exception {
        abreConexao();
        String sql = "SELECT * FROM slider ORDER BY ordem";

        ArrayList<Slider> arrayImagemSlider = new ArrayList<Slider>();

        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            Slider s = new Slider();
            s.setId(rs.getInt("id"));
            s.setImagem(rs.getString("imagem"));
            s.setOrdem(rs.getString("ordem"));
            arrayImagemSlider.add(s);
        }

        desconectar();
        return arrayImagemSlider;
    }

    public Slider listaImagemEspecifica(int id) throws Exception {
        abreConexao();
        String sql = "SELECT * FROM slider WHERE id=" + id;

        Slider s = new Slider();

        PreparedStatement pstmt = cn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            s.setId(rs.getInt("id"));
            s.setImagem(rs.getString("imagem"));
            s.setOrdem(rs.getString("ordem"));
        }
        desconectar();

        return s;
    }

    public void updateImagemImagemSlider(Slider s) throws Exception {
        abreConexao();
        String alterar = "UPDATE slider SET imagem=? WHERE id=?";
        PreparedStatement pstmt = cn.prepareStatement(alterar);
        pstmt.setString(1, s.getImagem());
        pstmt.setInt(2, s.getId());
        pstmt.execute();

        desconectar();
    }
    public void alterarImagemSlider(Slider s) throws Exception {
        abreConexao();
        String alterar = "UPDATE slider SET imagem=?, ordem=? WHERE id=?";
        PreparedStatement pstmt = cn.prepareStatement(alterar);
        pstmt.setString(1, s.getImagem());
        pstmt.setString(2, s.getOrdem());
        pstmt.setInt(3, s.getId());
        pstmt.execute();

        desconectar();
    }
    
    
    public void deleteImagemSlider (Slider s) throws Exception{
        abreConexao();
        String delete = "DELETE FROM slider WHERE id=?";
        
        PreparedStatement pstmt = cn.prepareStatement(delete);
        pstmt.setInt(1, s.getId());
        pstmt.execute();
        
        desconectar();
    }
}
