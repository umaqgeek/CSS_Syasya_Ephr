/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author user
 */
public class LHR_Blood_Glucose_bean {
    private String pmi_no;
    private String hfc_cd;
    private String episode_date;
    private String encounter_date;
    private double bg_level;
    private String date_taken;
    private String doc_id;
    private String doc_name;
    private String per_id_no;
    private String nat_id_no;
    private String per_status;
    private String centre_code;
    private int measure_date;

    /**
     * @return the pmi_no
     */
    public String getPmi_no() {
        return pmi_no;
    }

    /**
     * @param pmi_no the pmi_no to set
     */
    public void setPmi_no(String pmi_no) {
        this.pmi_no = pmi_no;
    }

    /**
     * @return the hfc_cd
     */
    public String getHfc_cd() {
        return hfc_cd;
    }

    /**
     * @param hfc_cd the hfc_cd to set
     */
    public void setHfc_cd(String hfc_cd) {
        this.hfc_cd = hfc_cd;
    }

    /**
     * @return the episode_date
     */
    public String getEpisode_date() {
        return episode_date;
    }

    /**
     * @param episode_date the episode_date to set
     */
    public void setEpisode_date(String episode_date) {
        this.episode_date = episode_date;
    }

    /**
     * @return the encounter_date
     */
    public String getEncounter_date() {
        return encounter_date;
    }

    /**
     * @param encounter_date the encounter_date to set
     */
    public void setEncounter_date(String encounter_date) {
        this.encounter_date = encounter_date;
    }

    /**
     * @return the bg_level
     */
    public double getBg_level() {
        return bg_level;
    }

    /**
     * @param bg_level the bg_level to set
     */
    public void setBg_level(double bg_level) {
        this.bg_level = bg_level;
    }

    /**
     * @return the date_taken
     */
    public String getDate_taken() {
        return date_taken;
    }

    /**
     * @param date_taken the date_taken to set
     */
    public void setDate_taken(String date_taken) {
        this.date_taken = date_taken;
    }

    /**
     * @return the doc_id
     */
    public String getDoc_id() {
        return doc_id;
    }

    /**
     * @param doc_id the doc_id to set
     */
    public void setDoc_id(String doc_id) {
        this.doc_id = doc_id;
    }

    /**
     * @return the doc_name
     */
    public String getDoc_name() {
        return doc_name;
    }

    /**
     * @param doc_name the doc_name to set
     */
    public void setDoc_name(String doc_name) {
        this.doc_name = doc_name;
    }

    /**
     * @return the per_id_no
     */
    public String getPer_id_no() {
        return per_id_no;
    }

    /**
     * @param per_id_no the per_id_no to set
     */
    public void setPer_id_no(String per_id_no) {
        this.per_id_no = per_id_no;
    }

    /**
     * @return the nat_id_no
     */
    public String getNat_id_no() {
        return nat_id_no;
    }

    /**
     * @param nat_id_no the nat_id_no to set
     */
    public void setNat_id_no(String nat_id_no) {
        this.nat_id_no = nat_id_no;
    }

    /**
     * @return the per_status
     */
    public String getPer_status() {
        return per_status;
    }

    /**
     * @param per_status the per_status to set
     */
    public void setPer_status(String per_status) {
        this.per_status = per_status;
    }

    /**
     * @return the centre_code
     */
    public String getCentre_code() {
        return centre_code;
    }

    /**
     * @param centre_code the centre_code to set
     */
    public void setCentre_code(String centre_code) {
        this.centre_code = centre_code;
    }

    /**
     * @return the measure_date
     */
    public int getMeasure_date() {
        return measure_date;
    }

    /**
     * @param measure_date the measure_date to set
     */
    public void setMeasure_date(int measure_date) {
        this.measure_date = measure_date;
    }
}
