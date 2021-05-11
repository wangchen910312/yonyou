package chn.bhmc.dms.sample.tx.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.query.CommonQueryService;
import chn.bhmc.dms.sample.tx.service.SampleDeleteService;
import chn.bhmc.dms.sample.tx.service.SampleInsertService;
import chn.bhmc.dms.sample.tx.service.SampleService;
import chn.bhmc.dms.sample.tx.service.SampleUpdateService;
import chn.bhmc.dms.sample.tx.service.dao.SampleDAO;

@Service("sampleService")
public class SampleServiceImpl implements SampleService {
	
	@Resource(name="sampleDAO")
	SampleDAO sampleDAO;
	
	@Resource(name="sampleInsertService")
	SampleInsertService sampleInsertService;
	
	@Resource(name="sampleUpdateService")
	SampleUpdateService sampleUpdateService;
	
	@Resource(name="sampleDeleteService")
	SampleDeleteService sampleDeleteService;
	
	@Resource(name="commonQueryService")
	CommonQueryService commonQueryService;

	@Override
	public void selectProcedureTest(Map<String, String> params) {
		sampleDAO.selectProcedureTest(params);
	}

	@Override
	public int insertSample(String aaa, int id) {
		return sampleDAO.insertSample(aaa, id);
	}

	@Override
	public int updateSample(String aaa, int id) {
		return sampleDAO.updateSample(aaa, id);
	}
	
	@Override
	public int deleteSample(String aaa, int id) {
		return sampleDAO.deleteSample(aaa, id);
	}

	@Override
	public void updateInsertSample() throws Exception {
		sampleDeleteService.deleteSample("aaa1", 1);
		sampleDeleteService.deleteSample("aaa2", 2);
		sampleInsertService.insertSample("aaa1", 1);
		sampleInsertService.insertSample("aaa2", 2);
		
		//아래 수행 쿼리는 롤백 되지 않는다.
		commonQueryService.execute("TEST_DELETE", "aaa3");
		commonQueryService.execute("TEST_INSERT", "aaa3", 3);		
		
		throw new Exception("Exception");  
	}
}
