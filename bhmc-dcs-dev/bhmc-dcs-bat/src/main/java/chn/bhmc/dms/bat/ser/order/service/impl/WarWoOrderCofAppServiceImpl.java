package chn.bhmc.dms.bat.ser.order.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.bat.ser.order.service.WarWoOrderCofAppService;
import chn.bhmc.dms.bat.ser.order.service.dao.WarWoOrderCofAppDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WarWoOrderCofAppServiceImpl.java
 * @Description : 需求编号 327 DMS特殊申请发送DCS、DCS接收 DMS-北京现代APP工单确认-保修工单确认申请.
 *                定时每5分钟跑批SER140接口接收的数据   写入主表DMS、DCS特殊申请表SE_1162T
 * @author jiaMing
 * @since 2021.04.02
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  22021.04.02.     jiaMing            
 * </pre>
 */
@Service("warWoOrderCofAppService")
public class WarWoOrderCofAppServiceImpl extends HService implements WarWoOrderCofAppService {
	
	@Resource(name="warWoOrderCofAppDAO")
	WarWoOrderCofAppDAO warWoOrderCofAppDAO;

	@Override
	public void updateInsertInfo() throws Exception {
		warWoOrderCofAppDAO.updateInsertInfo();
		
	}
	
	

}
