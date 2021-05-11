package chn.bhmc.dms.mob.api.main.service;

import java.util.List;

import chn.bhmc.dms.mob.api.main.vo.MenuVO;


public interface MainViewInfoService {

    public  List<MenuVO> selectMenuListByUser(String sysCd, String webMobileDstinCd, String usrId) throws Exception;

}
