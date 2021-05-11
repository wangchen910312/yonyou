package chn.bhmc.dms.cmm.ptl.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.ptl.vo.PortletMappingSaveVO;

import chn.bhmc.dms.cmm.ptl.vo.PortletMappingSearchVO;

import chn.bhmc.dms.cmm.ptl.vo.PortletMappingVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletMappingDAO.java
 * @Description : 포틀릿-직무/사용자 매핑 관리 DAO
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
@Mapper("portletMappingDAO")
public interface PortletMappingDAO {

	/**
     * 포틀릿-직무/사용자 매핑 정보를 등록한다.
     * @param portletMappingVO
     * @return
     */
    public int insertPortletMapping(PortletMappingVO portletMappingVO);

    /**
     * 참조유형 해당하는 포틀릿-직무 매핑 목록을 삭제한다.
     * @param refTp 참조유형 'T':직무, 'U':사용자
     * @return
     */
    public int deletePortletMappingByRefTp(PortletMappingSaveVO portletMappingSaveVO);

    /**
     * 포틀릿-직무/사용자 매핑 목록을 조회한다.
     * @param portletMappingSearchVO
     * @return
     * @throws Exception
     */
    public List<PortletMappingVO> selectPortletMappingByCondition(PortletMappingSearchVO portletMappingSearchVO);

    /**
     * 포틀릿-직무/사용자 매핑 목록수를 조회한다.
     * @param portletMappingSearchVO
     * @return
     * @throws Exception
     */
    public int selectPortletMappingByConditionCnt(PortletMappingSearchVO portletMappingSearchVO);

    /**
     * 사용자의 직무와 ID에 매핑된 포틀릿 목록을 조회한다.
     * @param portletMappingSearchVO
     * @return
     * @throws Exception
     */
    public List<PortletMappingVO> selectPortletMappingByUser(PortletMappingSearchVO portletMappingSearchVO);

}
