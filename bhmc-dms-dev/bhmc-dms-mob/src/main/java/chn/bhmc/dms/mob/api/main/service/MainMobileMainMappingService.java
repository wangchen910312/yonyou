package chn.bhmc.dms.mob.api.main.service;

import chn.bhmc.dms.mob.api.main.vo.MobileMainMappingVO;

public interface MainMobileMainMappingService {

    public MobileMainMappingVO selectMobileMainMapping(String usrId) throws Exception;
}
