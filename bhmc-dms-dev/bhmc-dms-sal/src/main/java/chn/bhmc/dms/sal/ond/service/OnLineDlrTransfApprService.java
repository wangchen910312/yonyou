package chn.bhmc.dms.sal.ond.service;

import java.util.List;

import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfApprSearchVO;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfApprVO;


/**
 * 전상운송신청 서비스
 *
 * @author Lee Seungmin
 * @since 2017. 03. 04.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                         수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2017. 03. 04.     Lee Seungmin     최초 생성
 * </pre>
 */

public interface OnLineDlrTransfApprService {

    /**
     * 조회 조건에 해당하는 전상운송신청 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CmpCarRunMngSearchVO
     * @return
     */
    public int selectOnLineDlrTransfApprCnt(OnLineDlrTransfApprSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 전상운송신청 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainApprSearchVO
     * @return 조회 목록
     */
	public List<OnLineDlrTransfApprVO> selectOnLineDlrTransfAppr(OnLineDlrTransfApprSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 차종정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainApprSearchVO
     * @return 조회 목록
     */
    public List<OnLineDlrTransfApprVO> selectOndCarListsByCondition(OnLineDlrTransfApprSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 차관정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainApprSearchVO
     * @return 조회 목록
     */
    public List<OnLineDlrTransfApprVO> selectOndModelListsByCondition(OnLineDlrTransfApprSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 OCN정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainApprSearchVO
     * @return 조회 목록
     */
    public List<OnLineDlrTransfApprVO> selectOndOcnListsByCondition(OnLineDlrTransfApprSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 외색정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainApprSearchVO
     * @return 조회 목록
     */
    public List<OnLineDlrTransfApprVO> selectOndExtClrListsByCondition(OnLineDlrTransfApprSearchVO searchVO) throws Exception;

    /**
     * 전상운송신청 배기등급목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainApprSearchVO
     * @return 조회 목록
     */
    public List<OnLineDlrTransfApprVO> selectOndFscpRegGradeListsByCondition(OnLineDlrTransfApprSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 내색정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainApprSearchVO
     * @return 조회 목록
     */
    public List<OnLineDlrTransfApprVO> selectOndIntClrListsByCondition(OnLineDlrTransfApprSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전상운송가능지 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainApprSearchVO
     * @return 조회 목록
     */
    public List<OnLineDlrTransfApprVO> selectOndRecevDlrListsByCondition(OnLineDlrTransfApprSearchVO searchVO) throws Exception;


}