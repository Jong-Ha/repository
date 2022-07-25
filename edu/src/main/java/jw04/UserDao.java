package jw04;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
	
	private String dburl="jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private String dbuser="scott";
	private String dbpwd="tiger";
	
	
	public UserDao() {
	}
	

	public void getUser(UserVO userVO) {
		
		Connection con = null;
		PreparedStatement pStmt= null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(dburl,dbuser,dbpwd);
			
			pStmt=con.prepareStatement("SELECT id, pwd FROM users WHERE id=? AND pwd=?");
			pStmt.setString(1, userVO.getId());
			pStmt.setString(2, userVO.getPwd());
			
			rs = pStmt.executeQuery();
			
			
			if(rs.next()) {
				
				System.out.println("db에서 확인 한 id,pwd ==>: "+userVO.getId()+" : "+userVO.getPwd());
				userVO.setActive(true);
			}else {
				System.out.println("db에서 <"+userVO.getId()+">에 해당하는 자료가 없습니다.");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(Exception e1) {}
			}
			if(pStmt != null)	{
				try {
					pStmt.close();
				}catch(Exception e2) {}
			}
			if(con != null)	{
				try {
					con.close();
				}catch(Exception e3) {}
			}
		}
				}
}
	