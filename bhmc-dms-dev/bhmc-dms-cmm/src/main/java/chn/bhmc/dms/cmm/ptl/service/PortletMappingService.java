package chn.bhmc.dms.cmm.ptl.service;

import java.util.List;

import chn.bhmc.dms.cmm.ptl.vo.PortletMappingSaveVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletMappingSearchVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletMappingVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletMappingService.java
 * @Description : 포틀릿-직무/사용자 매핑 관리 서비스
 * @author Kang Seok Han
 * @since 2017. 3. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 8.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface PortletMappingService {   
	
	/**
     * 포틀릿-직무/사용자 매핑 정보를 저장한다.
     * 이전 포트릿-직무/사용자 매핑 정보를 삭제하고 등록한다.
     * @param portletMappings
     * @throws Exception
     */
    public void deleteAndInsertPortletMapping(PortletMappingSaveVO portletMappingSaveVO) throws Exception;

    /**
     * 포틀릿-직무/사용자 매핑 목록을 조회한다.
     * @param portletMappingSearchVO
     * @return
     * @throws Exception
     */
    public List<PortletMappingVO> selectPortletMappingByCondition(PortletMappingSearchVO portletMappingSearchVO) throws Exception;

    /**
     * 포틀릿-직무/사용자 매핑 목록수를 조회한다.
     * @param portletMappingSearchVO
     * @return
     * @throws Exception
     */
    public int selectPortletMappingByConditionCnt(PortletMappingSearchVO portletMappingSearchVO) throws Exception;
    
    /**
     * 사용자의 직무와 ID에 매핑된 포틀릿 목록을 조회한다.
     * @param portletMappingSearchVO
     * @return
     * @throws Exception
     */
    public List<PortletMappingVO> selectPortletMappingByUser(PortletMappingSearchVO portletMappingSearchVO) throws Exception;
}
