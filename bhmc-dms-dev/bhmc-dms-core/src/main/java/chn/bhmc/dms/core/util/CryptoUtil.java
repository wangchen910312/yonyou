package chn.bhmc.dms.core.util;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CryptoUtil.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 9. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 20.     Kang Seok Han     최초 생성
 * </pre>
 */

/**
 *
 * 암호화/복호화 Util 클래스
 * AES 알고리즘 / CBC 운영모드
 */

@SuppressWarnings("restriction")
public class CryptoUtil {

    private static final String ENC_TYPE = "utf-8";
    private static final String ENC_FORMAT = "AES/CBC/PKCS5Padding";
    private static BASE64Decoder decoder = new BASE64Decoder();
    private static BASE64Encoder encoder = new BASE64Encoder();

    /**
     *
     * 암호화
     *
     * @param clearStr
     * @param key
     * @return
     * @throws Exception
     */
    public static synchronized String encrypt(String clearStr, String key) throws Exception {
        return encrypt(clearStr, key, decoder.decodeBuffer(key));
    }

    /**
    *
    * 암호화
    *
    * @param clearStr
    * @param key
    * @param iv
    * @return
    * @throws Exception
    */
   public static synchronized String encrypt(String clearStr, String key, byte[] iv) throws Exception {

       IvParameterSpec ivSpec = new IvParameterSpec(iv);
       SecretKeySpec secureKey = new SecretKeySpec(key.getBytes("UTF-8"), "AES");

       Cipher cipher = Cipher.getInstance(ENC_FORMAT);
       cipher.init(Cipher.ENCRYPT_MODE, secureKey, ivSpec);

       return encoder.encode(cipher.doFinal(clearStr.getBytes(ENC_TYPE)));
   }

    /**
     *
     * 복호화
     *
     * @param encStr
     * @param key
     * @return
     * @throws Exception
     */
    public static synchronized String decrypt(String encStr, String key) throws Exception {
        return decrypt(encStr, key, decoder.decodeBuffer(key));
    }

    /**
    *
    * 복호화
    *
    * @param encStr
    * @param key
    * @return
    * @throws Exception
    */
   public static synchronized String decrypt(String encStr, String key, byte[] iv) throws Exception {

       IvParameterSpec ivSpec = new IvParameterSpec(iv);
       SecretKeySpec secureKey = new SecretKeySpec(key.getBytes("UTF-8"), "AES");

       Cipher cipher = Cipher.getInstance(ENC_FORMAT);
       cipher.init(Cipher.DECRYPT_MODE, secureKey, ivSpec);

       return new String(cipher.doFinal(decoder.decodeBuffer(encStr)), ENC_TYPE);
   }
}
