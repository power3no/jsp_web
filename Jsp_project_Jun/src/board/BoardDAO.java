package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public void boardWrite(int type, BoardDTO dto) {
		LocalDateTime localDateTime = LocalDateTime.now();
		Timestamp date = Timestamp.valueOf(localDateTime);
		try {
			con = getConnection();
			String sql = "INSERT INTO board VALUES(0,?,?,?,?,?,0,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, type);
				pstmt.setString(2, dto.getId());
				pstmt.setString(3, dto.getSubject());
				pstmt.setString(4, dto.getContent());
				pstmt.setString(5, dto.getFile());
				pstmt.setTimestamp(6, date);
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
	
	
	
	public void contentDelete(int num) {
		try {
			con = getConnection();
			String sql = "DELETE FROM board WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			sql = "DELTE FROM comment WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			sql = "ALTER TABLE board AUTO_INCREMENT=1";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "SET @CNT = 0";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "UPDATE board SET board.num = @CNT:=@CNT+1";
			pstmt = con.prepareStatement(sql);
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
	
	public void contentUpdate(int num, BoardDTO dto) {
		
			try {
				con = getConnection();
				String sql = "UPDATE board SET subject=?, content=? WHERE num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getSubject());
				pstmt.setString(2, dto.getContent());
				pstmt.setInt(3, num);
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
	
	public void contentViews(int num) {
		try {
			con = getConnection();
			String sql = "UPDATE board SET views=views+1 WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	
	public BoardDTO contentSelect(int num) {
		BoardDTO dto = new BoardDTO();
		try {
			con = getConnection();
			String sql = "SELECT * FROM board WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setViews(rs.getInt("views"));
				dto.setFile(rs.getString("file"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setContent(rs.getString("content"));
				
			}
			
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return dto;
	}
	
	public ArrayList<BoardDTO> boardSelect(int type) {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			con = getConnection();
			String sql = "SELECT * FROM board WHERE type=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, type);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(Integer.parseInt(rs.getString("num")));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setFile(rs.getString("file"));
				dto.setViews(rs.getInt("views"));
				dto.setDate(rs.getTimestamp("date"));
				list.add(dto);
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
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
	
	private Connection getConnection() throws Exception{
		
		// 커넥션 풀 (Connection Pool)
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = ds.getConnection();
		
		return con;
	}
	
}
