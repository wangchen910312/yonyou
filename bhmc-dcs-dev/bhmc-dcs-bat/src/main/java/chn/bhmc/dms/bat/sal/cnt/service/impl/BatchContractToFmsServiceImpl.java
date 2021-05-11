package chn.bhmc.dms.bat.sal.cnt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.bat.sal.cnt.service.BatchContractToFmsService;
import chn.bhmc.dms.bat.sal.cnt.service.dao.BatchContractToFmsDAO;

@Service("batchContractToFmsService")
public class BatchContractToFmsServiceImpl extends HService implements BatchContractToFmsService{
	@Resource(name="batchContractToFmsDAO")
	BatchContractToFmsDAO batchContractToFmsDAO;

	@Override
	public void executeProcedure() throws Exception {
		batchContractToFmsDAO.executeProcedure();
	}

}
