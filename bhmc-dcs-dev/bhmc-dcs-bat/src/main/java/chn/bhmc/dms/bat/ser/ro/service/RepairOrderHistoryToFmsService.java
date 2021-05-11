package chn.bhmc.dms.bat.ser.ro.service;


/**
 * 维保记录传送
 * @ClassName   : RepairOrderHistoryToFmsService.java
 * @author TJX
 * @since 2020. 4. 1.
 * 
 */
public interface RepairOrderHistoryToFmsService {
	
	/**
    *
    * fms RO 维保记录传送
    *
    * @throws Exception
    */
	public void insertRoHistoryToFmsSend() ;

}
