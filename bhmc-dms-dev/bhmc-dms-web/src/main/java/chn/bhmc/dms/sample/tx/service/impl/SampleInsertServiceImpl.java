package chn.bhmc.dms.sample.tx.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sample.tx.service.SampleInsertService;
import chn.bhmc.dms.sample.tx.service.dao.SampleDAO;

@Service("sampleInsertService")
public class SampleInsertServiceImpl implements SampleInsertService {
	
	@Resource(name="sampleDAO")
	SampleDAO sampleDAO;

	@Override
	public int insertSample(String aaa, int id) {
		return sampleDAO.insertSample(aaa, id);
	}
}
