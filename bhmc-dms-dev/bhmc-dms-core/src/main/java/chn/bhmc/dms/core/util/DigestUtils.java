package chn.bhmc.dms.core.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.net.util.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DigestUtils.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 30.     Kang Seok Han     최초 생성
 * </pre>
 */

public class DigestUtils {

    @SuppressWarnings("unused")
    private static Logger logger = LoggerFactory.getLogger(DigestUtils.class);


    /**
     * Encode a string using Base64 encoding. This is weak encoding in that
     * anyone can use the decodeString routine to reverse the encoding.
     *
     * @param str
     *            String to be encoded
     * @return String encoding result
     * @see Base64#encode(byte[])
     */
    public static String encodeBase64(String str) {
        return Base64.encodeBase64String(str.getBytes());
    }

    /**
     * Decode a string using Base64 encoding.
     *
     * @param str
     *            String to be decoded
     * @return String decoding String
     * @see Base64#decode(String)
     */
    public static String decodeBase64(String str) {
        return new String(Base64.decodeBase64(str));
    }

    /**
     * Encode a string using algorithm specified in web.xml and return the
     * resulting encrypted password. If exception, the plain credentials string
     * is returned
     *
     * @param password
     *            Password or other credentials to use in authenticating this
     *            username
     * @param algorithm
     *            Algorithm used to do the digest
     * @return encrypted password based on the algorithm.
     * @throws NoSuchAlgorithmException
     */
    public static String encodePassword(String password, String algorithm)
            throws NoSuchAlgorithmException {
        byte[] unencodedPassword = password.getBytes();

        MessageDigest md = null;

        md = MessageDigest.getInstance(algorithm);

        md.reset();

        // call the update method one or more times
        // (useful when you don't know the size of your data, eg. stream)
        md.update(unencodedPassword);

        // now calculate the hash
        byte[] encodedPassword = md.digest();

        StringBuilder buf = new StringBuilder();

        for (int i = 0; i < encodedPassword.length; i++) {
            if (((int) encodedPassword[i] & 0xff) < 0x10) {
                buf.append("0");
            }

            buf.append(Long.toString((int) encodedPassword[i] & 0xff, 16));
        }

        return buf.toString();
    }
}
