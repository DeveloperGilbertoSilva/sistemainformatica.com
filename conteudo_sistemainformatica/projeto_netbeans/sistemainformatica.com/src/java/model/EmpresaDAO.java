package model;

import java.sql.*;

public class EmpresaDAO extends ConexaoDAO {

    /*=====================================SELECTS=====================================*/
    public Empresa listaDescricao(Empresa e) throws Exception{
        abreConexao();
        String listaHistorico = "SELECT * FROM sistema_informatica WHERE id = 1";
        
        PreparedStatement pstmt = cn.prepareStatement(listaHistorico);
        ResultSet rs = pstmt.executeQuery();
        
        if(rs.next()){
            e.setHistorico(rs.getString("historico"));
            e.setVisao(rs.getString("visao"));
            e.setMissao(rs.getString("missao"));
            e.setValores(rs.getString("valores"));
            e.setEquipe(rs.getString("equipe"));
        }
        
        desconectar();
        return e;
    }
    
    public Empresa listaHistorico(Empresa e) throws Exception{
        abreConexao();
        String listaHistorico = "SELECT historico FROM sistema_informatica WHERE id = 1";
        
        PreparedStatement pstmt = cn.prepareStatement(listaHistorico);
        ResultSet rs = pstmt.executeQuery();
        
        if(rs.next()){
            e.setHistorico(rs.getString("historico"));
        }
        
        desconectar();
        return e;
    }
    
    public Empresa listaVisao(Empresa e) throws Exception{
        abreConexao();
        String listaVisao = "SELECT visao FROM sistema_informatica WHERE id = 1";
        
        PreparedStatement pstmt = cn.prepareStatement(listaVisao);
        ResultSet rs = pstmt.executeQuery();
        
        if(rs.next()){
            e.setVisao(rs.getString("visao"));
        }
        
        desconectar();
        return e;
    }
    
    public Empresa listaMissao(Empresa e) throws Exception{
        abreConexao();
        String listaMissao= "SELECT missao FROM sistema_informatica WHERE id = 1";
        
        PreparedStatement pstmt = cn.prepareStatement(listaMissao);
        ResultSet rs = pstmt.executeQuery();
        
        if(rs.next()){
            e.setMissao(rs.getString("missao"));
        }
        
        desconectar();
        return e;
    }
    
    public Empresa listaValores(Empresa e) throws Exception{
        abreConexao();
        String listaValores = "SELECT valores FROM sistema_informatica WHERE id = 1";
        
        PreparedStatement pstmt = cn.prepareStatement(listaValores);
        ResultSet rs = pstmt.executeQuery();
        
        if(rs.next()){
            e.setValores(rs.getString("valores"));
        }
        
        desconectar();
        return e;
    }
    
    public Empresa listaEquipe(Empresa e) throws Exception{
        abreConexao();
        String listaEquipe = "SELECT equipe FROM sistema_informatica WHERE id = 1";
        
        PreparedStatement pstmt = cn.prepareStatement(listaEquipe);
        ResultSet rs = pstmt.executeQuery();
        
        if(rs.next()){
            e.setEquipe(rs.getString("equipe"));
        }
        
        desconectar();
        return e;
    }
    
    
    /*=====================================UPDATES=====================================*/
    
    public void updateHistorico(Empresa e) throws Exception{
        abreConexao();
        String updateHistorico = "UPDATE sistema_informatica SET historico = ? WHERE id = 1";
        
        PreparedStatement pstmt = cn.prepareStatement(updateHistorico);
        pstmt.setString(1, e.getHistorico());
        pstmt.execute();
        
        desconectar();
    }
    
    public void updateVisao(Empresa e) throws Exception{
        abreConexao();
        String updateVisao = "UPDATE sistema_informatica SET visao = ? WHERE id = 1";
        
        PreparedStatement pstmt = cn.prepareStatement(updateVisao);
        pstmt.setString(1, e.getVisao());
        pstmt.execute();
        
        desconectar();
    }
    
    public void updateMissao(Empresa e) throws Exception{
        abreConexao();
        String updateMissao= "UPDATE sistema_informatica SET missao = ? WHERE id = 1";
        
        PreparedStatement pstmt = cn.prepareStatement(updateMissao);
        pstmt.setString(1, e.getMissao());
        pstmt.execute();
        
        desconectar();
    }
    
    public void updateValores(Empresa e) throws Exception{
        abreConexao();
        String updateValores = "UPDATE sistema_informatica SET valores = ? WHERE id = 1";
        
        PreparedStatement pstmt = cn.prepareStatement(updateValores);
        pstmt.setString(1, e.getValores());
        pstmt.execute();
        
        desconectar();
    }
    
    public void updateEquipe(Empresa e) throws Exception{
        abreConexao();
        String updateEquipe= "UPDATE sistema_informatica SET equipe = ? WHERE id = 1";
        
        PreparedStatement pstmt = cn.prepareStatement(updateEquipe);
        pstmt.setString(1, e.getEquipe());
        pstmt.execute();
        
        desconectar();
    }
    

}
