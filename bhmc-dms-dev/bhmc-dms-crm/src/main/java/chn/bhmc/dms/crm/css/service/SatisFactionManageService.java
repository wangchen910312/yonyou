package chn.bhmc.dms.crm.css.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileSearchVO;

/**
 * 설문 질문 서비스
 *
 * @author hyun ho kim
 * @since 2016. 03. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.11         hyun ho kim            최초 생성
 * </pre>
 */

public interface SatisFactionManageService {

    /**
     * 조회 조건에 해당하는 만족도 조사 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return
     */
    public int selectSatisFactionManagesByConditionCnt(SatisFactionManageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 만족도 조사 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return 조회 목록
     */
    public List<SatisFactionManageVO> selectSatisFactionManagesByCondition(SatisFactionManageSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 정보를 등록한다.
     * @param satisFactionManageVO - 등록할 정보가 담긴 SatisFactionManageVO
     * @return 등록된 목록수
     */
    public int insertSatisFactionManage(SatisFactionManageVO satisFactionManageVO) throws Exception;

    /**
     * 만족도 조사 정보를 수정한다.
     * @param satisFactionManageVO - 수정할 정보가 담긴 SatisFactionManageVO
     * @return 수정된 목록수
     */
    public int updateSatisFactionManage(SatisFactionManageVO satisFactionManageVO) throws Exception;

    /**
     * 조회 조건에 해당하는 만족도 조사명 kendoDropDownList 구성목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionMobileSearchVO
     * @return 조회 목록
     */
    public List<SatisFactionManageVO> selectStsfIvstNmsByCondition(SatisFactionManageSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 설문조사 key 정보를 조회한다.
     * @param sSeq, sDlrCd, sPltCd - 만족도 일련번호, 딜러코드, 사업장코드
     * @return 조회한 설문조사 key 정보
     */
    public SatisFactionManageVO selectSurveyCdByKey(SatisFactionMobileSearchVO schMobileVO) throws Exception;

    /**
     * 만족도 조사에 응한 인원들을 콜센터로 전송한다.(단, 만족도 조사의 조건은 전화 인 것만 가능하다.)
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return
     */
    public String selectCallSenProc(SatisFactionManageSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사인원을 추출하는 프로시저 호출
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return
     */
    public int selectCallRcpeExtrMapping(SatisFactionManageVO stsfMngVO) throws Exception;

    /**
     * 만족도 조사 고객추출 - 오늘 고객 추출 수량 조회 ( 배치에서 사용 )
     * @param searchVO - sDlrCd / sCurruntDt
     * @return 오늘 스케줄 돌아야 할 수량
     */
    public int selectSatisFactionBatchCnt(SatisFactionManageSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 관리 상세정보를 조회한다.
     * @param SatisFactionManageSearchVO - 만족도 조사 번호
     * @return 만족도 조사 정보
     */
    public SatisFactionManageVO selectSatisFactionManageByKey(SatisFactionManageSearchVO searchVO) throws Exception;

    /**
     * 만족도 유형 데이터를 조회한다.
     * @param searchVO - 조사타입 공통코드
     * @return 만족도 유형 공통코드 목록
     */
    public List<CommonCodeVO> selectStsfIvstMthCdList(SatisFactionManageSearchVO searchVO) throws Exception;

}
