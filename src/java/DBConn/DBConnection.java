/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConn;

import RMIConn.Message;
import java.net.InetAddress;
import java.rmi.AccessException;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class DBConnection {
    
    //private static String host = "10.73.32.201";
    private static String host = "10.73.32.200";
    private static int netTime = 2000;
    private static String user = "root";
    private static String pass = "qwerty";
    private static String database = "servercis";
    private static String dbUrl = "jdbc:mysql://"+host+"/"+database;
    
    public static Connection getConn() 
    {
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(dbUrl, user, pass);
        } catch (Exception ex) 
        {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static boolean isPing() 
    {
        boolean retv = true;
        try 
        {
            final InetAddress host1 = InetAddress.getByName(host);
            boolean netStat = host1.isReachable(netTime);
            if (!netStat) 
            {
                retv = false;
            }
        } catch (Exception ex) 
        {
            retv = false;
        }
        return retv;
    }
    
    public static boolean isRMI() 
    {
        try 
        {
            Registry myRegistry = LocateRegistry.getRegistry(host, 1099);
            Message impl = (Message) myRegistry.lookup("myMessage");
            return true;
        } catch (Exception ex) 
        {
            ex.printStackTrace();
            return false;
        }
    }
    
}
