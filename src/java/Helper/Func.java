/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helper;

/**
 *
 * @author user
 */
public class Func {
    public static String datetosql(String date) {
        String tarikh = "0000-00-00";
        try {
            String d[] = date.split("/");
            tarikh = d[2] + "-" + d[1] + "-" + d[0];
        } catch (Exception e) {
            tarikh = "0000-00-00";
            e.printStackTrace();
        }
        return tarikh;
    }
    
    public static String sqltodate(String date) {
        String tarikh = "00/00/0000";
        try {
            String d[] = date.split("-");
            tarikh = d[2] + "/" + d[1] + "/" + d[0];
        } catch (Exception e) {
            tarikh = "00/00/0000";
            e.printStackTrace();
        }
        return tarikh;
    }
    
    public static String trim(String data) {
        try {
            data = data.equals("") ? "-" : data;
//            if (data.contains("Select")) {
//                data = "-";
//            }
        } catch (Exception e) {
            e.printStackTrace();
            data = "-";
        }
        return data;
    }
    
    public static String getDate(String date) {
        try {
            String a[] = date.split(" ");
            String b[] = a[0].split("-");
            return b[2]+"/"+b[1]+"/"+b[0];
        } catch (Exception e) {
            e.printStackTrace();
            return "-";
        }
    }
    
    
    public static int getNum(String num) {
        int num1 = 0;
        try {
            num = num.equals("")?"0":num;
            num1 = Integer.parseInt(num);
        } catch (Exception e) {
            num1 = 0;
            e.printStackTrace();
        }
        return num1;
    }
}
