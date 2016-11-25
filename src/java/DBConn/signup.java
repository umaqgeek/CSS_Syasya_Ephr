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
public class signup {

    String name;
    String username;
    String email;
    String password;
    Integer ic_no;

    public Integer getic_no() {
        return ic_no;
    }

    public void setic_no(Integer ic_no) {
        this.ic_no = ic_no;
    }

    public String getname() {
        return name;
    }

    public String getusername() {
        return username;
    }

    public String getemail() {
        return email;
    }

    public String getpassword() {
        return password;
    }
}
