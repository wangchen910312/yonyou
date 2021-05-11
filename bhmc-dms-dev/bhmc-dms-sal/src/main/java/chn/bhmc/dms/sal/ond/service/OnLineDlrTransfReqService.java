package chn.bhmc.dms.sal.ond.service;

import java.util.List;

import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfReqSaveVO;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfReqSearchVO;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfReqVO;


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

public interface OnLineDlrTransfReqService {

    /**
     * 조회 조건에 해당하는 전상운송신청 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CmpCarRunMngSearchVO
     * @return
     */
    public int selectOnLineDlrTransfReqCnt(OnLineDlrTransfReqSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 전상운송신청 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainReqSearchVO
     * @return 조회 목록
     */
	public List<OnLineDlrTransfReqVO> selectOnLineDlrTransfReq(OnLineDlrTransfReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 차종정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainReqSearchVO
     * @return 조회 목록
     */
    public List<OnLineDlrTransfReqVO> selectOndCarListsByCondition(OnLineDlrTransfReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 차관정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainReqSearchVO
     * @return 조회 목록
     */
    public List<OnLineDlrTransfReqVO> selectOndModelListsByCondition(OnLineDlrTransfReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 OCN정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainReqSearchVO
     * @return 조회 목록
     */
    public List<OnLineDlrTransfReqVO> selectOndOcnListsByCondition(OnLineDlrTransfReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 외색정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainReqSearchVO
     * @return 조회 목록
     */
    public List<OnLineDlrTransfReqVO> selectOndExtClrListsByCondition(OnLineDlrTransfReqSearchVO searchVO) throws Exception;

    /**
     * 전상운송신청 배기등급목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainReqSearchVO
     * @return 조회 목록
     */
    public List<OnLineDlrTransfReqVO> selectOndFscpRegGradeListsByCondition(OnLineDlrTransfReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 내색정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainReqSearchVO
     * @return 조회 목록
     */
    public List<OnLineDlrTransfReqVO> selectOndIntClrListsByCondition(OnLineDlrTransfReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전상운송가능지 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleObtainReqSearchVO
     * @return 조회 목록
     */
    public List<OnLineDlrTransfReqVO> selectOndRecevDlrListsByCondition(OnLineDlrTransfReqSearchVO searchVO) throws Exception;

    /**
     * 전상운송신청 저장한다.
     * @param saveVO
     */
    public void saveOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO saveVO) throws Exception;

    int insertOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO saveVO) throws Exception;
    int updateOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO saveVO) throws Exception;
    int deleteOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO saveVO) throws Exception;
    int procOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO saveVO) throws Exception;

    /**
     * 전상운송신청 폐기한다.
     * @param saveVO
     */
    public int deleteScrapOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO saveVO) throws Exception;

}