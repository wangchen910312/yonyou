package chn.bhmc.dms.bat.httpUtils;

import java.io.IOException;  
import java.io.InputStream;  
import java.io.OutputStreamWriter;  
import java.net.HttpURLConnection;  
import java.net.URL;  
  
public class SendToCdzHttpUtil {  
  
    /** 
     * 发送HttpPost请求 
     *  
     * @param strURL 
     *            服务地址 + 端口 例如: http://10.37.93.197:81/cpms/v1.0/query_token
     * @param params 
     *            {	
						OperatorID:"123456789",
						Data:"mYvffpNoFf4E/ZTC1tOw4+S74uaNgpDhWMT5uPmKMx85MaH8xOvGGkfRD+sxTiozejsfxIVge8Hi9/aaO4BIyg==",
						TimeStamp:"20190415121212",
						Seq:"0001",
						Sig:"4B27B2CC860F321507F332FBB07E5D64"
				   }	
	 * @param token 
     *            获取的token，如果没有则传null或者空字符串
     *            
     * @return 成功:返回json字符串<br/> 
     */  
    public static String post(String method, String params, String accessToken) {
        try {  
            URL url = new URL(method);// 创建连接  
            HttpURLConnection connection = (HttpURLConnection) url  
                    .openConnection();  
            connection.setDoOutput(true);  
            connection.setDoInput(true);  
            connection.setUseCaches(false);  
            connection.setInstanceFollowRedirects(true);  
            connection.setRequestMethod("POST"); // 设置请求方式  
            connection.setRequestProperty("Accept", "json"); // 设置接收数据的格式  
            connection.setRequestProperty("Content-Type", "application/json"); // 设置发送数据的格式  
            if(null!=accessToken&&!"".equals(accessToken)){
            	connection.setRequestProperty("Authorization", accessToken); // 设置之前获取的token  
            }
            connection.connect();  
            OutputStreamWriter out = new OutputStreamWriter(  
                    connection.getOutputStream(), "UTF-8"); // utf-8编码  
            out.append(params);  
            out.flush();  
            out.close();  
            // 读取响应  
            int length = (int) connection.getContentLength();// 获取长度  
            InputStream is = connection.getInputStream();  
            if (length != -1) {  
                byte[] data = new byte[length];  
                byte[] temp = new byte[512];  
                int readLen = 0;  
                int destPos = 0;  
                while ((readLen = is.read(temp)) > 0) {  
                    System.arraycopy(temp, 0, data, destPos, readLen);  
                    destPos += readLen;  
                }  
                String result = new String(data, "UTF-8"); // utf-8编码  
                System.out.println(result);  
                return result;  
            }  
        } catch (IOException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
        return "error"; // 自定义错误信息  
    }  
  
    public static void main(String[] args) {  
    	String params = "{"+	
    		"\"OperatorID\":\"123456789\","+
    		"\"Data\":\"mYvffpNoFf4E/ZTC1tOw4+S74uaNgpDhWMT5uPmKMx85MaH8xOvGGkfRD+sxTiozejsfxIVge8Hi9/aaO4BIyg==\","+
    		"\"TimeStamp\":\"20190415121212\","+
    		"\"Seq\":\"0001\","+
    		"\"Sig\":\"739571216941D6A9014AA6FFF9E5D04C\""+
    	"}";
    	
//	    String url = "http://10.37.93.197:81/cpms/v1.0/query_token";
	    String url = "http://58.215.246.190:8667/cpms/v1.0/query_token";
	    post(url, params, "");
    	
    	/*String params = "{"+
			    "\"OperatorID\":\"123456789\","+	
			    "\"Data\":\"UKS9utFtQBnZBVngFsNnQGm5GrUHd90s+sasqjGi35BETdGeZDrKs0GFOgG637Qf80FtBYhPBTTLHuPobL3kKq+yNwPZx3Zy9Q5Nnx1c3kvvvzE1WpjqvUulskgOhN86oMHKvL1uECkr17Fx5mQ319BbNqJhxUeva0NHfdsgLO/W0QkLj6tCY3F15VhodLIIsGAWM698nddBeZ3jIRDF9WkXAT9I6VGg8jH6gCY1TWrLdoxK0/BqVv78QBNG83Y5HhHCHoDeUGsquYryJoyJqiUJA93X3mI24Tdogu6fu6lBCsycRPqqSk1XDpl+jXhniHbaH/bBQvFD837XLHFkxZ4mpGr4M3HuR3vbu8vyyEhe6hlndumx8GEs7dKU7g28f5VBRT0wTXqHI3uky0IUNhDY0DcbZ7XHlvublPyG8umzUzU8tb6k7Jg5W2pLgkOxcmC/QTcQSNuRP404Yw1wLw==\","+	
	    		"\"TimeStamp\":\"20190415121212\","+	
	    		"\"Seq\":\"0001\","+	
	    		"\"Sig\":\"6889B226330B34745606FD4326FD222B\""+	
	    "}";
//    	    String url = "http://10.37.93.197:81/cpms/v1.0/query_token";
    	    String url = "http://58.215.246.190:8667/cpms/v1.0/query_order_create";
    	    post(url, params, "c95f14918972433cb0eb5080645d3b9401f3ab881e0d4649ab911196515b7010");*/
    	
    }  
  
}