/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Helper.Func;
import beans.LHR_Blood_Pressure_bean;
import beans.LHR_Family_History_bean;
import beans.LHR_Blood_Glucose_bean;
import beans.LHR_DTO_bean;
import beans.LHR_Past_Medical_bean;
import beans.LHR_Signs_bean;
import beans.LHR_Weight_Height_bean;
import java.util.ArrayList;
import java.util.Date;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class GetLHR {

    String host = "10.73.32.200";
    int port = 1099;
    RMIConnector rmic = new RMIConnector();

    public String getDate(String date)
    {
        String pecah[] = date.split(" ");
        String tarikh = pecah[0];
        return tarikh;
    }
    
    public String getTime(String date)
    {
        String pecah[] = date.split(" ");
        String masa = pecah[1];
        return masa;
    }
    
    public ArrayList<LHR_Blood_Glucose_bean> getBG(String pmi) {

        String sqlBG = "SELECT episode_date, blood_glucose_level, date_taken FROM lhr_blood_glucose "
                + "WHERE pmi_no = '" + pmi + "' ORDER BY episode_date desc";
        
        ArrayList<ArrayList<String>> data_bg = rmic.getQuerySQL(host, port, sqlBG);

        ArrayList<LHR_Blood_Glucose_bean> lbg_beans = new ArrayList<LHR_Blood_Glucose_bean>();
        
        double bg_level = 0.0;
        for (int i = 0; i < data_bg.size(); i++) 
        {
            LHR_Blood_Glucose_bean lbgb = new LHR_Blood_Glucose_bean();

            lbgb.setEpisode_date(data_bg.get(i).get(0));
            try 
            {
                bg_level = Double.parseDouble(data_bg.get(i).get(1));
            } catch (Exception e) 
            {
                bg_level = 0.0;
            }
            lbgb.setDate_taken(data_bg.get(i).get(2));

            lbgb.setBg_level(bg_level);

            lbg_beans.add(lbgb);
        }

        return lbg_beans;
    }

    public ArrayList<LHR_Blood_Pressure_bean> getBP(String pmi) {

        String sqlBP = "SELECT episode_date, systolic_sitting, diastolic_sitting, "
                + "sitting_pulse FROM lhr_bp WHERE pmi_no = '" + pmi + "' ORDER BY episode_date desc";

        ArrayList<ArrayList<String>> data_lbp = rmic.getQuerySQL(host, port, sqlBP);
//        System.out.print("GetLHR: getBP :"+ data_lbp);

        ArrayList<LHR_Blood_Pressure_bean> lbp_beans = new ArrayList<LHR_Blood_Pressure_bean>();
        double sys = 0.0;
        double dias = 0.0;
        double pul = 0.0;

        for (int i = 0; i < data_lbp.size(); i++) 
        {
            LHR_Blood_Pressure_bean lbp = new LHR_Blood_Pressure_bean();

            lbp.setEpisode_date(data_lbp.get(i).get(0));
            try {
                sys = Double.parseDouble(data_lbp.get(i).get(1));
                dias = Double.parseDouble(data_lbp.get(i).get(2));
                pul = Double.parseDouble(data_lbp.get(i).get(3));
            } catch (Exception e) {
                sys = 0.0;
                dias = 0.0;
                pul = 0.0;
            }
            lbp.setSystolic_sitting(sys);
            lbp.setDiastolic_sitting(dias);
            lbp.setSitting_pulse(pul);

            lbp_beans.add(lbp);
        }
        return lbp_beans;
    }

    public ArrayList<LHR_Weight_Height_bean> getWH(String pmi) {
    
        String sqlWH = "SELECT episode_date, weight_reading, height_reading "
                + "FROM lhr_weight_height WHERE  pmi_no = '" + pmi + "' ORDER BY episode_date desc";

        ArrayList<ArrayList<String>> data_lwh = rmic.getQuerySQL(host, port, sqlWH);

        ArrayList<LHR_Weight_Height_bean> lwh_beans = new ArrayList<LHR_Weight_Height_bean>();

        for (int i = 0; i < data_lwh.size(); i++) {
            LHR_Weight_Height_bean lwh = new LHR_Weight_Height_bean();

            lwh.setEpisode_date(data_lwh.get(i).get(0));
            lwh.setWeight(data_lwh.get(i).get(1));
            lwh.setHeight(data_lwh.get(i).get(2));

            lwh_beans.add(lwh);
        }
        return lwh_beans;
    }
    
    public ArrayList<LHR_Weight_Height_bean> getWH_year(String pmi, String year) {
        
        String sqlWH = "SELECT episode_date, weight_reading, height_reading FROM "
                + "lhr_weight_height WHERE  pmi_no = '"+pmi+"' AND  "
                + "episode_date LIKE '"+year+"%' ORDER BY episode_date desc;";

        ArrayList<ArrayList<String>> data_lwh = rmic.getQuerySQL(host, port, sqlWH);

        ArrayList<LHR_Weight_Height_bean> lwh_beans = new ArrayList<LHR_Weight_Height_bean>();

        for (int i = 0; i < data_lwh.size(); i++) {
            LHR_Weight_Height_bean lwh = new LHR_Weight_Height_bean();

            lwh.setEpisode_date(data_lwh.get(i).get(0));
            lwh.setWeight(data_lwh.get(i).get(1));
            lwh.setHeight(data_lwh.get(i).get(2));

            lwh_beans.add(lwh);
        }
        return lwh_beans;
    }

    public ArrayList<LHR_Past_Medical_bean> getPM(String pmi) {

        String sqlPMH = "SELECT * FROM lhr_past_medical_history WHERE "
                + "pmi_no = '" + pmi + "' desc";

        ArrayList<ArrayList<String>> data_LPMH = rmic.getQuerySQL(host, port, sqlPMH);

        ArrayList<LHR_Past_Medical_bean> lpmh_beans = new ArrayList<LHR_Past_Medical_bean>();

        for (int i = 0; i < data_LPMH.size(); i++) {
            LHR_Past_Medical_bean lpmhb = new LHR_Past_Medical_bean();

            lpmhb.setPmi_no(data_LPMH.get(i).get(0));
            lpmhb.setHfc_cd(data_LPMH.get(i).get(1));
            lpmhb.setEncounter_date(data_LPMH.get(i).get(2));
            lpmhb.setDiagnosis_cd(data_LPMH.get(i).get(3));
            lpmhb.setOnset_data(data_LPMH.get(i).get(4));
            lpmhb.setDiagnosis_date(data_LPMH.get(i).get(5));
            lpmhb.setTerm_type(data_LPMH.get(i).get(6));
            lpmhb.setIcd10_cd(data_LPMH.get(i).get(7));
            lpmhb.setIcd10_desc(data_LPMH.get(i).get(8));
            lpmhb.setTerm_cd(data_LPMH.get(i).get(9));
            lpmhb.setTerm_desc(data_LPMH.get(i).get(10));
            lpmhb.setComment(data_LPMH.get(i).get(11));
            lpmhb.setStatus(data_LPMH.get(i).get(12));
            lpmhb.setDoc_id(data_LPMH.get(i).get(13));
            lpmhb.setDoc_name(data_LPMH.get(i).get(14));
            lpmhb.setNat_id_no(data_LPMH.get(i).get(15));
            lpmhb.setPer_id_no(data_LPMH.get(i).get(16));
            lpmhb.setPer_status(data_LPMH.get(i).get(17));
            lpmhb.setCentre_code(data_LPMH.get(i).get(18));

            lpmh_beans.add(lpmhb);
        }
        return lpmh_beans;
    }

    public ArrayList<LHR_Family_History_bean> getFH(String pmi) {

        String sqlFMH = "SELECT * FROM lhr_family_history WHERE pmi_no = '" + pmi + "' ORDER BY episode_date desc";

        ArrayList<ArrayList<String>> data_LFMH = rmic.getQuerySQL(host, port, sqlFMH);

        ArrayList<LHR_Family_History_bean> lfmh_beans = new ArrayList<LHR_Family_History_bean>();

        for (int i = 0; i < data_LFMH.size(); i++) {
            LHR_Family_History_bean lfmhb = new LHR_Family_History_bean();

            lfmhb.setPmi_no(data_LFMH.get(i).get(0));
            lfmhb.setHfc_cd(data_LFMH.get(i).get(1));
            lfmhb.setEpisode_date(data_LFMH.get(i).get(2));
            lfmhb.setEncounter_date(data_LFMH.get(i).get(3));
            lfmhb.setDiagnosis_cd(data_LFMH.get(i).get(4));
            lfmhb.setOnset_date(data_LFMH.get(i).get(5));
            lfmhb.setTerm_type(data_LFMH.get(i).get(6));
            lfmhb.setIcd10_cd(data_LFMH.get(i).get(7));
            lfmhb.setIcd10_desc(data_LFMH.get(i).get(8));
            lfmhb.setTerm_cd(data_LFMH.get(i).get(9));
            lfmhb.setTerm_desc(data_LFMH.get(i).get(10));
            lfmhb.setComment(data_LFMH.get(i).get(11));
            lfmhb.setStatus(data_LFMH.get(i).get(12));
            lfmhb.setDoc_id(data_LFMH.get(i).get(13));
            lfmhb.setDoc_name(data_LFMH.get(i).get(14));
            lfmhb.setNat_id_no(data_LFMH.get(i).get(15));
            lfmhb.setPer_id_no(data_LFMH.get(i).get(16));
            lfmhb.setPer_status(data_LFMH.get(i).get(17));
            lfmhb.setCentre_code(data_LFMH.get(i).get(18));

            lfmh_beans.add(lfmhb);
        }
        return lfmh_beans;
    }

    public ArrayList<LHR_DTO_bean> getDTO(String pmi) {

        String sqlDTO = "SELECT * FROM lhr_medication WHERE "
                + "pmi_no = '" + pmi + "' ORDER BY episode_date desc";

        ArrayList<ArrayList<String>> data_dto = rmic.getQuerySQL(host, port, sqlDTO);

        ArrayList<LHR_DTO_bean> ldto_beans = new ArrayList<LHR_DTO_bean>();

        for (int i = 0; i < data_dto.size(); i++) {
            LHR_DTO_bean ldto = new LHR_DTO_bean();

            ldto.setPmi_no(data_dto.get(i).get(0));
            ldto.setHfc_cd(data_dto.get(i).get(1));
            ldto.setEpisode_date(data_dto.get(i).get(2));
            ldto.setEncounter_date(data_dto.get(i).get(3));
            ldto.setDrug_cd(data_dto.get(i).get(4));
            ldto.setProblem_cd(data_dto.get(i).get(5));
            ldto.setDrug_name(data_dto.get(i).get(6));
            ldto.setProduct_name(data_dto.get(i).get(7));
            ldto.setDrug_form(data_dto.get(i).get(8));
            ldto.setDrug_form_desc(data_dto.get(i).get(9));
            ldto.setDrug_route_code(data_dto.get(i).get(10));
            ldto.setDrug_route_desc(data_dto.get(i).get(11));
            ldto.setDrug_freq_code(data_dto.get(i).get(12));
            ldto.setDrug_freq_desc(data_dto.get(i).get(13));
            ldto.setDrug_freq_unit(data_dto.get(i).get(14));
            ldto.setDrug_dosage(data_dto.get(i).get(15));
            ldto.setDrug_strength(data_dto.get(i).get(16));
            ldto.setDrug_uom(data_dto.get(i).get(17));
            double duration = 0.0;
            try {
                duration = Double.parseDouble(data_dto.get(i).get(18));
            } catch (Exception e) {
                duration = 0.0;
            }
            ldto.setDuration(duration);
            ldto.setQuantity(data_dto.get(i).get(19));
            ldto.setStart_date(data_dto.get(i).get(20));
            ldto.setEnd_date(data_dto.get(i).get(21));
            ldto.setDoc_id(data_dto.get(i).get(22));

            ldto_beans.add(ldto);
        }
        return ldto_beans;
    }

    public ArrayList<LHR_Signs_bean> getCCN(String pmi) {

        String sqlCCN = "SELECT episode_date, symptom_cd, symptom_name, term_type, "
                + "severity_desc, comment, status FROM lhr_signs "
                + "WHERE pmi_no = '" + pmi + "' ORDER BY episode_date desc";

        ArrayList<ArrayList<String>> data_CCN = rmic.getQuerySQL(host, port, sqlCCN);

        ArrayList<LHR_Signs_bean> lccn_beans = new ArrayList<LHR_Signs_bean>();

        for (int i = 0; i < data_CCN.size(); i++) {
            LHR_Signs_bean lcnn = new LHR_Signs_bean();


            lcnn.setEpisode_date(data_CCN.get(i).get(0));
            lcnn.setSymptom_cd(data_CCN.get(i).get(1));
            lcnn.setSymptom_name(data_CCN.get(i).get(2));
            lcnn.setTerm_type(data_CCN.get(i).get(3));
            lcnn.setSeverity_desc(data_CCN.get(i).get(4));
            lcnn.setComment(data_CCN.get(i).get(5));
            lcnn.setStatus(data_CCN.get(i).get(6));

            lccn_beans.add(lcnn);
        }
        return lccn_beans;
    }
    
    // untuk graph
     public ArrayList<LHR_Blood_Glucose_bean> getBG_graf(String pmi) {

        String sqlBG = "SELECT episode_date, blood_glucose_level, date_taken FROM lhr_blood_glucose "
                + "WHERE pmi_no = '" + pmi + "' ORDER BY episode_date asc";
        
        ArrayList<ArrayList<String>> data_bg = rmic.getQuerySQL(host, port, sqlBG);

        ArrayList<LHR_Blood_Glucose_bean> lbg_beans = new ArrayList<LHR_Blood_Glucose_bean>();
        
        double bg_level = 0.0;
        for (int i = 0; i < data_bg.size(); i++) 
        {
            LHR_Blood_Glucose_bean lbgb = new LHR_Blood_Glucose_bean();

            lbgb.setEpisode_date(data_bg.get(i).get(0));
            try 
            {
                bg_level = Double.parseDouble(data_bg.get(i).get(1));
            } catch (Exception e) 
            {
                bg_level = 0.0;
            }
            lbgb.setDate_taken(data_bg.get(i).get(2));

            lbgb.setBg_level(bg_level);

            lbg_beans.add(lbgb);
        }

        return lbg_beans;
    }

    public ArrayList<LHR_Blood_Pressure_bean> getBP_graf(String pmi) {

        String sqlBP = "SELECT episode_date, systolic_sitting, diastolic_sitting, "
                + "sitting_pulse FROM lhr_bp WHERE pmi_no = '" + pmi + "' ORDER BY episode_date asc";

        ArrayList<ArrayList<String>> data_lbp = rmic.getQuerySQL(host, port, sqlBP);
//        System.out.print("GetLHR: getBP :"+ data_lbp);

        ArrayList<LHR_Blood_Pressure_bean> lbp_beans = new ArrayList<LHR_Blood_Pressure_bean>();
        double sys = 0.0;
        double dias = 0.0;
        double pul = 0.0;

        for (int i = 0; i < data_lbp.size(); i++) 
        {
            LHR_Blood_Pressure_bean lbp = new LHR_Blood_Pressure_bean();

            lbp.setEpisode_date(data_lbp.get(i).get(0));
            try {
                sys = Double.parseDouble(data_lbp.get(i).get(1));
                dias = Double.parseDouble(data_lbp.get(i).get(2));
                pul = Double.parseDouble(data_lbp.get(i).get(3));
            } catch (Exception e) {
                sys = 0.0;
                dias = 0.0;
                pul = 0.0;
            }
            lbp.setSystolic_sitting(sys);
            lbp.setDiastolic_sitting(dias);
            lbp.setSitting_pulse(pul);

            lbp_beans.add(lbp);
        }
        return lbp_beans;
    }

    public ArrayList<LHR_Weight_Height_bean> getWH_graf(String pmi) {
    
        String sqlWH = "SELECT episode_date, weight_reading, height_reading "
                + "FROM lhr_weight_height WHERE  pmi_no = '" + pmi + "' ORDER BY episode_date asc";

        ArrayList<ArrayList<String>> data_lwh = rmic.getQuerySQL(host, port, sqlWH);

        ArrayList<LHR_Weight_Height_bean> lwh_beans = new ArrayList<LHR_Weight_Height_bean>();

        for (int i = 0; i < data_lwh.size(); i++) {
            LHR_Weight_Height_bean lwh = new LHR_Weight_Height_bean();

            lwh.setEpisode_date(data_lwh.get(i).get(0));
            lwh.setWeight(data_lwh.get(i).get(1));
            lwh.setHeight(data_lwh.get(i).get(2));

            lwh_beans.add(lwh);
        }
        return lwh_beans;
    }
}
