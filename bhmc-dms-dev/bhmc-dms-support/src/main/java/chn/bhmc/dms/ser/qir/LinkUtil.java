package chn.bhmc.dms.ser.qir;


public class LinkUtil {
	private final static String LINK_KEY = "0A7FK6ZX957E728TQBM2W66U95I7S2J4";

	public static String getLINK_KEY() {
		return LINK_KEY;
	}


	public static String getLinkDecode(String val){
		String returnVal = "";
		try {
			returnVal = AES256Cipher.AES_Decode(val, LinkUtil.getLINK_KEY());
		} catch (Exception e) {
			returnVal = "";
		}
		return returnVal;
	}

	public static String getLinkEncode(String val){
		String returnVal = "";
		try{

			returnVal = AES256Cipher.AES_Encode(val,LinkUtil.getLINK_KEY());
			returnVal = returnVal.replaceAll("\n", "").replaceAll("\r", "");
		}catch (Exception e) {
			returnVal = "";
		}


		return returnVal;
	}



}
