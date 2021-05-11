package chn.bhmc.dms.cmm.ptl.service;

import java.util.List;

import chn.bhmc.dms.cmm.ptl.vo.PortletSearchVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletService.java
 * @Description : 포틀릿 관리 서비스
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

public interface PortletService {

    /**
     * 포틀릿 정보를 등록한다.
     * @param portletVO - 등록할 정보가 담긴 PortletVO
     * @return 등록된 목록수
     */
    public int insertPortlet(PortletVO portletVO) throws Exception;

    /**
     * 포틀릿 정보를 수정한다.
     * @param portletVO - 수정할 정보가 담긴 PortletVO
     * @return 수정된 목록수
     */
    public int updatePortlet(PortletVO portletVO) throws Exception;

    /**
     * 포틀릿 정보를 삭제한다.
     * @param portletVO - 삭제할 정보가 담긴 PortletVO
     * @return 삭제된 목록수
     */
    public int deletePortlet(PortletVO portletVO) throws Exception;

    /**
     * Key에 해당하는 포틀릿 정보를 조회한다.
     * @param portletId - 포틀릿 아이디
     * @return 조회한 포틀릿 정보
     */
    public PortletVO selectPortletByKey(String portletId) throws Exception;

    /**
     * 포틀릿 정보를 등록/수정/삭제 처리한다.
     * @param portletSaveVO
     */
	public void multiPortlets(BaseSaveVO<PortletVO> portletSaveVO) throws Exception;

	/**
     * 조회 조건에 해당하는 포틀릿 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PortletSearchVO
     * @return 조회 목록
     */
	public List<PortletVO> selectPortletsByCondition(PortletSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 포틀릿 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PortletSearchVO
     * @return
     */
	public int selectPortletsByConditionCnt(PortletSearchVO searchVO) throws Exception;
}
