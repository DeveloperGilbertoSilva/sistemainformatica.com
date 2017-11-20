package model;

import java.sql.*;
import java.util.ArrayList;
        
public class ParceiroDAO extends ConexaoDAO{
    public void inserirParceiro(Parceiro p)throws Exception{
        abreConexao();
        
        String insertParceiro = "INSERT INTO parceiro (nome,site,descr,logo) VALUES (?,?,?,?)";
        
        PreparedStatement pstmt = cn.prepareStatement(insertParceiro);
        pstmt.setString(1,p.getNome());
        pstmt.setString(2,p.getSite());
        pstmt.setString(3,p.getDesc());
        pstmt.setString(4,p.getLogo());
        pstmt.execute();
        
        desconectar();
    }
    
    public ArrayList<Parceiro> listaParceiro() throws Exception{
        abreConexao();
        ArrayList<Parceiro> arrayParceiro = new ArrayList<Parceiro>();
        
        String select = "SELECT * FROM parceiro";
        
        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(select);
        
        while(rs.next()){
            Parceiro p = new Parceiro();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setSite(rs.getString("site"));
            p.setDesc(rs.getString("descr"));
            p.setLogo(rs.getString("logo"));
            
            arrayParceiro.add(p);
        }
        
        return arrayParceiro;
    }
    
    public Parceiro listaParceiroEspecifico(int id) throws Exception{
        abreConexao();
        Parceiro p = new Parceiro();
        
        String select = "SELECT * FROM parceiro WHERE id= "+id;
        
        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(select);
        
        if(rs.next()){
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setSite(rs.getString("site"));
            p.setDesc(rs.getString("descr"));
            p.setLogo(rs.getString("logo"));
        }
        return p;
    }
    
    public void alterarParceiro(Parceiro p) throws Exception{
        abreConexao();
        
        String update = "UPDATE parceiro SET nome=?, site=?, descr=?, logo=? WHERE id= ?";
        
        PreparedStatement pstmt = cn.prepareStatement(update);
        pstmt.setString(1, p.getNome());
        pstmt.setString(2, p.getSite());
        pstmt.setString(3, p.getDesc());
        pstmt.setString(4, p.getLogo());
        pstmt.setInt(5, p.getId());
        pstmt.execute();
        
        desconectar();
    }
    public void alterarLogo(Parceiro p) throws Exception{
        abreConexao();
        
        String update = "UPDATE parceiro SET logo='' WHERE id= ?";
        
        PreparedStatement pstmt = cn.prepareStatement(update);
        pstmt.setInt(1, p.getId());
        pstmt.execute();
        
        desconectar();
    }
    
    
    public void excluirParceiro(Parceiro p) throws Exception{
        abreConexao();
        
        String exluir = "DELETE FROM parceiro WHERE id=?";
        
        PreparedStatement pstmt = cn.prepareStatement(exluir);
        pstmt.setInt(1,p.getId());
        pstmt.execute();
        
        desconectar();
    }
}
