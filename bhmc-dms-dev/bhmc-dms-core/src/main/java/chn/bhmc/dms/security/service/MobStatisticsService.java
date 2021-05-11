package chn.bhmc.dms.security.service;

import chn.bhmc.dms.security.vo.CustomUserVO;

public interface MobStatisticsService {

	void insertAppLogByUserInfo(CustomUserVO user, String url) throws Exception;

}