package chn.bhmc.dms.crm.css.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionCrmTargExtractSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionCrmTargExtractVO;

/**
 * 만족도조사 대상자 추출조건 (조사타입이 서비스인경우) 데이터처리 매퍼 클래스
 *
 * @author lee in moon
 * @since 2017.08.01.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.08.01.         lee in moon            최초 생성
 * </pre>
 */

@Mapper("satisFactionTargExtractDAO")
public interface SatisFactionTargExtractDAO {


    /**
     * 고객추출 상세 정보를 삭제한다.
     * @param crmTargExtractVO - 삭제할 정보가 담긴 CrmTargExtractVO
     * @return 삭제된 목록수
     */
    public int selectCrmTargExtractDetailsByConditionCnt(SatisFactionCrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 고객추출 상세 정보를 삭제한다.
     * @param crmTargExtractVO - 삭제할 정보가 담긴 CrmTargExtractVO
     * @return 삭제된 목록수
     */
    public int deleteCrmTargExtractDetail(SatisFactionCrmTargExtractVO crmTargExtractVO) throws Exception;

    /**
     * 고객추출 상세 정보를 등록한다.
     * @param crmTargExtractVO - 등록할 정보가 담긴 CrmTargExtractVO
     * @return 등록된 목록수
     */
    public int insertCrmTargExtractDetail(SatisFactionCrmTargExtractVO crmTargExtractVO) throws Exception;

    /**
     * 고객추출 상세 페이지에 값 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return 조회 목록
     */
    public List<CrmTargExtractVO> selectCrmTargExtractDetails(SatisFactionCrmTargExtractSearchVO searchVO) throws Exception;

}
