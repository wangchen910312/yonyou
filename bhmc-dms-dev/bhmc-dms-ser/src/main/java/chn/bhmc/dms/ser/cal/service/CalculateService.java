package chn.bhmc.dms.ser.cal.service;

import java.util.HashMap;
import java.util.List;

import chn.bhmc.dms.ser.cal.service.model.ResponseData;
import chn.bhmc.dms.ser.cal.vo.CalculateSaveVO;
import chn.bhmc.dms.ser.cal.vo.CalculateSearchVO;
import chn.bhmc.dms.ser.cal.vo.CalculateVO;


public interface CalculateService {

    /**
     * 조회 조건에 해당하는 정산 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public int selectCalculateByConditionCnt(CalculateSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 정산를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public List<CalculateVO> selectCalculateByCondition(CalculateSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 정산 현황  갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public int selectCalculateListByConditionCnt(CalculateSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 정산 현황 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public List<CalculateVO> selectCalculateListByCondition(CalculateSearchVO searchVO)throws Exception;

    /**
     * 정산를 등록/수정한다.
     * @param calculateSaveVO - 정산/부품/공임을 포함하는 CalculateSaveVO
     * @return
     */
    public HashMap<String, String> multiCalculate(CalculateSaveVO calculateSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 정산 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public CalculateVO selectCalculateByKey(CalculateSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 정산 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public CalculateVO selectCalculatePartByKey(CalculateSearchVO searchVO) throws Exception;

     /**
     * 정산를 수정한다.
     * @param calculateVO - 정산정보를 포함하는 CalculateVO
     * @return
     */
    public String updateCalculate(CalculateVO calculateVO) throws Exception;


    /**
     * 정산 출력 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 CalculateVO
     * @return 수정된 목록수
     */
    public void updateCalculatePrint(CalculateVO obj)throws Exception;

    /**
     * 정산를 취소한다.
     * @param calculateVO - 정산정보를 포함하는 CalculateVO
     * @return
     */
    public ResponseData multiCalculateCancel(List<CalculateVO> cancelVO) throws Exception;

    public CalculateVO selectRcvOnlyByKey(CalculateSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 정산토탈금액을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public List<CalculateVO> selectCalculateAmtByCondition(CalculateSearchVO searchVO)throws Exception;

    /**
     * 서비스인도알람,SMS
     * @param calculateVO - 수정할 정보가 담긴 CalculateVO
     * @return
     */
    public void serDlAlramCall(CalculateVO calculateVO) throws Exception;
    
    /**
     *  结算取消 卡券进行反核销 操作 贾明 2020-6-3
     * @param calculateVO
     * @return
     * @throws Exception 
     */
	public String cancelBillingCouponAntiWriteOff(CalculateVO calculateVO) throws Exception;
}