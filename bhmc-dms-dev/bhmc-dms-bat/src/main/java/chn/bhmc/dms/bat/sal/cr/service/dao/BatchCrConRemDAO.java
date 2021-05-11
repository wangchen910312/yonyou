package chn.bhmc.dms.bat.sal.cr.service.dao;

import java.util.List;

import chn.bhmc.dms.bat.sal.cr.vo.BatchCrConRemVO;
import able.com.mybatis.Mapper;

@Mapper("batchCrConRemDAO")
public interface BatchCrConRemDAO {
	
	 public List<BatchCrConRemVO> selectCrConDataList() throws Exception;
}
