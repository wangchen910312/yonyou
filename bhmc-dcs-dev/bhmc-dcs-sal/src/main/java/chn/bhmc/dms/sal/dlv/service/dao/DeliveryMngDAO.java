package chn.bhmc.dms.sal.dlv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.dlv.vo.DeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.DeliveryVO;
import chn.bhmc.dms.sal.dlv.vo.GroupSalesDeliveryVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AssignMngDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 3. 3
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 3      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("deliveryMngDAO")
public interface DeliveryMngDAO {

    /**
      * 조회 조건에 해당하는 고객인도 정보를 조회한다.
      */
    public List<DeliveryVO> selectDeliveryByCondition(DeliverySearchVO searchVO);

    /**
     *  조회 조건에 해당하는 고객인도목록 총 갯수를 조회한다.
     */
    public int selectDeliveryByConditionCnt(DeliverySearchVO searchVO);


    /**
     *  고객인도관리 - 고객인도취소 - 차량테이블 (OWN_STAT_CD - 'D',CAR_STAT_CD = 'Q190') 변경.
     */
    public boolean updateVehicleDelivery(DeliveryVO deliveryVO);


    /**
     *  고객인도관리 - 고객인도취소 - 게약테이블 (CONTRACT_STAT_CD = '50') 변경.
     */
    public boolean updateContractDelivery(DeliveryVO deliveryVO);


    /**
     *  고객인도관리 - 이상출고처리
     */
    public boolean insertExceptionDelivery(DeliveryVO deliveryVO);


    /**
     *  고객인도관리 - 이상출고 테이블 존재여부 및 승인여부
     */
    public List<DeliveryVO> selectExcptApproveYn(DeliveryVO deliveryVO);



    //이상출고정보 조회
    public List<DeliveryVO> selectExcpDeliveryByCondition(DeliverySearchVO searchVO);

    //이상출고정보 조회
    public int selectExcpDeliveryByConditionCnt(DeliverySearchVO searchVO);


    //인도취소
    public boolean cancelDelivery(DeliveryVO deliveryVO);


    //강제판매처리신청수신
    public int procRfidExcepReq(DeliveryVO deliveryVO) throws Exception;

    //딜러이월소매취소신청수신
    public int procRetailCancelReq(DeliveryVO deliveryVO) throws Exception;

    //딜러소매실적수신_데이터생성
    public int procDdlRetail(DeliveryVO deliveryVO) throws Exception;


    /**
     * 집단판매 - 고객인도할 차량List를 조회한다.
     */
   public List<GroupSalesDeliveryVO> selectGroupSalesDelivery(DeliverySearchVO searchVO);

   /**
    *  집단판매 - 고객인도할 차량List의 총갯수를 조회한다.
    */
   public int selectGroupSalesDeliveryCnt(DeliverySearchVO searchVO);


   //이상출고시 첨부파일 추가
   public boolean updateAddFile(DeliveryVO deliveryVO);


   //소매유형코드 조회.
   public DeliveryVO selectRetlTpCd(DeliveryVO deliveryVO);

   //승상구분조회
   public String selectCarDstinCdCondition(DeliveryVO deliveryVO);

   //판매사원id조회
   public String selectSalesEmpNoCondition(DeliveryVO deliveryVO);

   //인터페이스seq채번
   public int selectSeqCondition(DeliveryVO deliveryVO);

   //주문타입조회
   public String selectCarDlvSltValCondition(DeliveryVO deliveryVO);

   /**
    *  조회 조건에 해당하는 전략출고신청정보 총 갯수를 조회한다.
    */
   public int selectTacticsDeliveryReqCnt(DeliverySearchVO searchVO);

   /**
     * 조회 조건에 해당하는 전략출고신청정보를 조회한다.
     */
   public List<DeliveryVO> selectTacticsDeliveryReq(DeliverySearchVO searchVO);

   /**
    * 전략출고승인/전략출고불승인 처리
    */
   public boolean updateDelivery(DeliveryVO saveVO) throws Exception;

   /**
    * 전략출고승인/전략출고불승인 인터페이스
    */
   public boolean procTacticsDeliveryApprove(DeliveryVO saveVO) throws Exception;
}
