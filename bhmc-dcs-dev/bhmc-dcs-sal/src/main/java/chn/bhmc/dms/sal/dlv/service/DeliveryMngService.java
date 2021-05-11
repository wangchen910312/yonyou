package chn.bhmc.dms.sal.dlv.service;

import java.util.List;

import chn.bhmc.dms.sal.dlv.vo.DeliverySaveVO;
import chn.bhmc.dms.sal.dlv.vo.DeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.DeliveryVO;
import chn.bhmc.dms.sal.dlv.vo.GroupSalesDeliveryVO;

/**
 * 고객인도 서비스
 *
 * @author Kim yewon
 * @since 2016. 3. 10.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2016.03.10         Kim yewon            최초 생성
 * </pre>
 */

public interface DeliveryMngService {


	/**
     * 조회 조건에 해당하는 고객인도 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeliverySearchVO
     * @return 조회 목록
     */
	public List<DeliveryVO> selectDeliveryByCondition(DeliverySearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 고객인도목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
	public int selectDeliveryByConditionCnt(DeliverySearchVO searchVO) throws Exception;


    /**
     * 고객인도관리 - 고객인도 이벤트
     * @param VO - deliveryVO
     * @return 성공 true
     * @throws Exception
     */
    public boolean updateVehicleDelivery(DeliveryVO deliveryVO) throws Exception;


    /**
     * 고객인도관리 - 이상출고처리 이벤트
     * @param VO - deliveryVO
     * @return 성공 true
     * @throws Exception
     */
    public boolean insertExceptionDelivery(DeliveryVO deliveryVO) throws Exception;


    //이상출고 테이블 존재여부 및 승인여부.
    public List<DeliveryVO> selectExcptApproveYn(DeliveryVO deliveryVO) throws Exception;



    //이상출고정보 조회
    public List<DeliveryVO> selectExcpDeliveryByCondition(DeliverySearchVO searchVO) throws Exception;
    //이상출고정보 조회
    public int selectExcpDeliveryByConditionCnt(DeliverySearchVO searchVO) throws Exception;



    //인도취소
    public boolean cancelDelivery(DeliveryVO deliveryVO) throws Exception;



    /**
     * 집단판매 - 고객인도할 차량List를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeliverySearchVO
     * @return 조회 목록
     */
    public List<GroupSalesDeliveryVO> selectGroupSalesDelivery(DeliverySearchVO searchVO) throws Exception;

    /**
     * 집단판매 - 고객인도할 차량List의 총갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeliverySearchVO
     * @return
     */
    public int selectGroupSalesDeliveryCnt(DeliverySearchVO searchVO) throws Exception;


    //이상출고시 첨부파일 추가
    public boolean updateAddFile(DeliveryVO deliveryVO) throws Exception;


    //집단고객인도 - 인도처리
    public void GroupVehicleDelivery(DeliverySaveVO saveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전략출고신청정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeliverySearchVO
     * @return
     */
    public int selectTacticsDeliveryReqCnt(DeliverySearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 전략출고신청정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeliverySearchVO
     * @return 조회 목록
     */
    public List<DeliveryVO> selectTacticsDeliveryReq(DeliverySearchVO searchVO) throws Exception;


    /**
     * 통과
     */
    public boolean confirmDelivery(DeliveryVO saveVO)throws Exception;

    /**
     * 거절
     */
    public boolean rejectDelivery(DeliveryVO saveVO)throws Exception;
}