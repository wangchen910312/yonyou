package chn.bhmc.dms.cmm.ptl.service;

import java.util.List;

import chn.bhmc.dms.cmm.ptl.vo.PortletTaskMappingSaveVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletTaskMappingSearchVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletTaskMappingVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletTaskMappingService.java
 * @Description : 포틀릿-직무 매핑 관리 서비스
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

public interface PortletTaskMappingService {

    /**
     * 전체 포틀릿 목록을 조회한다.
     * @return
     * @throws Exception
     */
    public List<PortletTaskMappingVO> selectPortlets() throws Exception;

    /**
     * 직무코드에 해당하는 포틀릿-직무 매핑 목록을 조회한다
     * @param tskCd 직무코드
     * @return
     * @throws Exception
     */
    public List<PortletTaskMappingVO> selectPortletTaskMappingsByTskCd(String tskCd) throws Exception;

    /**
     * 포틀릿-직무 매핑 목록을 조회한다.
     * @param portletTaskMappingSearchVO
     * @return
     * @throws Exception
     */
    public List<PortletTaskMappingVO> selectPortletTaskMappingByCondition(PortletTaskMappingSearchVO portletTaskMappingSearchVO) throws Exception;

    /**
     * 포틀릿-직무 매핑 목록수를 조회한다.
     * @param portletTaskMappingSearchVO
     * @return
     * @throws Exception
     */
    public int selectPortletTaskMappingByConditionCnt(PortletTaskMappingSearchVO portletTaskMappingSearchVO) throws Exception;

    /**
     * 포틀릿-직무 매핑 정보를 저장한다.
     * 이전 포트릿-직무 매핑 정보를 삭제하고
     * @param portletTaskMappings
     * @throws Exception
     */
    public void deleteAndInsertPortletTaskMapping(PortletTaskMappingSaveVO portletTaskMappingSaveVO) throws Exception;

}
