package chn.bhmc.dms.bat.sal.cnt.service.dao;

import able.com.mybatis.Mapper;

@Mapper("batchContractToFmsDAO")
public interface BatchContractToFmsDAO {
	 public void executeProcedure() throws Exception;
}
