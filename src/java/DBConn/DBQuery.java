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
public class DBQuery {
    public static ArrayList<ArrayList<String>> getData(String pmino) 
    {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        try 
        {
            String sql = "SELECT * FROM EHR_CENTRAL WHERE PMI_NO = ? "
                    + "AND STATUS = 1";
            PreparedStatement ps = DBConnection.getConn().prepareStatement(sql);
            ps.setString(1, pmino);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) 
            {
                ArrayList<String> d = new ArrayList<String>();
                d.add(rs.getString("CENTRAL_CODE"));
                d.add(rs.getString("PMI_NO"));
                d.add(rs.getString("C_TXNDATE"));
                d.add(rs.getString("C_TxnData"));
                d.add(rs.getString("STATUS"));
                data.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBQuery.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return data;
    }
    
    public static ArrayList<String> getDataRow(String id) 
    {
        ArrayList<String> data = new ArrayList<String>();
        try 
        {
            String sql = "SELECT * FROM EHR_CENTRAL WHERE CENTRAL_CODE = ? "
                    + "AND STATUS = 1";
            PreparedStatement ps = DBConnection.getConn().prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) 
            {
                data.add(rs.getString("CENTRAL_CODE"));
                data.add(rs.getString("PMI_NO"));
                data.add(rs.getString("C_TXNDATE"));
                data.add(rs.getString("C_TxnData"));
                data.add(rs.getString("STATUS"));
            }
        } catch (SQLException ex) 
        {
            Logger.getLogger(DBQuery.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return data;
    }
    
    public static boolean insertData(ArrayList<String> data) 
    {
        boolean stat = false;
        try 
        {
            String sql = "INSERT INTO signup_tbl VALUES(?";
            for (int i = 0; i < data.size() - 1; i++) 
            {
                sql += ", ?";
            }
            sql += ")";
            PreparedStatement ps = DBConnection.getConn().prepareStatement(sql);
            for (int i = 0; i < data.size(); i++) 
            {
                ps.setString(i+1, data.get(i));
            }
            ps.execute();
            stat = true;
        } catch (SQLException ex) 
        {
            stat = false;
            ex.printStackTrace();
        }
        return stat;
    }
    
     public static boolean updateData(ArrayList<String> data) 
     {
        boolean stat = false;
        try 
        {
            String sql = "INSERT INTO signup_tbl VALUES(?";
            for (int i = 0; i < data.size() - 1; i++) 
            {
                sql += ", ?";
            }
            sql += ")";
            PreparedStatement ps = DBConnection.getConn().prepareStatement(sql);
            for (int i = 0; i < data.size(); i++) 
            {
                ps.setString(i+1, data.get(i));
            }
            ps.execute();
            stat = true;
        } catch (SQLException ex) 
        {
            stat = false;
            ex.printStackTrace();
        }
        return stat;
    }
}
