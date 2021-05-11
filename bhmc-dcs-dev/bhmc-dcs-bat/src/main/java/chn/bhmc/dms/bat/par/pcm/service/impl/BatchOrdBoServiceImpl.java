package chn.bhmc.dms.bat.par.pcm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.pcm.service.BatchOrdBoService;
import chn.bhmc.dms.bat.par.pcm.service.dao.BatchOrdBoDAO;
import able.com.service.HService;

@Service("batchOrdBoService")
public class BatchOrdBoServiceImpl extends HService implements BatchOrdBoService{
    
	@Resource(name="batchOrdBoDAO")
	BatchOrdBoDAO batchOrdBoDAO;
	
	@Override
	public void executeBatchORdBoProcedure() throws Exception {
		batchOrdBoDAO.executeBatchORdBoProcedure();
	}

	@Override
	public void updateAppealStatus() throws Exception {
		batchOrdBoDAO.updateAppealStatus();
	}

}
