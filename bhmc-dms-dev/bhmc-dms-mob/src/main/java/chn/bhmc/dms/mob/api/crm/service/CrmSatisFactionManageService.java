package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.SatisFactionManageSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SatisFactionManageVO;
import chn.bhmc.dms.mob.api.crm.vo.SatisFactionMobileSearchVO;
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

public interface CrmSatisFactionManageService {


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

}
