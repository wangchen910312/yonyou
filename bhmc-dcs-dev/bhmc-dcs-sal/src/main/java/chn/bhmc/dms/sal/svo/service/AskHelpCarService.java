package chn.bhmc.dms.sal.svo.service;

import java.util.List;

import chn.bhmc.dms.sal.svo.vo.AskHelpCarJudgeSaveVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarPopupCarVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarPopupEvlVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarSaveVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarSearchVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarVO;




/**
 *  구원차/대부차신청 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.23         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface AskHelpCarService {


    /**
     * 구원차/대부차 메인 조회
     */
    public int selectAskHelpCarsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception;
    public List<AskHelpCarVO> selectAskHelpCarsByCondition(AskHelpCarSearchVO searchVO) throws Exception;

    /**
     * 구원차/대부차신청 팝업 상세내역 조회
     */
    public int selectAskHelpCarPopupContainsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception;
    public List<AskHelpCarVO> selectAskHelpCarPopupContainsByCondition(AskHelpCarSearchVO searchVO) throws Exception;


    /**
     * 구원차/대부차신청 팝업 차량유형설명 정보 조회
     */
    public int selectAskHelpCarPopupContsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception;
    public List<AskHelpCarPopupCarVO> selectAskHelpCarPopupContsByCondition(AskHelpCarSearchVO searchVO) throws Exception;


    /**
     * 구원차/대부차신청 팝업 차량정보 조회
     */
    public int selectAskHelpCarPopupCarsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception;
    public List<AskHelpCarPopupCarVO> selectAskHelpCarPopupCarsByCondition(AskHelpCarSearchVO searchVO) throws Exception;

    /**
     * 구원차/대부차신청 팝업 심사정보 조회
     */
    public int selectAskHelpCarPopupEvlsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception;
    public List<AskHelpCarPopupEvlVO> selectAskHelpCarPopupEvlsByCondition(AskHelpCarSearchVO searchVO) throws Exception;

    /**
     * 구원차/대부차신청 팝업 저장
     */
    public int multiAskHelpCarPopups(AskHelpCarSaveVO saveVO) throws Exception;

    /**
     * 구원차/대부차신청 삭제
     */
    public int deleteAskHelpCars(AskHelpCarSearchVO deleteVO) throws Exception;

    /**
     * 구원차/대부차신청 확정
     */
    public int confirmAskHelpCars(AskHelpCarSearchVO deleteVO) throws Exception;

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
    public int confirmPolicyInputPopup(AskHelpCarPopupCarVO saveVO) throws Exception;


    /**
     * 구원차/대부차 심사 팝업(2) 심사정보 조회
     */
    public int selectAskHelpCarJudgePopupContainCnt(AskHelpCarSearchVO searchVO) throws Exception;
    public List<AskHelpCarVO> selectAskHelpCarJudgePopupContain(AskHelpCarSearchVO searchVO) throws Exception;

    /**
     * 구원차/대부차 심사 확정 처리
     */
    public int confirmAskHelpCarJudge(AskHelpCarJudgeSaveVO saveVO) throws Exception;

    /**
     * 특수차 주차 조회(딜러오더 생성시 키로 사용)
     * @param searchVO
     * @return
     * @throws Exception
     */
    public AskHelpCarPopupCarVO selectWeek(AskHelpCarSearchVO searchVO) throws Exception;
    public int selectWeekCnt(AskHelpCarSearchVO searchVO) throws Exception;

    /**
     * 딜러오더 키 조회
     */
    public String selectOrdNo(AskHelpCarPopupCarVO searchVO) throws Exception;

    /**
     * 특수차 심사 후 딜러오더 생성
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertHelpCarDrlOrd(AskHelpCarPopupCarVO saveVO) throws Exception;


    /**
     * 특수차 심사 후 딜러오더 생성 interface middleTable
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertHelpCarDrlOrdInterface(AskHelpCarPopupCarVO saveVO) throws Exception;

    /**
     * 특수차 심사확정- 승인 처리 시, 오더번호 업데이트
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateAskHelpCarOrdNo(AskHelpCarPopupCarVO saveVO) throws Exception;

}
