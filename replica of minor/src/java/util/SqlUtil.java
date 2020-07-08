

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SqlUtil {
  public static Connection conn;
  public static Statement stmt;
  public static final String db_username="root";
   public static final String db_password="root";
    public static final String db_name="quiz";
     public static final String db_url="jdbc:mysql://localhost/"+db_name;
        
public static void connectDb() throws ClassNotFoundException, SQLException{
    Class.forName("com.mysql.jdbc.Driver");
  conn= DriverManager.getConnection(db_url,db_username,db_password);
  stmt=conn.createStatement();
}
public static Connection getConnection() throws Exception{
		try{ 
			String driver = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306";
			String username = "root";
			String password = "root";
			Class.forName(driver);
         Connection conn = DriverManager.getConnection(url,username,password);
			System.out.println("Connected");
			return conn;
		}catch(Exception e){System.out.println(e);}
	return null;
	}
public static void createDatabase() throws Exception
{          
    try{ Connection conn = getConnection();
                        String sql =  "CREATE DATABASE IF NOT EXISTS "+db_name+"";
                        System.out.println("qry is ="+sql);
			PreparedStatement create = conn.prepareStatement(sql);
			create.executeUpdate(sql);
                }catch(Exception e)
                { System.out.println("error in db creation is "+e); }
}
public static void createTable() throws Exception{
		try{
			connectDb(); 
                         String sql1="create table if not exists student_profile(s_no int auto_increment unique key,username varchar(30) primary key,email varchar(40),gender varchar(10),contact_no varchar(15),city varchar(50));";     
                         String sql="create table if not exists student_login(s_no int auto_increment unique key,username varchar(30),password varchar(30), foreign key (username) references student_profile (username) on delete cascade on update cascade);";
        		String sql2 = "CREATE TABLE IF NOT EXISTS admin(user_name  VARCHAR(30) NOT NULL ,password VARCHAR(30) NOT NULL ,type_of_user VARCHAR(30));";
			String sql3 = "CREATE TABLE IF NOT EXISTS question(Question_no int(4),correct_ans VARCHAR(50) ,option_a VARCHAR(50) ,option_b VARCHAR(50) ,option_c VARCHAR(50) ,option_d VARCHAR(50),question varchar(300))";
			String sql4 = "CREATE TABLE IF NOT EXISTS result(username  VARCHAR(30),remarks VARCHAR(3) ,foreign key (username) references student_profile (username) on delete cascade on update cascade);";
			//String sql4 = "CREATE TABLE IF NOT EXISTS result(username  VARCHAR(30),remarks VARCHAR(3) ,foreign key (username) references student_profile (username) on delete cascade on update cascade);"
			//String query="insert into admin(user_name,password,type_of_user) values('admin123','admin123','admin');";
                       
                        SqlUtil.create(sql1);
                        SqlUtil.create(sql); 
                        SqlUtil.create(sql2);
                       // System.out.println("query for admin is="+sql2);
                        create(sql3);
                        create(sql4);   
                      //  SqlUtil.insert(query);
		}catch(Exception e)
                {   System.out.println("error in table creation"+e); }
	} 
public static boolean create(String query) throws SQLException
{
    boolean success=false;
    if(conn!=null)
    {  success=stmt.execute(query);  }
    return success;
}
public static  ResultSet read(String query) throws SQLException{
    ResultSet rs=null;
    if (query!=null) { rs=stmt.executeQuery(query); }
    return rs;
}
public static int insert(String query) throws SQLException{
    int result=-1;
    if (query!=null) {  result=stmt.executeUpdate(query); }
    return result;
}
public static int update(String query) throws SQLException{
    int result=-1;
    if (query!=null) {  result=stmt.executeUpdate(query); }
    return result;
}
public static int delete(String query) throws SQLException{
    int result=-1;
    if (query!=null) { result=stmt.executeUpdate(query); }
    return result;
}
public static void close() throws SQLException{
    if (conn!=null) {  conn.close();  }
    if(stmt!=null){  stmt.close();  }    
}

}
