package model;
import java.sql.*;
import java.util.ArrayList;
public class ContatoDAO extends ConexaoDAO{
    public void inserirContato(Contato c) throws Exception{
        abreConexao();
        
        String insertContato = "INSERT INTO contato (nome,tipo,conteudo) VALUES (?,?,?)";
        
        PreparedStatement pstmt = cn.prepareStatement(insertContato);
        pstmt.setString(1, c.getNome());
        pstmt.setString(2, c.getTipo());
        pstmt.setString(3, c.getConteudo());
        pstmt.execute();
        
        desconectar();
    }
    
    public ArrayList<Contato> listaContato() throws Exception{
        abreConexao();
        
        ArrayList<Contato> arrayContato = new ArrayList<Contato>();
        
        String select = "SELECT * FROM contato";
        
        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(select);
        
        while(rs.next()){
            Contato c = new Contato();
            
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setTipo(rs.getString("tipo"));
            c.setConteudo(rs.getString("conteudo"));
            
            arrayContato.add(c);
        }
        
        return arrayContato;
    }
    
    public Contato listaContatoEspecifico(int id) throws Exception{
        abreConexao();
        Contato c = new Contato();
        
        String select = "SELECT * FROM contato WHERE id= "+id;
        
        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(select);
        
        if(rs.next()){
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setTipo(rs.getString("tipo"));
            c.setConteudo(rs.getString("conteudo"));
        }
        return c;
    }
    
    public void alterarContato(Contato c) throws Exception{
        abreConexao();
        
        String update = "UPDATE contato SET nome=?, tipo=?, conteudo=? WHERE id=?";
        
        PreparedStatement pstmt = cn.prepareStatement(update);
        pstmt.setString(1, c.getNome());
        pstmt.setString(2, c.getTipo());
        pstmt.setString(3, c.getConteudo());
        pstmt.setInt(4, c.getId());
        pstmt.execute();
        
        desconectar();
    }
    
    public void excluirContato (Contato c) throws Exception{
        abreConexao();
        
        String excluir = "DELETE FROM contato WHERE id=?";
        
        PreparedStatement pstmt = cn.prepareStatement(excluir);
        pstmt.setInt(1,c.getId());
        pstmt.execute();
        
        desconectar();
    }
}
