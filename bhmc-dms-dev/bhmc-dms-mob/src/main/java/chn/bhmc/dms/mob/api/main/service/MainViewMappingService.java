package chn.bhmc.dms.mob.api.main.service;

import java.util.List;

import chn.bhmc.dms.mob.api.main.vo.ViewMappingSearchVO;
import chn.bhmc.dms.mob.api.main.vo.ViewMappingVO;


public interface MainViewMappingService {

    public List<ViewMappingVO> selectViewMappingsWithPermission(ViewMappingSearchVO viewMappingSearchVO) throws Exception;

}
