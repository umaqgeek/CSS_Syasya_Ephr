/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConn;

/**
 *
 * @author user
 */
public class SessionDB {
    private static String username;
    private static String password;
    private static String fullname;
    private static String pmino;

    /**
     * @return the username
     */
    public static String getUsername() {
        return username;
    }

    /**
     * @param aUsername the username to set
     */
    public static void setUsername(String aUsername) {
        username = aUsername;
    }

    /**
     * @return the password
     */
    public static String getPassword() {
        return password;
    }

    /**
     * @param aPassword the password to set
     */
    public static void setPassword(String aPassword) {
        password = aPassword;
    }

    /**
     * @return the fullname
     */
    public static String getFullname() {
        return fullname;
    }

    /**
     * @param aFullname the fullname to set
     */
    public static void setFullname(String aFullname) {
        fullname = aFullname;
    }
    
    // new

    public static String getPmino() {
        return pmino;
    }

    public static void setPmino(String pmino) {
        SessionDB.pmino = pmino;
    }
    
}
