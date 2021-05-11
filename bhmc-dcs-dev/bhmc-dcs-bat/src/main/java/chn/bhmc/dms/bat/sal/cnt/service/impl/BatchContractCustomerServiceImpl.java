package chn.bhmc.dms.bat.sal.cnt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.bat.sal.cnt.service.BatchContractCustomerService;
import chn.bhmc.dms.bat.sal.cnt.service.dao.BatchContractCustomerDao;

@Service("batchContractCustomerService")
public class BatchContractCustomerServiceImpl extends HService implements BatchContractCustomerService{
   @Resource(name="batchContractCustomerDao")
   BatchContractCustomerDao batchContractCustomerDao;

	@Override
	public void executeProcedure() throws Exception {
		batchContractCustomerDao.executeProcedure();
	}
	   
	   
}
