package chn.bhmc.dms.bat.crm.cif.service.impl;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.bat.crm.cif.service.BatCustomerInfoDmsService;
import chn.bhmc.dms.bat.crm.cif.service.dao.BatCustomerInfoDAO;

@Service("batCustomerInfoDmsServiceImpl")
public class BatCustomerInfoDmsServiceImpl extends HService implements BatCustomerInfoDmsService{
    
	@Resource(name="batCustomerInfoDAO")
	BatCustomerInfoDAO batCustomerInfoDAO;
    
	@Override
	public int insertCustInfoDmsDcs() throws Exception {
		batCustomerInfoDAO.insertCustInfoDmsDcs();
		return 0;
	}
}
