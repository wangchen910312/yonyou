package chn.bhmc.dms.cmm.ptl.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.ptl.vo.PortletSearchVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 9.     Kang Seok Han     최초 생성
 * </pre>
 */
@Mapper("portletDAO")
public interface PortletDAO {

    /**
     * 포틀릿 정보를 등록한다.
     * @param portletVO - 등록할 정보가 담긴 PortletVO
     * @return 등록된 목록수
     */
    public int insertPortlet(PortletVO portletVO);

    /**
     * 포틀릿 정보를 수정한다.
     * @param portletVO - 수정할 정보가 담긴 PortletVO
     * @return 수정된 목록수
     */
    public int updatePortlet(PortletVO portletVO);

    /**
     * 포틀릿 정보를 삭제한다.
     * @param portletVO - 삭제할 정보가 담긴 PortletVO
     * @return 삭제된 목록수
     */
    public int deletePortlet(PortletVO portletVO);

    /**
     * Key에 해당하는 포틀릿 정보를 조회한다.
     * @param portletId - 포틀릿 아이디
     * @return 조회한 포틀릿 정보
     */
    public PortletVO selectPortletByKey(String portletId);

    /**
     * 조회 조건에 해당하는 포틀릿 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PortletSearchVO
     * @return 조회 목록
     */
    public List<PortletVO> selectPortletsByCondition(PortletSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 포틀릿 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PortletSearchVO
     * @return
     */
    public int selectPortletsByConditionCnt(PortletSearchVO searchVO);
}
