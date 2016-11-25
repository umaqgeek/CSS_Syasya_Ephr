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
public class ephrQuery {

    public static ArrayList<ArrayList<String>> getData(String username) {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        try {
            String sql = "SELECT * "
                    + "FROM signup_tbl st, pms_patient_biodata ppb "
                    + "WHERE st.username= ? "
                    + "AND st.ic_no = ppb.new_ic_no ";

            PreparedStatement ps = DBConnection.getConn().prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ArrayList<String> d = new ArrayList<String>();
                for (int i = 1; i <= 40; i++) {
                    d.add(rs.getString(i));
                }
                data.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBQuery.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return data;
    }
}
