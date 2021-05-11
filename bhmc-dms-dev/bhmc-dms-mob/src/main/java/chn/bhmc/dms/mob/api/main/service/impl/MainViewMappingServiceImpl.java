package chn.bhmc.dms.mob.api.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.main.dao.MainViewMappingDAO;
import chn.bhmc.dms.mob.api.main.service.MainViewMappingService;
import chn.bhmc.dms.mob.api.main.vo.ViewMappingSearchVO;
import chn.bhmc.dms.mob.api.main.vo.ViewMappingVO;

/**
 * <pre>
 * 화면-사용자/부서/직무 매핑 서비스 구현 클래스
 * </pre>
 *
 * @ClassName   : ViewAuthoritiesServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 8. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 15.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("MainViewMappingService")
public class MainViewMappingServiceImpl extends HService implements MainViewMappingService {

    @Resource(name="MainViewMappingDAO")
    MainViewMappingDAO MainViewMappingDAO;

    @Override
    @Cacheable(value="viewMappingCache")
    public List<ViewMappingVO> selectViewMappingsWithPermission(ViewMappingSearchVO viewMappingSearchVO)
            throws Exception {
        return MainViewMappingDAO.selectViewMappingsWithPermission(viewMappingSearchVO);
    }

}
