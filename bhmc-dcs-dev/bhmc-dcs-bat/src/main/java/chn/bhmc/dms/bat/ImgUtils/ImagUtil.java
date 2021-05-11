package chn.bhmc.dms.bat.ImgUtils;


import sun.misc.BASE64Decoder;	
import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.concurrent.atomic.AtomicInteger;

public class ImagUtil {

    private static AtomicInteger atomicInteger = new AtomicInteger(0);

    /**
     * 数据库中二进制转换为字节数组
     * @param blob
     * @return
     */
    public static byte[] blobToBytes(Blob blob) {

        BufferedInputStream is = null;

        try {

            is = new BufferedInputStream(blob.getBinaryStream());


            byte[] bytes = new byte[(int) blob.length()];

            int len = bytes.length;

            int offset = 0;

            int read = 0;

            while (offset < len && (read = is.read(bytes, offset, len - offset)) >= 0) {

                offset += read;

            }

            return bytes;

        } catch (Exception e) {

            return null;

        } finally {

            try {

                if (is != null) {
                    is.close();

                    is = null;
                }

            } catch (IOException e) {

                return null;

            }

        }

    }


    /**
     *  生成图片到指定的位置
     * @param imgStr
     * @param imgFilePath
     * @return
     */
    public static boolean GenerateImage(String imgStr, String imgFilePath) {// 对字节数组字符串进行Base64解码并生成图片
        if (imgStr == null) // 图像数据为空
            return false;
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            // Base64解码
            byte[] bytes = decoder.decodeBuffer(imgStr);
            for (int i = 0; i < bytes.length; ++i) {
                if (bytes[i] < 0) {// 调整异常数据
                    bytes[i] += 256;
                }
            }
            // 生成jpeg图片
            OutputStream out = new FileOutputStream(imgFilePath);
            out.write(bytes);
            out.flush();
            out.close();

            System.out.println("当前处理数据为第: " + atomicInteger.incrementAndGet() + " 条");
            return true;
        } catch (Exception e) {
            return false;
        }
    }




}
