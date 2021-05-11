package chn.bhmc.dms.sample.tx.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sample.tx.service.SampleDeleteService;
import chn.bhmc.dms.sample.tx.service.dao.SampleDAO;

@Service("sampleDeleteService")
public class SampleDeleteServiceImpl implements SampleDeleteService {
	
	@Resource(name="sampleDAO")
	SampleDAO sampleDAO;

	@Override
	public int deleteSample(String aaa, int id) {
		return sampleDAO.deleteSample(aaa, id);
	}
}
