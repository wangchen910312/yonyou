package chn.bhmc.dms.mob.api.main.dao;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.main.vo.MobileMainMappingVO;


@Mapper("MainMobileMainMappingDAO")
public interface MainMobileMainMappingDAO {

    public MobileMainMappingVO selectMobileMainMapping(String usrId);
}
