/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConn;

import java.util.ArrayList;
import main.RMIConnector;

/**
 * @author SyasyaAzizan
 */
public class Connection_unused { 
    
    //public final static String HOST = "ecss.utem.edu.my";
    public final static String HOST = "10.73.32.200";
    public final static int PORT_NUMBER = 1099;
    
    public static ArrayList<ArrayList<String>> getData (String query)
    {
        RMIConnector rmic = new RMIConnector();
        String host_db = Connection_unused.HOST;
        ArrayList<ArrayList<String>> data = rmic.getQuerySQL(host_db, Connection_unused.PORT_NUMBER, query);
        
        return data;
    }
    
    
//    public static ArrayList<ArrayList<String>> getData(String query)
//    {
//        RMIConnector rmi = new RMIConnector();
//        
//        ArrayList<ArrayList<String>> data = rmi.getQuerySQL(HOST, PORT_NUMBER, query);
//        
//        return data;
//    }
//    
//    public static boolean setData(String query)
//    {
//        RMIConnector rmi = new RMIConnector();
//        
//        boolean setData = rmi.setQuerySQL(HOST, PORT_NUMBER, query);
//        
//        return setData;
//    }
}