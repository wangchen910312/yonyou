package chn.bhmc.dms.sal.svo.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.dlv.vo.CancDeliveryVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarJudgeSaveVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarPopupCarVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarPopupEvlVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarSearchVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AskHelpCarDAO
 * @Description : 구원차/대부차 신청 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.02.23     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("askHelpCarDAO")
public interface AskHelpCarDAO {

    /**
     * 조회 조건에 해당하는 구원차/대부차 신청 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */

    public List<AskHelpCarVO> selectAskHelpCarsByCondition(AskHelpCarSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 구원차/대부차 신청 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return
     */
    public int selectAskHelpCarsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception;

    /**
     * 구원차/대부차신청 팝업 세부정보 조회
     */
    public int selectAskHelpCarPopupContainsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception;
    public List<AskHelpCarVO> selectAskHelpCarPopupContainsByCondition(AskHelpCarSearchVO searchVO) throws Exception;

    /**
     * 구원차/대부차신청 팝업 차량유형설명 정보 조회
     */
    public int selectAskHelpCarPopupContsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception;
    public List<AskHelpCarPopupCarVO> selectAskHelpCarPopupContsByCondition(AskHelpCarSearchVO searchVO) throws Exception;

    /**
     * 구원차/대부차량신청 팝업 차량내역 조회
     */
    public int selectAskHelpCarPopupCarsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception;
    public List<AskHelpCarPopupCarVO> selectAskHelpCarPopupCarsByCondition(AskHelpCarSearchVO searchVO) throws Exception;

    /**
     * 구원차/대부차량신청 팝업 심사내역 조회
     */
    public int selectAskHelpCarPopupEvlsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception;
    public List<AskHelpCarPopupEvlVO> selectAskHelpCarPopupEvlsByCondition(AskHelpCarSearchVO searchVO) throws Exception;


    /**
     * 구원차/대부차량신청 팝업 차량 저장/수정/삭제 SA_0422T 차량 detail
     */
    public int insertAskHelpCarPopupCars(AskHelpCarPopupCarVO saveVO) throws Exception;
    public int updateAskHelpCarPopupCars(AskHelpCarPopupCarVO saveVO) throws Exception;
    public int deleteAskHelpCarPopupCars(AskHelpCarPopupCarVO saveVO) throws Exception;

    /**
     * 구원/대부차량 신청 저장/수정 SA_0424T
     */
    public int insertAskHelpCars (AskHelpCarVO saveVO) throws Exception;
    public int updateAskHelpCars (AskHelpCarVO saveVO) throws Exception;

    /**
     * 구원차/대부차신청 삭제
     */
    public int deleteAskHelpCars (AskHelpCarSearchVO saveVO) throws Exception;

    /**
     * 구원차/대부차신청 확정
     */
    public int confirmAskHelpCars (AskHelpCarSearchVO saveVO) throws Exception;

    /**
     * 구원차/대부차신청 차량등록 관련 서류 갱신
     */
    public void updateCarRegDoc(AskHelpCarVO updateVO) throws Exception;

    /**
     * 구원차/대부차신청 갱신심사 서류 갱신
     */
    public void updateCarRcpDoc(AskHelpCarVO updateVO) throws Exception;

    /**
     * 구원차/대부차신청 인수차량 이미지 갱신
     */
    public void updateCarImgDoc(AskHelpCarVO updateVO) throws Exception;

    /**
     * 구원차/대부차 심사 메인 조회
     */
    public int selectAskHelpCarJudgesByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception;
    public List<AskHelpCarVO> selectAskHelpCarJudgesByCondition(AskHelpCarSearchVO searchVO) throws Exception;

    /**
     * 구원차/대부차 심사 팝업(1) 차량유형 - 정책입력
     */
    public int confirmPolicyInputPopupUpdate(AskHelpCarPopupCarVO saveVO) throws Exception;
    public int confirmPolicyInputPopupInsert(AskHelpCarPopupCarVO saveVO) throws Exception;
    public int insertCarPopupContHists(AskHelpCarPopupCarVO saveVO) throws Exception;
    public int procCarPopupContHists(AskHelpCarPopupCarVO saveVO) throws Exception;

    /**
     * 구원차/대부차 심사 팝업(2) 심사정보 조회
     */
    public int selectAskHelpCarJudgePopupContainCnt(AskHelpCarSearchVO searchVO) throws Exception;
    public List<AskHelpCarVO> selectAskHelpCarJudgePopupContain(AskHelpCarSearchVO searchVO) throws Exception;

    /**
     * 구원차/대부차 심사 팝업(2) 심사 확정
     */
    public int insertAskHelpCarJudgeDetail(AskHelpCarJudgeSaveVO saveVO) throws Exception;
    public int updateAskHelpCarJudgeHeader(AskHelpCarJudgeSaveVO saveVO) throws Exception;

    /**
     * 특수차 주차 조회(딜러오더 생성시 키로 사용)
     */
    public AskHelpCarPopupCarVO selectWeek(AskHelpCarSearchVO searchVO) throws Exception;
    public int selectWeekCnt(AskHelpCarSearchVO searchVO) throws Exception;

    /**
     * 딜러오더 키 조회
     */
    public String selectOrdNo(AskHelpCarPopupCarVO searchVO) throws Exception;

    /**
     * 특수차 심사 후 딜러오더 생성
     */
    public int insertHelpCarDrlOrd(AskHelpCarPopupCarVO saveVO) throws Exception;

    /**
     * 특수차 심사 후 딜러오더 생성 interfaceTable
     */
    public int insertHelpCarDrlOrdInterface(AskHelpCarPopupCarVO saveVO) throws Exception;

    /**
     * 특수차 심사확정- 승인 처리 시, 오더번호 업데이트
     */
    public int updateAskHelpCarOrdNo(AskHelpCarPopupCarVO saveVO) throws Exception;


    //구원차/대부차주문신청종보수신1
    public int procSpCarReq1(AskHelpCarPopupCarVO saveVO) throws Exception;

    //구원차/대부차주문신청종보수신2
    public int procSpCarReq2(AskHelpCarVO saveVO) throws Exception;

    // 구원차/대부차 오더등록 프로시져
    public void procSpDrlOrd(AskHelpCarPopupCarVO saveVO) throws Exception;

    // 시승차 주문심사결과 정보 송신 프로시져
    public void procAskHelpCarJudge(AskHelpCarJudgeSaveVO saveVO) throws Exception;

    //프로시저 추가 : 이월판매취소 승인
    public boolean procApproveCancDelivery(CancDeliveryVO saveVO) throws Exception;
}