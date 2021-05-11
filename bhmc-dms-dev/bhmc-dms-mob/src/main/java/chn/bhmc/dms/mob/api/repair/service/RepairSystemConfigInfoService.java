package chn.bhmc.dms.mob.api.repair.service;

import chn.bhmc.dms.mob.api.repair.vo.SystemConfigInfoVO;

public interface RepairSystemConfigInfoService {
	
    public String selectStrValueByKey(String prefKey) throws Exception;
    
    public SystemConfigInfoVO selectSystemConfigInfoByKey(String prefKey) throws Exception;
}
