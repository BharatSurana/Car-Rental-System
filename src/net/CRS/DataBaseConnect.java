package net.CRS;

import java.sql.*;
import java.io.IOException;
import java.util.*;

public class DataBaseConnect {

	public static Connection prepareDatabaseConnecion()   {
		Connection con=null;
		try {
    		Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental_system","java","carrentalsystem");
		}
		catch (Exception ex) {
			System.out.println ("Exception in preapreConn()..."+ex);
		}
		return con;	
	}

	public static void closeDatabaseConnection(Connection con) throws SQLException,IOException {
		if(con!=null)
			con.close();
	}
	
	public static int updateQuery(String sql)  {
		int update = 0;
		try {
			Connection con = prepareDatabaseConnecion();
			Statement stmt = con.createStatement();
			update = stmt.executeUpdate(sql);
			closeDatabaseConnection(con);
		} catch (Exception e) {
			System.out.println("Exception in updateQuery()..." + e);
		}
		return update;
	}

	public static ArrayList doUserLogin(String sql)  {
		ResultSet rs=null;
		ArrayList one=new ArrayList();
		try {
				Connection con=prepareDatabaseConnecion();
				Statement stmt=con.createStatement();
				rs=stmt.executeQuery(sql);
				while(rs.next()){
					one.add(rs.getInt(1));
					one.add(rs.getString(2));
				}
				closeDatabaseConnection(con);    
			}
			catch (Exception ex) {
				System.out.println ("Exception in executeQuery()...."+ex);
			}
		return one;
	}
}