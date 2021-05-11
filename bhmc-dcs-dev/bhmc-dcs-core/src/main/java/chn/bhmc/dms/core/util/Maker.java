package chn.bhmc.dms.core.util;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : Maker.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 27.     Kang Seok Han     최초 생성
 * </pre>
 */

public class Maker {

    public static void main(String[] args) {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        String defaultLang = "zh";
        String[] langs = new String[]{"ko","zh"};

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        for(int i=0; i<langs.length; i++){

            String lang = langs[i];
            String messageProperties = "../bhmc-dcs-web/src/main/resources/message/message-dms_"+lang+".properties";
            String defaultProperties = "../bhmc-dcs-web/src/main/resources/message/message-dms.properties";

            Writer messagePropertiesWriter = null;
            Writer defaultPropertiesWriter = null;
            try{

//                DataSource ds = MakerDataSourceFactory.getDataSource();
//
//                conn = ds.getConnection();
                conn = DriverManager.getConnection("jdbc:oracle:thin:@10.125.211.117:1521:BHDMSDEV", "DMSDB", "DMSDB_#01");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM CM_0501T WHERE LANG_CD = '"+lang+"'");

                messagePropertiesWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(messageProperties)));
                defaultPropertiesWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(defaultProperties)));

                int k=0;
                while(rs.next()) {
                    if(k%1000==0) {
                        System.out.println("=== 실행중 : " + (k));
                    }

                    String property = rs.getString("MESG_KEY") + " = " + rs.getString("MESG_TXT") + "\n";

                    messagePropertiesWriter.write(property);
                    if(lang.equals(defaultLang)){
                        defaultPropertiesWriter.write(property);
                    }
                    k++;
                }

            }catch(Exception e){
                e.printStackTrace();
            }finally{
                if(messagePropertiesWriter != null){
                    try{
                        messagePropertiesWriter.close();
                    }catch(IOException e){}
                }
                if(defaultPropertiesWriter != null){
                    try{
                        defaultPropertiesWriter.close();
                    }catch(IOException e){}
                }
                if(rs != null){
                    try{
                        rs.close();
                    }catch(SQLException e){}
                }
                if(stmt != null){
                    try{
                        stmt.close();
                    }catch(SQLException e){}
                }
                if(conn != null){
                    try{
                        conn.close();
                    }catch(SQLException e){}
                }
            }
        }

        System.out.println(new Date());
        System.out.println("End Make Properties");
    }
}
