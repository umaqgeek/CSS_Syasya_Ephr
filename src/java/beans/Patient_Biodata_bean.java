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
public class Patient_Biodata_bean {
    
    private String pmi_no;
    private String name;
    private String ic_no;
    private String dob;
    private String gender;
    private String blood_group;
    private String allergy;

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
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the ic_no
     */
    public String getIc_no() {
        return ic_no;
    }

    /**
     * @param ic_no the ic_no to set
     */
    public void setIc_no(String ic_no) {
        this.ic_no = ic_no;
    }

    /**
     * @return the dob
     */
    public String getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(String dob) {
        this.dob = dob;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the blood_group
     */
    public String getBlood_group() {
        return blood_group;
    }

    /**
     * @param blood_group the blood_group to set
     */
    public void setBlood_group(String blood_group) {
        this.blood_group = blood_group;
    }

    /**
     * @return the allergy
     */
    public String getAllergy() {
        return allergy;
    }

    /**
     * @param allergy the allergy to set
     */
    public void setAllergy(String allergy) {
        this.allergy = allergy;
    }
    
}
