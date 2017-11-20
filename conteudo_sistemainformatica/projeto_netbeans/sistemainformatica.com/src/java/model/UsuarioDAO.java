package model;
import java.sql.*;

public class UsuarioDAO extends ConexaoDAO {
    public Usuario listaAutenticacao(Usuario u) throws Exception{
        abreConexao();
        String select = "SELECT * FROM usuario WHERE id = 1";
        
        PreparedStatement pstmt = cn.prepareStatement(select);
        ResultSet rs = pstmt.executeQuery();
        
        if(rs.next()){
            u.setLogin(rs.getString("login"));
            u.setSenha(rs.getString("senha"));
        }
        return u;
    }
    
    public void alterarAutenticacao(Usuario u) throws Exception {
        abreConexao();
        
        String update = "UPDATE usuario SET login=?, senha=? WHERE id=1";
        
        PreparedStatement pstmt = cn.prepareStatement(update);
        pstmt.setString(1,u.getLogin());
        pstmt.setString(2,u.getSenha());
        pstmt.execute();
        
        desconectar();
    }
}
