package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public String[] selectEmail() {
		String[] email = {};
		ArrayList<String> list = new ArrayList<String>();
		try {
			con = getConnection();
			String sql = "SELECT email FROM member WHERE agree LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%email%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("email"));
			}
			email = list.toArray(new String[list.size()]);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		return email;
		
	}
	
	public void updateMember(MemberDTO dto) {
			try {
				con = getConnection();
				String sql = "UPDATE member SET password=?, name=?, address1=?, address2=?,"
						+ "zipNo=?, phone=?, email=?, agree=? WHERE id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getPassword());
				pstmt.setString(2, dto.getName());
				pstmt.setString(3, dto.getAddress1());
				pstmt.setString(4, dto.getAddress2());
				pstmt.setString(5, dto.getZipNo());
				pstmt.setString(6, dto.getPhone());
				pstmt.setString(7, dto.getEmail());
				pstmt.setString(8, dto.getAgree());
				pstmt.setString(9, dto.getId());
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
	
	public MemberDTO updateSelect(String id) {
		MemberDTO dto = new MemberDTO();
			try {
				con = getConnection();
				String sql = "SELECT * FROM member WHERE id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dto.setPassword(rs.getString("password"));
					dto.setName(rs.getString("name"));
					dto.setAddress1(rs.getString("address1"));
					dto.setAddress2(rs.getString("address2"));
					dto.setZipNo(rs.getString("zipNo"));
					dto.setPhone(rs.getString("phone"));
					dto.setEmail(rs.getString("email"));
					dto.setAgree(rs.getString("agree"));
				}
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

	public int loginCheck(String id, String password) {
		int check = -1;
		
			try {
				con = getConnection();
				String sql = "SELECT * FROM member WHERE id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString("password").equals(password)) {
						check = 1;
					}
					else {
						check = 0;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				dbClose();
			}
		
		return check;
	}
	
	public void insertMember(MemberDTO dto) {
		
		
		try {
			con = getConnection();
			String sql = "INSERT INTO member VALUES(0,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, dto.getAddress1());
			pstmt.setString(7, dto.getAddress2());
			pstmt.setString(8, dto.getZipNo());
			pstmt.setString(9, dto.getPhone());
			pstmt.setString(10, dto.getEmail());
			pstmt.setString(11, dto.getAgree());
			pstmt.setTimestamp(12, dto.getDate());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
		
		
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
