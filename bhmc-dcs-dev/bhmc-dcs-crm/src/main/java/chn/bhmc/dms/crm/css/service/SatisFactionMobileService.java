package chn.bhmc.dms.crm.css.service;

import chn.bhmc.dms.crm.css.vo.SatisFactionMobileSaveVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileVO;


/**
 * 만족도 조사 설문 모바일 서비스
 *
 * @author hyun ho kim
 * @since 2016. 03. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.18         hyun ho kim            최초 생성
 * </pre>
 */

public interface SatisFactionMobileService {

    /**
     * 설문에 응답한 답변들을 등록 처리한다.
     * @param SatisFactionMobileVO
     */
    //public void multiUsrAnswerSurveys(BaseSaveVO<SatisFactionMobileVO> satisFactionMobileVO) throws Exception;
    public void multiUsrAnswerSurveys(SatisFactionMobileSaveVO saveVO) throws Exception;

    /**
     * 설문 응답 정보를 등록한다.
     * @param satisFactionMonileVO - 등록할 정보가 담긴 SatisFactionMobileVO
     * @return 등록된 목록수
     */
    public int insertUsrAnswerSurvey(SatisFactionMobileVO satisFactionMobileVO) throws Exception;

}
