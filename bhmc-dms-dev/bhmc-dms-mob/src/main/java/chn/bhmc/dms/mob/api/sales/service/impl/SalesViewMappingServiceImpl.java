package chn.bhmc.dms.mob.api.sales.service.impl;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.sales.dao.SalesViewMappingDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesViewMappingService;
import chn.bhmc.dms.mob.api.sales.vo.ViewMappingVO;
import chn.bhmc.dms.security.config.ExtBasePermission;

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
@Service("SalesViewMappingService")
public class SalesViewMappingServiceImpl extends HService implements SalesViewMappingService {

    /**
     * 화면-사용자/직무/부서 매핑 관리 DAO
     */
    @Resource(name="SalesViewMappingDAO")
    SalesViewMappingDAO SalesViewMappingDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="viewMappingCache")
    public boolean hasPermission(String sysCd, String viewId, String refTp, String refId, String permissionNames) throws Exception {
        ViewMappingVO viewMappingVO = SalesViewMappingDAO.selectViewMappingByKey(new ViewMappingVO(sysCd, viewId, refTp, refId));

        if(viewMappingVO != null){
            int presentMask = ExtBasePermission.getPermissionMask(permissionNames);
            int mask = viewMappingVO.getMask();

            if (mask == presentMask || ((mask & presentMask) > 0 && (mask & ~presentMask) > 0)) {
                return true;
            }
        }

        return false;
    }
}
