package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.ViewMappingUserVO;
import chn.bhmc.dms.mob.api.crm.vo.ViewMappingVO;
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
@Mapper("CrmviewMappingDAO")
public interface CrmViewMappingDAO {

    /**
     * 화면-사용자/직무/부서 매핑 정보를 조회한다.
     * @param viewMappingVO 조회할 정보가 담긴 viewMappingVO
     * @return
     */
    public ViewMappingVO selectViewMappingByKey(ViewMappingVO viewMappingVO);

    /**
     * 화면-사용자  매핑 목록에서 주어진 퍼미션이 있는 사용자 목록을 조회한다.
     * @param sysCd 시스템구분
     * @param viewId 화면ID
     * @param dlrCd 딜러코드
     * @return
     */
    public List<ViewMappingUserVO> selectViewMappingUsersByViewId(@Param("sysCd") String sysCd, @Param("viewId") String viewId, @Param("dlrCd") String dlrCd);
}
