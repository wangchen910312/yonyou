package chn.bhmc.dms.crm.crq.service;

import java.util.List;

import chn.bhmc.dms.crm.crq.vo.CustomerCareSearchVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareVO;

/**
 * 영업활동 관리서비스
 *
 * @author in moon lee
 * @since 2016.05.02.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.02         in moon lee            최초 생성
 * </pre>
 */

public interface CustomerCareMgmtService {

    /**
     * 조회 조건에 해당하는 고객케어미션 총 갯수를 조회한다.
     * @param CustomerCareSearchVO - 판매고문, 고객명, 영업활동유형코드
     * @return
     */
    public int selectCustomerCareMgmtsByConditionCnt(CustomerCareSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 고객케어미션 정보를 조회한다.
     * @param CustomerCareSearchVO - 판매고문, 고객명, 영업활동유형코드
     * @return 조회 목록
     */
    public List<CustomerCareVO> selectCustomerCareMgmtsByCondition(CustomerCareSearchVO searchVO) throws Exception;

    /**
     * 고객케어미션 상세정보를 조회한다.
     * @param CustomerCareSearchVO - 영업활동번호
     * @return
     */
    public CustomerCareVO selectCustomerCareMgmtByKey(CustomerCareSearchVO searchVO);

    /**
     * 고객케어미션 정보를 저장한다.
     * @param CustomerCareVO - 영업활동 정보
     * @return 등록된 목록수
     */
    public int multiCustomerCareMgmts(CustomerCareVO customerCareVO) throws Exception;

    /**
     * 고객케어미션 정보를 삭제 한다.
     * @param CustomerCareSearchVO - custCareSeq(고객케어번호)
     * @return 삭제 수량
     */
    public int deleteCustomerCareMgmt(CustomerCareSearchVO searchVO) throws Exception;

    /**
     * 고객 추출 프로시저 호출
     *
     * @param customerCareSearchVO
     */
    public String selectTargetExtractSave(CustomerCareVO customerCareVO) throws Exception;

}
