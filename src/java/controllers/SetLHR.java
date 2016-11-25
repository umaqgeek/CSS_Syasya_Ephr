/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.Date;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class SetLHR {
    
    String host = "10.73.32.200";
    int port = 1099;
    RMIConnector rmic = new RMIConnector();
    
    public boolean setBloodPressure(String pmi, int systolic, int diastolic, int pulse, Date episodedate) 
    {
        
        boolean insertBP = false;
        
        String setBP = "INSERT INTO lhr_bp "
                + "(pmi_no, hfc_cd, episode_date, encounter_date, systolic_sitting, "
                + "diastolic_sitting, sitting_pulse, systolic_standing, diastolic_standing, "
                + "standing_pulse, systolic_supine, diastolic_supine, supine_pulse, "
                + "doctor_id, doctor_name, person_id_no, national_id_no, person_status, "
                + "centre_code, measure_date) VALUES ('"+ pmi +"', DEFAULT, '"+episodedate+"', DEFAULT, "
                + " '"+ systolic +"', '"+ diastolic +"', '"+ pulse +"', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "
                + "NULL, NULL, NULL, NULL, NULL) ";
        
        insertBP = rmic.setQuerySQL(host, port, setBP);
        
        if(insertBP)
        {
            return true;
        } else
        {
            return false;
        }

    }
    
    public boolean setBloodGlucose (String pmi, double bglevel, Date episodedate)
    {
        boolean insertBG = false;
        
        String setBG = "INSERT INTO lhr_blood_glucose (pmi_no, hfc_cd,"
                + " episode_date, encounter_date, blood_glucose_level, date_taken, "
                + "doctor_id, doctor_name, national_id_no, person_id_no, person_status, "
                + "centre_code, measure_date) VALUES ('"+ pmi +"', DEFAULT, '"+episodedate+"', "
                + "DEFAULT, '"+ bglevel +"', CURRENT_TIMESTAMP, NULL,"
                + " NULL, NULL, NULL, NULL, NULL, NULL) ";
        
        insertBG = rmic.setQuerySQL(host, port, setBG);
        
        if(insertBG)
        {
            return true;
        } else
        {
            return false;
        }
    }
    
    public boolean setWeightHeight(String pmi, String weight, String height, Date episodedate)
    {
        boolean insertWH = false;
        
        String setWH = "INSERT INTO lhr_weight_height (pmi_no, weight_reading, height_reading) VALUES ('"+pmi+"','"+weight+"','"+height+"');";
        
        insertWH = rmic.setQuerySQL(host, port, setWH);
        
        if(insertWH)
        {
            return true;
        } else
        {
            return false;
        }
    }
}
