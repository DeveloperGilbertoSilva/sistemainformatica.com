package model;

import java.sql.*;
import java.util.ArrayList;

public class IndexDAO extends ConexaoDAO {
    public Index listaInfo() throws Exception{
        abreConexao();
        String sql = "SELECT logo FROM pag_inicial WHERE id =1";
        
        Index i = new Index();
        
        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        
        if(rs.next()){
            i.setLogo(rs.getString("logo"));
        }
     
        return i;
    }
    
    public void alterarPaginaInicial(Index i) throws Exception {
        abreConexao();
        String update = "UPDATE pag_inicial SET logo=? WHERE id=1";
        
        PreparedStatement pstmt = cn.prepareStatement(update);
        pstmt.setString(1, i.getLogo());
        pstmt.execute();
        
        desconectar();
    }
    
    public void alterarLogo(Index i) throws Exception {
        abreConexao();
        String update = "UPDATE pag_inicial SET logo=? WHERE id=1";
        
        PreparedStatement pstmt = cn.prepareStatement(update);
        pstmt.setString(1, i.getLogo());
        pstmt.execute();
        
        desconectar();
    }
    
    
}
