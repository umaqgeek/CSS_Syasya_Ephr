/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import beans.LHR_Blood_Glucose_bean;
import beans.Patient_Biodata_bean;
import java.util.ArrayList;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class GetPMS {
    
    String host = "10.73.32.200";
    int port = 1099;
    
    RMIConnector rmic = new RMIConnector();
    
    public ArrayList<Patient_Biodata_bean> getPatientdata(String pmi) {

        String getData = "SELECT pmi_no, patient_name, new_ic_no, birth_date, sex_code,"
                + " blood_type, allergy_ind FROM pms_patient_biodata WHERE pmi_no = '"+ pmi +"' ";

        ArrayList<ArrayList<String>> data_patient = rmic.getQuerySQL(host, port, getData);

        ArrayList<Patient_Biodata_bean> patient_beans = new ArrayList<Patient_Biodata_bean>();
        
        for (int i = 0; i < data_patient.size(); i++) 
        {
            Patient_Biodata_bean pbb = new Patient_Biodata_bean();

            pbb.setPmi_no(data_patient.get(i).get(0));
            pbb.setName(data_patient.get(i).get(1));
            pbb.setIc_no(data_patient.get(i).get(2));
            pbb.setDob(data_patient.get(i).get(3));
            pbb.setGender(data_patient.get(i).get(4));
            pbb.setBlood_group(data_patient.get(i).get(5));
            pbb.setAllergy(data_patient.get(i).get(6));
            
            patient_beans.add(pbb);
        }

        return patient_beans;
    }
}
