package model;

import java.sql.*;
import java.util.ArrayList;

public class ClienteDAO extends ConexaoDAO {

    public void inserirCliente(Cliente c) throws Exception {
        abreConexao();

        String insertCliente = "INSERT INTO cliente (nome,site,descricao,logo) VALUES (?,?,?,?)";

        PreparedStatement pstmt = cn.prepareStatement(insertCliente);
        pstmt.setString(1, c.getNome());
        pstmt.setString(2, c.getSite());
        pstmt.setString(3, c.getDesc());
        pstmt.setString(4, c.getLogo());
        pstmt.execute();

        desconectar();
    }

    public ArrayList<Cliente> listaCliente() throws Exception {
        abreConexao();
        ArrayList<Cliente> arrayCliente = new ArrayList<Cliente>();

        String select = "SELECT * FROM cliente";

        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(select);

        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setSite(rs.getString("site"));
            c.setDesc(rs.getString("descricao"));
            c.setLogo(rs.getString("logo"));

            arrayCliente.add(c);
        }

        return arrayCliente;
    }
    
    public Cliente listaClienteEspecifico(int id) throws Exception{
        abreConexao();
        Cliente c = new Cliente();
        
        String select = "SELECT * FROM cliente WHERE id= "+id;
        
        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(select);
        
        if(rs.next()){
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setSite(rs.getString("site"));
            c.setDesc(rs.getString("descricao"));
            c.setLogo(rs.getString("logo"));
        }
        return c;
    }
    
    public void alterarCliente (Cliente c) throws Exception{
        abreConexao();
        
        String update = "UPDATE cliente SET nome=?, site=?, descricao=?, logo=? WHERE id= ?";
        
        PreparedStatement pstmt = cn.prepareStatement(update);
        pstmt.setString(1, c.getNome());
        pstmt.setString(2, c.getSite());
        pstmt.setString(3, c.getDesc());
        pstmt.setString(4, c.getLogo());
        pstmt.setInt(5, c.getId());
        pstmt.execute();
        
        desconectar();
    }
    
    public void alterarLogo(Cliente c) throws Exception{
        abreConexao();
        
        String update = "UPDATE cliente SET logo=? WHERE id= ?";
        
        PreparedStatement pstmt = cn.prepareStatement(update);
        pstmt.setString(1, c.getLogo());
        pstmt.setInt(2, c.getId());
        pstmt.execute();
        
        desconectar();
    }
    public void excluirCliente(Cliente c) throws Exception{
        abreConexao();
        
        String exluir = "DELETE FROM cliente WHERE id=?";
        
        PreparedStatement pstmt = cn.prepareStatement(exluir);
        pstmt.setInt(1,c.getId());
        pstmt.execute();
        
        desconectar();
    }
    
}
