/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RMIConn;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 *
 * @author user
 */
public interface Message extends Remote{
    void updateStatEpisode(String PMINumber, String TimeEpisode) throws RemoteException;
}
