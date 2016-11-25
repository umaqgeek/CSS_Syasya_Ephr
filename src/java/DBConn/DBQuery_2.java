/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConn;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class DBQuery_2 {
     public static ArrayList<ArrayList<String>> getData(String pmino) {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        try {
        
             
        	 String sql = "SELECT * FROM EHR_CENTRAL WHERE PMI_NO = ? ";
        	 PreparedStatement pstmt = DBConnection.getConn().prepareStatement(sql);
    
        	 ResultSet rs = pstmt.executeQuery();
 			while (rs.next()) {
 			       ArrayList<String> d = new ArrayList<String>();
 	             String PMI_NO =  (rs.getString("PMI_NO"));
 	                d.add(rs.getString("C_TXNDATE"));
 	                d.add(rs.getString("C_TxnData"));
 	                d.add(rs.getString("STATUS"));
 	            
 	                
 	                //Display value 
 	                System.out.print("PMI No: " + PMI_NO);
 	                
 	                
 	                
        }
        }
        
 			catch (SQLException ex) {
            Logger.getLogger(DBQuery.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return data;
    }
}
