package chn.bhmc.dms.mob.api.sales.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.mob.api.sales.vo.ViewMappingVO;

/**
 * <pre>
 * 화면-사용자/직무/부서 매핑 DAO
 * </pre>
 *
 * @ClassName   : ViewMappingDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 8. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 9.     Kang Seok Han     최초 생성
 * </pre>
 */
@Mapper("SalesViewMappingDAO")
public interface SalesViewMappingDAO {

    /**
     * 화면-사용자/직무/부서 매핑 정보를 조회한다.
     * @param viewMappingVO 조회할 정보가 담긴 viewMappingVO
     * @return
     */
    public ViewMappingVO selectViewMappingByKey(ViewMappingVO viewMappingVO);
}
