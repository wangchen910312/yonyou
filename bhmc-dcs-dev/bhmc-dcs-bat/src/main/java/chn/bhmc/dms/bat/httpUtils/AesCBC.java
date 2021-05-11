package chn.bhmc.dms.bat.httpUtils;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
* AES 是一种可逆加密算法，对用户的敏感信息加密处理
* 对原始数据进行AES加密后，在进行Base64编码转化；
* 正确
*/
public class AesCBC {
/*已确认
* 加密用的Key 可以用26个字母和数字组成
* 此处使用AES-128-CBC加密模式，key需要为16位。
*/
    private static String sKey="1234567890abcdef";
    private static String ivParameter="1234567890abcdef";
    private static AesCBC instance=null;
    //private static 
    private AesCBC(){

    }
    public static AesCBC getInstance(){
        if (instance==null)
            instance= new AesCBC();
        return instance;
    }
    // 加密
    public String encrypt(String sSrc, String encodingFormat, String sKey, String ivParameter) throws Exception {
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        byte[] raw = sKey.getBytes();
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        IvParameterSpec iv = new IvParameterSpec(ivParameter.getBytes());//使用CBC模式，需要一个向量iv，可增加加密算法的强度
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);
        byte[] encrypted = cipher.doFinal(sSrc.getBytes(encodingFormat));
        return new BASE64Encoder().encode(encrypted);//此处使用BASE64做转码。
}

    // 解密
    public String decrypt(String sSrc, String encodingFormat, String sKey, String ivParameter) throws Exception {
        try {
            byte[] raw = sKey.getBytes("ASCII");
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            IvParameterSpec iv = new IvParameterSpec(ivParameter.getBytes());
            cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
            byte[] encrypted1 = new BASE64Decoder().decodeBuffer(sSrc);//先用base64解密
            byte[] original = cipher.doFinal(encrypted1);
            String originalString = new String(original,encodingFormat);
            return originalString;
        } catch (Exception ex) {
            return null;
        }
}

    public static void main(String[] args) throws Exception {
        // 需要加密的字串
//        String cSrc = "{\"OperatorID\":\"123456789\",\"OperatorSecret\":\"1234567890abcdef\"}";
        String cSrc = "{\"InvoiceDate\":1555468999,\"CustomerName\":\"张三\",\"CustomerPhone\":\"18329123333\",\"DelearCode\":\"523318\",\"DelearName\":\"无锡挚达\",\"Vehicle\":\"Q1\",\"VIN\":\"LBEADAFC1KX476829\",\"Zone\":\"华南\",\"Province\":\"广东省\",\"City\":\"广州市\",\"District\":\"天河区\",\"Address\":\"测村\",\"InstallationType\":1,\"Remark\":\"\",\"OrderNo\":\"FAD2327201904260010\"}";
        
        System.out.println("加密前的字串是："+cSrc);
        // 加密
        String enString = AesCBC.getInstance().encrypt(cSrc,"utf-8",sKey,ivParameter);
        Pattern p = Pattern.compile("\\s*|\t|\r|\n");
		Matcher m = p.matcher(enString);
		String enString1 = m.replaceAll("");
        System.out.println("加密后的字串是："+ enString1);
//        System.out.println("加密后的字串是："+ "mYvffpNoFf4E/ZTC1tOw4+S74uaNgpDhWMT5uPmKMx85MaH8xOvGGkfRD+sxTiozejsfxIVge8Hi9/aaO4BIyg==");
//        System.out.println("mYvffpNoFf4E/ZTC1tOw4+S74uaNgpDhWMT5uPmKMx85MaH8xOvGGkfRD+sxTiozejsfxIVge8Hi9/aaO4BIyg==".replace("\n", "").equals(enString));
        enString1 = "mYvffpNoFf4E/ZTC1tOw4yzz6ETMMfUS+AqSbBm61fMX47ti2k9wdNm+grZT2ad0KKkcffmnl5zHHwF6CJgpkvw8A3NEK4IaNGE91ZmnQunynTRqjWJKY8wvrUjhc5f1mIJk8BlmAD55xJLnoWlpLWqO5gmRWG3n4pXTUsXKjZlH5iDORxs4mYVthCz5OYUsdOfIe9h7hjh7iD3yS/hXvjI/n19WJnGbCVlsIOhJrho=";
        // 解密
        String DeString = AesCBC.getInstance().decrypt(enString1,"utf-8",sKey,ivParameter);
        System.out.println("解密后的字串是：" + DeString);
//        String enString1 = "V2chBzDFf72lw1rBUIHQ8IOvNJlLP39n2JPEaS8P9PshjRicdzuf0B8aF3ARICZurpbdWzu69iv1wdZtTOlIGA==";
//        String DeString1 = AesCBC.getInstance().decrypt(enString1,"utf-8",sKey,ivParameter);
//        System.out.println("解密后的字串是：" + DeString1);
    }
}