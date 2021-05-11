

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : Test.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 23.     Ki hyun Kwon     최초 생성
 * </pre>
 */

public class Test {

    public static void main(String[] args){


        try{
            /*String url="D:/123.jpg";

            File file = new File(url);

            file.getName();
           // System.out.println(file);
            //System.out.println(file.getName());
            FileInputStream in = new FileInputStream(file);

            int data = 0;

            System.out.println(file.isFile());
            System.out.println(in.read());
            byte[] by = new byte[1024];

            while( (data = in.read()) != -1){
               System.out.println((byte)data);
            }
*/
            //byte[] encodedBytes = Base64.encodeBase64();
            //System.out.println("encodedBytes " + new String(encodedBytes));

            Double a = 1.01;
            Double b = 1.01;

            System.out.println(a.compareTo(b));




        }catch(Exception e){
System.out.println(e);
        }


    }
}
