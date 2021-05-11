package chn.bhmc.dms.crm.css.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.css.vo.SatisFactionMobileVO;

/**
 * 만족도 조사 설문 모바일에 관한 데이터처리 매퍼 클래스
 *
 * @author hyun ho kim
 * @since 2016. 03. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.15         hyun ho kim            최초 생성
 * </pre>
 */

@Mapper("satisFactionMobileDAO")
public interface SatisFactionMobileDAO {

    /**
     * 설문 응답  정보를 등록한다.
     * @param satisFactionMobileVO - 등록할 정보가 담긴 SatisFactionMobileVO
     * @return 등록된 목록수
     */
    public int insertUsrAnswerSurvey(SatisFactionMobileVO satisFactionMobileVO) throws Exception;

    /**
     * 설문 응답 점수 정보를 수정한다.
     * @param satisFactionMonileVO - 수정할 정보가 담긴 SatisFactionMobileVO
     * @return 수정된 목록수
     */
    public int updateSurveyResultScore(SatisFactionMobileVO satisFactionMobileVO) throws Exception;
}
