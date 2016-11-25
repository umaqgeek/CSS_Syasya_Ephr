/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConn;

import Config.Config;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class Connection {
    public static String HOST = "10.73.32.200";
    public static int PORT = 1099;
    public final static String STR_HOST = "HOST";
    public final static String STR_PORT = "PORT";
    public final static String STR_ERROR = "ERROR";
    
    public Connection() {
        String host_server = Connection.getIpCall().getProperty(Connection.STR_HOST);
        int host_port = 1099;
        try {
            host_port = Integer.parseInt(Connection.getIpCall().getProperty(Connection.STR_PORT));
        } catch (Exception e) {
        }
        Connection.HOST = host_server;
        Connection.PORT = host_port;
    }
    
    public static ArrayList<ArrayList<String>> getData(String query) 
    {
        RMIConnector rmic = new RMIConnector();

//        String host_db = Config.url_server;
        String host_db = Connection.HOST;
        
        String host_server = Connection.getIpCall().getProperty(Connection.STR_HOST);
        int host_port = 1099;
        try {
            host_port = Integer.parseInt(Connection.getIpCall().getProperty(Connection.STR_PORT));
        } catch (Exception e) {
        }
        
        ArrayList<ArrayList<String>> data = rmic.getQuerySQL(host_server, host_port, query);
        
        return data;
    }
    
    public static boolean setData(String query)
    {
        RMIConnector rmi = new RMIConnector();
        
        String host_server = Connection.getIpCall().getProperty(Connection.STR_HOST);
        int host_port = 1099;
        try {
            host_port = Integer.parseInt(Connection.getIpCall().getProperty(Connection.STR_PORT));
        } catch (Exception e) {
        }
        
        boolean setData = rmi.setQuerySQL(host_server, host_port, query);
        
        return setData;
    }
    
    public static Properties getIpCall()
    {
        String in = Config.FILE_URL + "ipcall";
        BufferedReader br;
        Properties prop = new Properties();
        try {
            String sCurrentLine = "";
            br = new BufferedReader(new FileReader(in));
            while ((sCurrentLine = br.readLine()) != null) {
                char firstLetter = sCurrentLine.charAt(0);
                if (firstLetter != '#') {
                    String linePecah[] = sCurrentLine.split(":");
                    try {
                        if (linePecah[0] == "hostserver" || linePecah[0].equals("hostserver")) {
                            Connection.HOST = linePecah[1];
                            prop.setProperty(Connection.STR_HOST, linePecah[1]);
                        } else if (linePecah[0] == "hostport" || linePecah[0].equals("hostport")) {
                            Connection.PORT = Integer.parseInt(linePecah[1]);
                            prop.setProperty(Connection.STR_PORT, linePecah[1]);
                        }
                    } catch (Exception e) {
                    }
                }
            }
        } catch (IOException ex) {
            prop.setProperty(Connection.STR_ERROR, ex.getMessage());
        }
        return prop;
    }
    
}
