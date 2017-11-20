package model;

import java.sql.*;

public class ConexaoDAO {

    Connection cn;

    public String abreConexao() {
        String msg;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistemainformatica", "root", "s3nh@host");
            msg = "Base de dados conectada com sucesso!";
        } catch (Exception e) {
            msg = "Não foi possível obter comunicação com a base de dados, motivo: " + e.getMessage();
        }

        return msg;
    }

    public void desconectar() throws Exception{
        if (!cn.isClosed()) {
            cn.close();
        }

    }
}
