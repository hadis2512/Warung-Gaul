/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbwarung;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class Dbwarung {
    public static Connection con;
    public static Statement stm;
    
    public Dbwarung(){
    
}
    public static Connection bukaKoneksi() throws SQLException{
        Connection kon = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            kon = DriverManager.getConnection("jdbc:mysql://localhost/warung", "root", "");
            return kon;
        }
        catch(SQLException sqlEx){
            System.out.println("Database tidak dapat dibuka");
            return null;
        }
        catch(Exception ex){
            System.out.println("Anda tidak terhubung ke database");
            return null;
        }
//        Connection con = null;
//        try {
//            String url ="jdbc:mysql://localhost/warung";
//            String user="root";
//            String pass="";
//            Class.forName("com.mysql.jdbc.Driver");
//            con =DriverManager.getConnection(url,user,pass);
//            stm = con.createStatement();
//            System.out.println("koneksi berhasil;");
//        } catch (Exception e) {
//            System.err.println("koneksi gagal" +e.getMessage());
//        }
//        return con;
    }
 
    public static void main(String[] args) {
    new Dbwarung();             
    }
 }
    
    
   