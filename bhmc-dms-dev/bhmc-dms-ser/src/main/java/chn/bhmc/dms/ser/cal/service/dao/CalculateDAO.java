package chn.bhmc.dms.ser.cal.service.dao;
import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.ser.cal.vo.CalculateFmsCardVO;
import chn.bhmc.dms.ser.cal.vo.CalculatePartsSaleOrdVO;
import chn.bhmc.dms.ser.cal.vo.CalculateSearchVO;
import chn.bhmc.dms.ser.cal.vo.CalculateVO;
import chn.bhmc.dms.ser.cmm.vo.ServicePartVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalculateDAO.java
 * @Description : 정산 DAO
 * @author KyungMok Kim
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.   KyungMok Kim     최초 생성
 * </pre>
 */

@Mapper("calculateDAO")
public interface CalculateDAO {

    /**
     * 조회 조건에 해당하는 정산 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public int selectCalculateByConditionCnt(CalculateSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 정산를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public List<CalculateVO> selectCalculateByCondition(CalculateSearchVO searchVO)throws Exception;

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
     * 정산 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 CalculateVO
     * @return 등록된 목록수
     */
    public void insertCalculate(CalculateVO obj)throws Exception;

    /**
     * 정산 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 CalculateVO
     * @return 수정된 목록수
     */
    public void updateCalculate(CalculateVO obj)throws Exception;

    /**
     * 정산 출력 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 CalculateVO
     * @return 수정된 목록수
     */
    public void updateCalculatePrint(CalculateVO obj)throws Exception;

    /**
     * 정산 취소 한다.
     * @param obj - 수정할 정보가 담긴 CalculateVO
     * @return 수정된 목록수
     */
    public void cancelCalculate(CalculateVO obj)throws Exception;

    /**
     * 정산 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 CalculateVO
     * @return 삭제된 목록수
     */
    public void deleteCalculate(CalculateVO obj)throws Exception;

    /**
     * 조회 조건에 해당하는 RO KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public CalculateVO selectCalculateByKey(CalculateSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public CalculateVO selectCalculatePartByKey(CalculateSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 수납관리에 등록된 목록수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public int selectServiceReceiveByCalcCnt(CalculateSearchVO searchVO)throws Exception;

    /**
     * 수납관리 정보를 등록한다.
     * @param serviceReceiveVO - 등록할 정보가 담긴 ServiceReceiveVO
     * @return 등록된 목록수
     */
    public int insertServiceReceiveByCalc(CalculateVO obj) throws Exception;

    /**
     * 수납관리 정보를 수정한다.
     * @param serviceReceiveVO - 등록할 정보가 담긴 ServiceReceiveVO
     * @return 등록된 목록수
     */
    public void updateServiceReceiveByCalc(CalculateVO obj) throws Exception;

    /**
     * 수납관리 정보를 삭제한다.
     * @param serviceReceiveVO - 등록할 정보가 담긴 ServiceReceiveVO
     * @return 등록된 목록수
     */
    public void deleteServiceReceiveByCalc(CalculateVO obj) throws Exception;

    public CalculateVO selectRcvOnlyByKey(CalculateSearchVO searchVO) throws Exception;

    /**
     * 정산취소 정보를 등록한다.
     * @param serviceReceiveVO - 등록할 정보가 담긴 ServiceReceiveVO
     * @return 등록된 목록수
     */
    public int insertCancelCalculate(CalculateVO obj) throws Exception;

    /**
     * 조회 조건에 해당하는 정산토탈금액을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public List<CalculateVO> selectCalculateAmtByCondition(CalculateSearchVO searchVO)throws Exception;

    /**
     * 정산취소 시 부품판매 정보를 수정한다.
     * @param calculatePartsSaleOrdVO - 등록할 정보가 담긴 CalculatePartsSaleOrdVO
     * @return 등록된 목록수
     */
    public void updateCalculateInfo(CalculatePartsSaleOrdVO obj) throws Exception;

    /**
     * 부품판매 부품 정보(할인율)를 수정한다.
     * @param servicePartVO - 등록할 정보가 담긴 ServicePartVO
     * @return 수정된 목록수
     */
    public int updatePartsSaleOrdItemDcRate(ServicePartVO servicePartVO);

    /**
     * 부품판매 부품 정보(할인율)를 수정한다.(취소 시 전체 '0')
     * @param servicePartVO - 등록할 정보가 담긴 ServicePartVO
     * @return 수정된 목록수
     */
    public int updatePartsSaleOrdItemDcRateCancel(CalculatePartsSaleOrdVO calculatePartsSaleOrdVO);

    /**
     * 부품판매 부품 반품 정보(할인율)를 수정한다.(취소 시 전체 '0')
     * @param servicePartVO - 등록할 정보가 담긴 ServicePartVO
     * @return 수정된 목록수
     */
    public int updateReturnPartsSaleOrdItemDcRateCancel(CalculatePartsSaleOrdVO calculatePartsSaleOrdVO);
    
    /**
     * 查询结算单及卡券信息进行卡券核销操作
     */
    public CalculateFmsCardVO selectFmsCardInfoById(CalculateVO calculateVO);
    
    /**
     * 卡券核销修改状态
     */
    public void UpdateCouponWrite(CalculateFmsCardVO fmsvinCardInfo);
    
    /**
     * 结算取消，反核销时，更改服务结算单的，卡券信息 贾明 2020-6-3
     * @param calculateVO
    */
    public void  updateCalculateCardInfo(CalculateVO calculateVO);
}