package chn.bhmc.dms.sample.tx.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.query.CommonQueryService;
import chn.bhmc.dms.sample.tx.service.SampleUpdateService;
import chn.bhmc.dms.sample.tx.service.dao.SampleDAO;

@Service("sampleUpdateService")
public class SampleUpdateServiceImpl implements SampleUpdateService {
	
	@Resource(name="commonQueryService")
	CommonQueryService commonQueryService;
	
	@Resource(name="sampleDAO")
	SampleDAO sampleDAO;

	@Override
	public int deleteInsertSample(String aaa, int id) {		
		commonQueryService.execute("TEST_INSERT", aaa, id);
		commonQueryService.execute("TEST_DELETE", aaa);
		return 1;
	}

	@Override
	public int updateSample(String aaa, int id) throws Exception {
		return sampleDAO.updateSample(aaa, id);
	}
}
