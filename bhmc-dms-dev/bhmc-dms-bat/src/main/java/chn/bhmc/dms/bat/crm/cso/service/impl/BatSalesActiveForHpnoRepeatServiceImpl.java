package chn.bhmc.dms.bat.crm.cso.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.bat.crm.cso.service.BatSalesActiveForHpnoRepeatService;
import chn.bhmc.dms.bat.crm.cso.service.dao.BatSalesActiveForHpnoRepeatDAO;

@Service("batSalesActiveForHpnoRepeatService")
public class BatSalesActiveForHpnoRepeatServiceImpl extends HService implements BatSalesActiveForHpnoRepeatService {
	 
	@Resource(name="batSalesActiveForHpnoRepeatDAO")
	BatSalesActiveForHpnoRepeatDAO batSalesActiveForHpnoRepeatDAO;
	
	@Override
	public int updateSalesActiveForHpnoRepeat() throws Exception {
		return batSalesActiveForHpnoRepeatDAO.updateSalesActiveForHpnoRepeat();
	}

}
