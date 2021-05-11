package chn.bhmc.dms.sal.usc.service;

import java.util.List;

import chn.bhmc.dms.sal.usc.vo.TopSelectionCertifyImgInfoVO;

import chn.bhmc.dms.sal.usc.vo.TopSelectionCustomerVO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionSearchVO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionUsedCarVO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionVO;

/**
 * 차량 OCN 구성정보 조회
 *
 * @author Kimyewon
 * @since 2016. 6. 2.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                     수정자                       수정내용
 *  ----------------    ------------    ---------------------------
 *   2016. 6. 2.       Kim yewon         최초 생성
 * </pre>
 */

public interface TopSelectionService {

	/**
     * 조회 조건에 해당하는 중고수선차량 인증정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TopSelectionSearchVO
     * @return 조회 목록
     */
	public List<TopSelectionVO> selectCreditListByCondition(TopSelectionSearchVO searchVO) throws Exception;


	/**
     * 조회 조건에 해당하는  중고수선차량 인증정보 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TopSelectionSearchVO
     * @return
     */
    public int selectCreditListByConditionCnt(TopSelectionSearchVO searchVO);


    //수선시스템 - 차량정보(단건) 조회
    public TopSelectionVO selectVehicleInfo(TopSelectionSearchVO searchVO) throws Exception;


    //수선시스템 - 차량마스터(단건) 조회
    public TopSelectionUsedCarVO selectVehicleMaster(TopSelectionSearchVO searchVO) throws Exception;

    //수선시스템 - 고객정보(단건) 조회
    public TopSelectionCustomerVO selectVehicleCustomer(TopSelectionSearchVO searchVO) throws Exception;

    //수선시스템 - 차량이미지정보 조회
    public TopSelectionCertifyImgInfoVO selectVehicleCertify(TopSelectionSearchVO searchVO)throws Exception;

}
