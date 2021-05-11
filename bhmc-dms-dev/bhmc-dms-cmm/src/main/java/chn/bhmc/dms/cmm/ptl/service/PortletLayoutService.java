package chn.bhmc.dms.cmm.ptl.service;

import java.util.List;

import chn.bhmc.dms.cmm.ath.vo.DistributorArrearsRemindVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletDeployVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletLayoutSearchVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletLayoutVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletLayoutService.java
 * @Description : 포틀릿 레이아웃 관리 서비스
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

public interface PortletLayoutService {

    /**
     * 포틀릿 레이아웃 정보를 등록한다.
     * @param portletLayoutVO - 등록할 정보가 담긴 PortletLayoutVO
     * @return 등록된 목록수
     */
    public int insertPortletLayout(PortletLayoutVO portletLayoutVO) throws Exception;

    /**
     * 포틀릿 레이아웃 정보를 수정한다.
     * @param portletLayoutVO - 수정할 정보가 담긴 PortletLayoutVO
     * @return 수정된 목록수
     */
    public int updatePortletLayout(PortletLayoutVO portletLayoutVO) throws Exception;

    /**
     * 포틀릿 레이아웃 정보를 삭제한다.
     * @param portletLayoutVO - 삭제할 정보가 담긴 PortletLayoutVO
     * @return 삭제된 목록수
     */
    public int deletePortletLayout(PortletLayoutVO portletLayoutVO) throws Exception;

    /**
     * Key에 해당하는 포틀릿 레이아웃 정보를 조회한다.
     * @param portletLayoutId - 포틀릿 레이아웃 아이디
     * @return 조회한 포틀릿 레이아웃 정보
     */
    public PortletLayoutVO selectPortletLayoutByKey(String portletLayoutId) throws Exception;

    /**
     * 포틀릿 레이아웃 정보를 등록/수정/삭제 처리한다.
     * @param portletLayoutSaveVO
     */
	public void multiPortletLayouts(BaseSaveVO<PortletLayoutVO> portletLayoutSaveVO) throws Exception;

	/**
     * 조회 조건에 해당하는 포틀릿 레이아웃 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PortletLayoutSearchVO
     * @return 조회 목록
     */
	public List<PortletLayoutVO> selectPortletLayoutsByCondition(PortletLayoutSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 포틀릿 레이아웃 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PortletLayoutSearchVO
     * @return
     */
	public int selectPortletLayoutsByConditionCnt(PortletLayoutSearchVO searchVO) throws Exception;

	/**
	 * 포틀릿 레이아웃에 설정된 포틀릿 목록을 조회한다.
	 * @param portletLayoutId 포틀릿 레이아웃 아이디
	 * @return
	 * @throws Exception
	 */
	public List<PortletDeployVO> selectDefaultPortletDeploies(String portletLayoutId) throws Exception;

	/**
     * 디폴트 포틀릿 레이아웃 정보를 조회한다.
     * @param usrId - 사용자 ID
     * @return 디폴틀 포틀릿 레이아웃 정보
     */
    public PortletLayoutVO selectDefaultPortletLayout();

	/**
     * 포틀릿 레이아웃의 포틀릿정보를 등록한다.
     * @param portletDeployVO 포틀릿 배치 정보
     * @return
     * @throws Exception
     */
    public int insertDefaultPortletDeploy(PortletDeployVO portletDeployVO) throws Exception;

	/**
	 * 포틀릿 레이아웃의 포틀릿정보를 수정한다.
	 * @param portletDeployVO 포틀릿 배치 정보
	 * @return
	 * @throws Exception
	 */
	public int updateDefaultPortletDeploy(PortletDeployVO portletDeployVO) throws Exception;

	/**
     * 포틀릿 레이아웃의 포틀릿정보를 조회한다.
     * @param portletDeployVO 포틀릿 배치 정보
     * @return
     * @throws Exception
     */
    public PortletDeployVO selectDefaultPortletDeploy(PortletDeployVO portletDeployVO) throws Exception;

    /**
     * 사용자가 설정한 포틀릿 레이아웃 정보를 등록한다.
     * @param portletLayoutVO
     * @return
     */
    public int insertUserPortletLayout(PortletLayoutVO portletLayoutVO) throws Exception;

    /**
     * 사용자가 설정한 포틀릿 레이아웃 정보를 변경한다.
     * @param portletLayoutVO
     * @return
     */
    public int updateUserPortletLayout(PortletLayoutVO portletLayoutVO) throws Exception;

    /**
     * 사용자가 설정한 포틀릿 레이아웃 정보를 조회한다.
     * @param usrId - 사용자 ID
     * @return 사용자정의 포틀릿 레이아웃 정보
     */
    public PortletLayoutVO selectUserPortletLayout(String usrId) throws Exception;

    /**
     * 사용자정의 포틀릿 레이아웃의 포틀릿정보를 등록한다.
     * @param portletDeployVO 포틀릿 배치 정보
     * @return
     * @throws Exception
     */
    public int insertUserPortletDeploy(PortletDeployVO portletDeployVO) throws Exception;

    /**
     * 사용자정의 포틀릿 레이아웃의 포틀릿정보를 수정한다.
     * @param portletDeployVO 포틀릿 배치 정보
     * @return
     * @throws Exception
     */
    public int updateUserPortletDeploy(PortletDeployVO portletDeployVO) throws Exception;

    /**
     * 사용자정의 포틀릿 레이아웃의 포틀릿정보를 조회한다.
     * @param portletDeployVO 포틀릿 배치 정보
     * @return
     * @throws Exception
     */
    public PortletDeployVO selectUserPortletDeploy(PortletDeployVO portletDeployVO) throws Exception;

    /**
     * 사용자정의 포틀릿 레이아웃에 설정된 포틀릿 목록을 조회한다.
     * @param portletLayoutId 포틀릿 레이아웃 아이디
     * @param usrId 사용자 아이디
     * @return
     * @throws Exception
     */
    public List<PortletDeployVO> selectUserPortletDeploies(String portletLayoutId, String usrId) throws Exception;
    
    /**
     * 贾明 经销商欠款信息
     * @return
     */
    public List<DistributorArrearsRemindVO> selectDistributorArrearsByCondition() throws Exception;
}
