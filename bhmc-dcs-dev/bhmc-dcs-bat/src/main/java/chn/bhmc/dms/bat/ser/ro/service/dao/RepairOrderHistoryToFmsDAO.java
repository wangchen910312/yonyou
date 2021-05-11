package chn.bhmc.dms.bat.ser.ro.service.dao;

import able.com.mybatis.Mapper;

/**
 * 维保记录传送
 * @ClassName   : RepairOrderHistoryToFmsDAO.java
 * @author TJX
 * @since 2020. 4. 1.
 * 
 */
@Mapper("repairOrderHistoryToFmsDAO")
public interface RepairOrderHistoryToFmsDAO {

	/**
    *
    * fms RO 维保记录传送
    *
    * @throws Exception
    */
	public void insertRoHistoryToFmsSend();

}
