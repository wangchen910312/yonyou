package chn.bhmc.dms.crm.css.service;

import java.util.List;

import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionCrmTargExtractSaveVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionCrmTargExtractSearchVO;


/**
 * 만족도조사 대상자 추출조건 (조사타입이 서비스인경우) 서비스
 *
 * @author lee in moon
 * @since 2017.08.01.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.08.01         lee in moon            최초 생성
 * </pre>
 */

public interface SatisFactionTargExtractService {

    /**
     * 추출조건을 추가/저장/삭제 한다.(상세조건 저장)
     * @param SaveVO
     */
    public void multiTargExtractExs(SatisFactionCrmTargExtractSaveVO SaveVO, int seq) throws Exception;

    /**
     * 고객추출 상세 페이지에 값 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<CrmTargExtractVO> selectCrmTargExtractDetails(SatisFactionCrmTargExtractSearchVO searchVO) throws Exception;

}
