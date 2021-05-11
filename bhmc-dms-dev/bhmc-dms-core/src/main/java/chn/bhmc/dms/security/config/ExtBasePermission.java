package chn.bhmc.dms.security.config;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.acls.domain.BasePermission;
import org.springframework.security.acls.domain.DefaultPermissionFactory;
import org.springframework.security.acls.model.Permission;


public class ExtBasePermission extends BasePermission {

	/**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8668983435118747148L;

    protected static DefaultPermissionFactory defaultPermissionFactory;

//	기본 권한 - BasePermission 참고
//	READ('R'), WRITE('W'), CREATE('C'), DELETE('D'), ADMINISTRATION('A')

	//조회권한(본인)
    public static final Permission SEARCHIND = new ExtBasePermission(1 << 5, 'I'); // 32

    //조회권한(전체)
    public static final Permission SEARCHALL = new ExtBasePermission(1 << 6, 'S'); // 64

//  추가 권한
//	public static final Permission LIST = new ExtBasePermission(1 << 5, 'L'); // 32
//	public static final Permission PRINT = new ExtBasePermission(1 << 6, 'P'); // 64
//	public static final Permission REPORT = new ExtBasePermission(1 << 7, 'r'); // 128
//	public static final Permission POPUP = new ExtBasePermission(1 << 8, 'p'); // 256
//	public static final Permission DOWNLOAD = new ExtBasePermission(1 << 9, 'd'); // 512
//	public static final Permission UPLOAD = new ExtBasePermission(1 << 10, 'u'); // 1024
//	public static final Permission HELP = new ExtBasePermission(1 << 11, 'h'); // 2048

//	기타 예약 권한
//	public static final Permission FNC0 = new ExtBasePermission(1 << 12, '0');
//	public static final Permission FNC1 = new ExtBasePermission(1 << 13, '1');
//	public static final Permission FNC2 = new ExtBasePermission(1 << 14, '2');
//	public static final Permission FNC3 = new ExtBasePermission(1 << 15, '3');
//	public static final Permission FNC4 = new ExtBasePermission(1 << 16, '4');
//	public static final Permission FNC5 = new ExtBasePermission(1 << 17, '5');
//	public static final Permission FNC6 = new ExtBasePermission(1 << 18, '6');
//	public static final Permission FNC7 = new ExtBasePermission(1 << 19, '7');
//	public static final Permission FNC8 = new ExtBasePermission(1 << 20, '8');
//	public static final Permission FNC9 = new ExtBasePermission(1 << 21, '9');

	private static final Map<Integer, String[]> registeredPermissionNames = new HashMap<Integer, String[]>();

	static {
		defaultPermissionFactory = new DefaultPermissionFactory(ExtBasePermission.class);

		registeredPermissionNames.put(new Integer(1 << 0), new String[] { "READ", "R" });				//1
		registeredPermissionNames.put(new Integer(1 << 1), new String[] { "WRITE", "W" });				//2
		registeredPermissionNames.put(new Integer(1 << 2), new String[] { "CREATE", "C" });				//4
		registeredPermissionNames.put(new Integer(1 << 3), new String[] { "DELETE", "D" });				//8
		registeredPermissionNames.put(new Integer(1 << 4), new String[] { "ADMINISTRATION", "A" });		//16
		registeredPermissionNames.put(new Integer(1 << 5), new String[] { "SEARCHIND", "I" });          //32
        registeredPermissionNames.put(new Integer(1 << 6), new String[] { "SEARCHALL", "S" });          //64

//		registeredPermissionNames.put(new Integer(1 << 5), new String[] { "LIST", "L" });				//32
//		registeredPermissionNames.put(new Integer(1 << 6), new String[] { "PRINT", "P" });				//64
//		registeredPermissionNames.put(new Integer(1 << 7), new String[] { "REPORT", "r" });				//128
//		registeredPermissionNames.put(new Integer(1 << 8), new String[] { "POPUP", "p" });				//256
//		registeredPermissionNames.put(new Integer(1 << 9), new String[] { "DOWNLOAD", "d" });			//512
//		registeredPermissionNames.put(new Integer(1 << 10), new String[] { "UPLOAD", "u" });			//1024
//		registeredPermissionNames.put(new Integer(1 << 11), new String[] { "HELP", "h" });				//2048
//		registeredPermissionNames.put(new Integer(1 << 12), new String[] { "FNC0", "0" });
//		registeredPermissionNames.put(new Integer(1 << 13), new String[] { "FNC1", "1" });
//		registeredPermissionNames.put(new Integer(1 << 14), new String[] { "FNC2", "2" });
//		registeredPermissionNames.put(new Integer(1 << 15), new String[] { "FNC3", "3" });
//		registeredPermissionNames.put(new Integer(1 << 16), new String[] { "FNC4", "4" });
//		registeredPermissionNames.put(new Integer(1 << 17), new String[] { "FNC5", "5" });
//		registeredPermissionNames.put(new Integer(1 << 18), new String[] { "FNC6", "6" });
//		registeredPermissionNames.put(new Integer(1 << 19), new String[] { "FNC7", "7" });
//		registeredPermissionNames.put(new Integer(1 << 20), new String[] { "FNC8", "8" });
//		registeredPermissionNames.put(new Integer(1 << 21), new String[] { "FNC9", "9" });
	}

	/**
	 *
	 */
	protected ExtBasePermission(int mask, char code) {
		super(mask, code);
	}

	/**
	 * Return registerdPermissionNames that contains permission name and code of mask(Integer)
	 *
	 * @return Map
	 */
	public static Map<Integer, String[]> getRegisteredPermissionNames() {
		return Collections.unmodifiableMap(registeredPermissionNames);
	}

	/**
	 * Get permission name that contains a code from pattern of permission
	 * and return list.
	 *
	 * @param permission
	 * 				Permission object
	 *
	 * @return List
	 * 				list of permissionName
	 */
	public static List<String> getPermissionNamesList(Permission permission) {
		if (permission == null) {
			return null;
		}

		List<String> permissionNames = new ArrayList<String>();

		String pattern = permission.getPattern();

		int i = 1;
		int length = pattern.length();
		while (length >= i) {
			if (Permission.RESERVED_OFF != pattern.charAt(length - i)) {
				permissionNames.add((registeredPermissionNames.get(new Integer(new Double(Math.pow(2, i - 1)).intValue())))[0]);
			}
			i++;
		}

		return permissionNames;
	}

	/**
	 * Get permission name that contains a code from pattern of permission
	 * and return array of String
	 *
	 * @param permission
	 * 				Permission object
	 * @return String[]
	 * 				array of permissionName
	 */
	public static String[] getPermissionNamesArray(Permission permission) {
		List<String> permissionNames = getPermissionNamesList(permission);
		return (String[]) permissionNames.toArray(new String[0]);
	}

	/**
	 * Get permission name that contains a code from pattern of permission
	 * and return String that split with comma
	 *
	 * @param permission
	 * 				Permission class
	 * @return String
	 * 				permissionNames that split with comma
	 */
	public static String getPermissionNames(Permission permission) {
		return getPermissionNames(permission, ",");
	}

	/**
	 * Get permission name that contains a code from pattern of permission
	 * and return String that split with given separator
	 *
	 * @param permission
	 * 				Permission class
	 * @param String
	 * 				separator
	 * @return String
	 * 				permissionNames that split with comma
	 */
	public static String getPermissionNames(Permission permission, String separator) {
		List<String> permissionNames = getPermissionNamesList(permission);

		if (permissionNames == null || permissionNames.size() < 1) {
			return "";
		}
		else if (permissionNames.size() == 1) {
			return (String) permissionNames.get(0);
		}

		StringBuffer permissionNamesStr = new StringBuffer();
		for (int i = 0; i < permissionNames.size(); i++) {
			if (i != 0) {
				permissionNamesStr.append(separator);
			}
			permissionNamesStr.append(permissionNames.get(i));
		}

		return permissionNamesStr.toString();
	}

	/**
	 * Get value of mask from permission name that split with comma
	 *
	 * @param permissionNames
	 * 				permission names that split with comma.  ex) "READ,WRITE"
	 * @return value of mask(int)
	 * 				value of mask(int) that is sum of permission names
	 */
	public static int getPermissionMask(String permissionNames) {
	    if(StringUtils.isBlank(permissionNames)){
	        return 0;
	    }
		return getPermissionMask(permissionNames, ",");
	}

	/**
	 * Get value of mask from permission name that split with given separator
	 *
	 * @param permissionNames
	 * 				permission names that split with given separator.  ex) "READ,WRITE,PRINT"
	 * @param String
	 * 				separator
	 * @return value of mask(int)
	 * 				value of mask(int) that is sum of permission names
	 */
	public static int getPermissionMask(String permissionNames, String separator) {
		return getPermissionMask(permissionNames.replaceAll("\\s+", "").split(separator));
	}

	/**
	 * Get value of mask from array of permission name
	 *
	 * @param permissionNames
	 * 				String array of permission names
	 * @return value of mask(int)
	 * 				value of mask(int) that is sum of permission names
	 */
	public static int getPermissionMask(String[] permissionNames) {
		int mask = 0;
		for (int i = 0; i < permissionNames.length; i++) {
			mask += buildFromName(permissionNames[i]).getMask();
		}
		return mask;
	}

    public final static Permission buildFromName(String name) {
    	return defaultPermissionFactory.buildFromName(name);
    }

    public final static Permission buildFromMask(int mask) {
        return defaultPermissionFactory.buildFromMask(mask);
    }
}