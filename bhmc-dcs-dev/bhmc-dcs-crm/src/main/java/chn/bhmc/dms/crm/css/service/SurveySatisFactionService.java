package chn.bhmc.dms.crm.css.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;

/**
 * 설문 템플릿 관리 서비스
 *
 * @author hyun ho kim
 * @since 2016. 3. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyun ho kim            최초 생성
 * </pre>
 */

public interface SurveySatisFactionService {

    /**
     * 조회 조건에 해당하는 설문 템플릿 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SurveySatisFactionSearchVO
     * @return
     */
    public int selectSurveySatisFactionsByConditionCnt(SurveySatisFactionSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 설문 템플릿 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TestDriveResvSearchVO
     * @return 조회 목록
     */
    public List<SurveySatisFactionVO> selectSurveySatisFactionsByCondition(SurveySatisFactionSearchVO searchVO) throws Exception;

    /**
     * 설문 템플릿 정보를 등록/수정/삭제 처리한다.
     * @param SurveySatisFactionVO
     */
    public void multiSurveySatisFactions(BaseSaveVO<SurveySatisFactionVO> saveVO) throws Exception;

    /**
     * 설문 템플릿 정보를 등록한다.
     * @param surveySatisFactionVO - 등록할 정보가 담긴 SurveySatisFactionVO
     * @return 등록된 목록수
     */
    public int insertSurveySatisFaction(SurveySatisFactionVO surveySatisFactionVO) throws Exception;

    /**
     * 설문 템플릿 정보를 수정한다.
     * @param surveySatisFactionVO - 수정할 정보가 담긴 SurveySatisFactionVO
     * @return 수정된 목록수
     */
    public int updateSurveySatisFaction(SurveySatisFactionVO surveySatisFactionVO) throws Exception;

    /**
     * 설문 템플릿 정보를 삭제한다.
     * @param surveySatisFactionVO - 삭제할 정보가 담긴 SurveySatisFactionVO
     * @return 삭제된 목록수
     */
    public int deleteSurveySatisFaction(SurveySatisFactionVO surveySatisFactionVO) throws Exception;

    /**
     * 설문 템플릿 상세 조회
     * @param testDriveResvVO
     *
     */
    public SurveySatisFactionVO selectSurveySatisFactionByKey(SurveySatisFactionSearchVO searchVO) throws Exception;

    /**
     * kendoDropDownList 구성을 위한 설문 템플릿 목록조회
     * @param searchVO - 조회 조건을 포함하는 TestDriveResvSearchVO
     * @return 조회 목록
     */
    public List<SurveySatisFactionVO> selectSurveyTmplsByCondition(SurveySatisFactionSearchVO searchVO) throws Exception;

}
