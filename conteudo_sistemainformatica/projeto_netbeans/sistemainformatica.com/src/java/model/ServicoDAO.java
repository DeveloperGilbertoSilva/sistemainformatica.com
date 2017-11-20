package model;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;

public class ServicoDAO extends ConexaoDAO {

    public void inserirServico(Servico s) throws Exception {
        abreConexao();
        String insert = "INSERT INTO servico (nome,diretorio,conteudo,imagem) VALUES (?,?,?,?)";

        PreparedStatement pstm = cn.prepareStatement(insert);
        pstm.setString(1, s.getNome());
        pstm.setString(2, s.getDiretorio());
        pstm.setString(3, s.getConteudo());
        pstm.setString(4, s.getImagem());
        pstm.execute();

        desconectar();
    }

    public ArrayList<Servico> listaServico() throws Exception {
        abreConexao();
        ArrayList<Servico> arrayServico = new ArrayList<Servico>();

        String selectServico = "SELECT * FROM servico";

        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(selectServico);

        while (rs.next()) {
            Servico s = new Servico();
            s.setId(rs.getInt("id"));
            s.setNome(rs.getString("nome"));
            s.setDiretorio(rs.getString("diretorio"));
            s.setConteudo(rs.getString("conteudo"));
            s.setImagem(rs.getString("imagem"));

            arrayServico.add(s);
        }

        return arrayServico;
    }

    public Servico listaServicoEspecifico(int id) throws Exception {
        abreConexao();
        Servico s = new Servico();

        String selectEspecifico = "SELECT * FROM servico WHERE id =" + id;
        PreparedStatement pstmt = cn.prepareStatement(selectEspecifico);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            s.setId(rs.getInt("id"));
            s.setNome(rs.getString("nome"));
            s.setDiretorio(rs.getString("diretorio"));
            s.setConteudo(rs.getString("conteudo"));
            s.setImagem(rs.getString("imagem"));
        }

        return s;
    }

    public void alterarServico(Servico s) throws Exception {
        abreConexao();
        String alterar = "UPDATE servico SET nome=?, diretorio=?, conteudo=?, imagem=? WHERE id=?";

        PreparedStatement pstmt = cn.prepareStatement(alterar);
        pstmt.setString(1, s.getNome());
        pstmt.setString(2, s.getDiretorio());
        pstmt.setString(3, s.getConteudo());
        pstmt.setString(4, s.getImagem());
        pstmt.setInt(5, s.getId());
        pstmt.execute();

        desconectar();
    }

    public void deletarServico(Servico s) throws Exception {
        abreConexao();
        String deletar = "DELETE FROM servico WHERE id=?";
        PreparedStatement pstmt = cn.prepareStatement(deletar);
        pstmt.setInt(1, s.getId());
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
