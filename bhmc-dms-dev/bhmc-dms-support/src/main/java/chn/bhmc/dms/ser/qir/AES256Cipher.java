package chn.bhmc.dms.ser.qir;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

@SuppressWarnings("restriction")
public class AES256Cipher {

	public static byte[] ivBytes = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };

	/**
	 * �뷀샇��
	 * @param str �뷀샇�뷀븷 臾몄옄��
	 * @param key �뷀샇��key
	 * @return
	 * @throws java.io.UnsupportedEncodingException
	 * @throws NoSuchAlgorithmException
	 * @throws NoSuchPaddingException
	 * @throws InvalidKeyException
	 * @throws InvalidAlgorithmParameterException
	 * @throws IllegalBlockSizeException
	 * @throws BadPaddingException
	 */
    public static String AES_Encode(String str, String key)	throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException,	IllegalBlockSizeException, BadPaddingException {

		byte[] textBytes = str.getBytes("UTF-8");
		AlgorithmParameterSpec ivSpec = new IvParameterSpec(ivBytes);
		SecretKeySpec newKey = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, newKey, ivSpec);
		return Base64.encode(cipher.doFinal(textBytes));
	}

	/**
	 * 蹂듯샇��
	 * @param str �뷀샇�붾Ц��
	 * @param key 蹂듯샇��key
	 * @return
	 * @throws java.io.UnsupportedEncodingException
	 * @throws NoSuchAlgorithmException
	 * @throws NoSuchPaddingException
	 * @throws InvalidKeyException
	 * @throws InvalidAlgorithmParameterException
	 * @throws IllegalBlockSizeException
	 * @throws BadPaddingException
	 */
    public static String AES_Decode(String str, String key)	throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {

		byte[] textBytes = Base64.decode(str);
		//byte[] textBytes = str.getBytes("UTF-8");
		AlgorithmParameterSpec ivSpec = new IvParameterSpec(ivBytes);
		SecretKeySpec newKey = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(Cipher.DECRYPT_MODE, newKey, ivSpec);
		return new String(cipher.doFinal(textBytes), "UTF-8");
	}

	/**
	 * key32 �먮━ �앹꽦
	 */
	protected static  Random r=null;
	public static String generateKey32(){
		if ( r == null ) r = new Random(System.currentTimeMillis());
	    String str = String.valueOf( r.nextDouble());
		return str.substring(0,16)+str.substring(0,16);
	}
	  //�ㅼ깮��
	/*
	public static byte[] generateKey32() throws NoSuchAlgorithmException{
		KeyGenerator kgen = KeyGenerator.getInstance("AES");
	    kgen.init(256);
	    SecretKey key = kgen.generateKey();
	    return key.getEncoded();

	}
	*/

	public static void main(String[] args) throws InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException{
		//String key = "abcdefghijklmnopqrstuvwxyz123456";
        //String key = AES256Cipher.generateKey32();
		//String plainText;
		//String encodeText;
		//String decodeText;
		// Encrypt
		//plainText  = "imcore.net";

		// Decrypt
		//decodeText = AES256Cipher.AES_Decode("ehAzPHqovIwYMiSOttsp6jehTemY2NyRcizSfQJeT8ZMTW+ZZrzm6ejdCMs2OmKEfw6jvafQBIn3GcirOzboeyjJsQbRqRMRbWFyxgmXlcdFkx0b+5pm5/tElYZ6suZ7De8F0O+PFSTO/HXaR0/b/Fe/9Sx94Fh8QzGhIGBPv/CniyErmSqXnJF5vbMbDh/FrPqsBlBVfZF/ngqk0bFpYmn9TgxJnAOCgakJhG8gEa4F/iENkft/SA8IxRCa1EGOVPbizhFgqltZEVcxLiJWyQ==", "0A7FK6ZX957E728TQBM2W66U95I7S2J4");

	}

	/**
	 * �꾩옱 �좎쭨瑜�yyyyMMddHHmmss�뺤떇�쇰줈 媛뽮퀬 �⑤떎.
	 * @return
	 */
	public static String getCurrentTime() {
		Date oDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(oDate);
	}

	/**
	 * 14�먮━yyyyMMddHHmmss�뺤떇 �좎쭨瑜�諛쏆븘 Millis濡�諛섑솚 *1000���섏뿬 珥덇퉴吏�쭔 �ъ슜.
	 * timestamp out.
	 * @param src
	 * @return
	 */
	public static long getCurrentTimeToMillis(String src ) {
		if ( src == null || src.length() != 14) return System.currentTimeMillis()/1000-100;
		Calendar calendar = new GregorianCalendar(
		Integer.parseInt(src.substring(0,4)),
		Integer.parseInt(src.substring(4,6))-1, //month��0-base;
		Integer.parseInt(src.substring(6,8)),
		Integer.parseInt(src.substring(8,10)),
		Integer.parseInt(src.substring(10,12)),
		Integer.parseInt(src.substring(12,14)));

		// 1000遺꾩쓽 1珥덈뒗 踰꾨┝.
		return calendar.getTimeInMillis()/1000;
	}

	/**
	 * 1000遺꾩쓽 1珥덈뒗 踰꾨┝.
	 * timestamp
	 * @return
	 */
	public static long getCurrentTimeMillis() {
		// 1000遺꾩쓽 1珥덈뒗 踰꾨┝.
		return System.currentTimeMillis()/1000;
	}
}