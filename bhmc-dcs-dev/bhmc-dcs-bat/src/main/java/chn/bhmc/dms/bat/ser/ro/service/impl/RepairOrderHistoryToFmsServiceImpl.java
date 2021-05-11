package chn.bhmc.dms.bat.ser.ro.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.bat.ser.ro.service.RepairOrderHistoryToFmsService;
import chn.bhmc.dms.bat.ser.ro.service.dao.RepairOrderHistoryToFmsDAO;

/**
 * 维保记录传送
 * @ClassName   : RepairOrderHistoryToFmsServiceImpl.java
 * @author TJX
 * @since 2020. 4. 1.
 * 
 */
@Service("repairOrderHistoryToFmsService")
public class RepairOrderHistoryToFmsServiceImpl  extends HService implements RepairOrderHistoryToFmsService{

	 @Resource(name="repairOrderHistoryToFmsDAO")
	 RepairOrderHistoryToFmsDAO repairOrderHistoryToFmsDAO;
	 
	 
	@Override
	public void insertRoHistoryToFmsSend() {
		repairOrderHistoryToFmsDAO.insertRoHistoryToFmsSend();		
	}

}
