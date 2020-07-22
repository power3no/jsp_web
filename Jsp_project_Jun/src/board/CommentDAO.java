package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CommentDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void commentInsert(CommentDTO dto) {
		LocalDateTime localDateTime = LocalDateTime.now();
		Timestamp date = Timestamp.valueOf(localDateTime);
		try {
			con = getConnection();
			String sql = "INSERT INTO comment VALUES(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getType());
			pstmt.setInt(2, dto.getNum());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getContent());
			pstmt.setTimestamp(5, date);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	public ArrayList<CommentDTO> commentSelect(int type, int num){
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
		con = getConnection();
		try {
			String sql = "SELECT * FROM comment WHERE type=? and num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, type);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getTimestamp("date"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return list;
	}
	
	private void dbClose(){
		if(rs != null) try{rs.close();} catch(Exception e) {}
		if(pstmt != null) try{pstmt.close();} catch(Exception e) {}
		if(con != null) try{con.close();} catch(Exception e) {}
	}
	
	private Connection getConnection(){
		
		// 커넥션 풀 (Connection Pool)
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
			con = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
		return con;
	}
}
