package chn.bhmc.dms.cmm.ptl.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.ptl.vo.PortletTaskMappingSearchVO;

import chn.bhmc.dms.cmm.ptl.vo.PortletTaskMappingVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletTaskMappingDAO.java
 * @Description : 포틀릿-직무 매핑 관리 DAO
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
@Mapper("portletTaskMappingDAO")
public interface PortletTaskMappingDAO {

    /**
     * 전체 포틀릿 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<PortletTaskMappingVO> selectPortlets();

    /**
     * 직무코드에 해당하는 포틀릿-직무 매핑 목록을 조회한다
     * @param tskCd 직무코드
     * @return
     * @throws Exception
     */
    public List<PortletTaskMappingVO> selectPortletTaskMappingsByTskCd(String tskCd);

    /**
     * 포틀릿-직무 매핑 목록을 조회한다.
     * @param portletTaskMappingSearchVO
     * @return
     * @throws Exception
     */
    public List<PortletTaskMappingVO> selectPortletTaskMappingByCondition(PortletTaskMappingSearchVO portletTaskMappingSearchVO);

    /**
     * 포틀릿-직무 매핑 목록수를 조회한다.
     * @param portletTaskMappingSearchVO
     * @return
     * @throws Exception
     */
    public int selectPortletTaskMappingByConditionCnt(PortletTaskMappingSearchVO portletTaskMappingSearchVO);

    /**
     * 직무코드에 해당하는 포틀릿-직무 매핑 목록을 삭제한다.
     * @param tskCd
     * @return
     */
    public int deletePortletTaskMappingByTskCd(String tskCd);

    /**
     * 포틀릿-직무 매핑 정보를 등록한다.
     * @param portletTaskMappingVO
     * @return
     */
    public int insertPortletTaskMapping(PortletTaskMappingVO portletTaskMappingVO);

}
