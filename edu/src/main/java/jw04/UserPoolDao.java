package jw04;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jw.common.pool.OracleConnectionPool;

public class UserPoolDao {

	public UserPoolDao() {
		// TODO Auto-generated constructor stub
	}
	public void getUser(UserVO userVO) {
		
		Connection con = null;
		PreparedStatement pStmt= null;
		ResultSet rs = null;
		
		try {
			con=OracleConnectionPool.getInstance().getConnection();
			
			
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
	