package chn.bhmc.dms.crm.crq.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareSearchVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareVO;

/**
 * 고객케어미션 관리에 관한 데이터처리 매퍼 클래스
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

@Mapper("customerCareMgmtDAO")
public interface CustomerCareMgmtDAO {

    /**
     * 조회 조건에 해당하는 고객케어미션 관리 총 갯수를 조회한다.
     * @param CustomerCareSearchVO - 판매고문, 고객명, 고객케어미션유형코드
     * @return
     */
    public int selectCustomerCareMgmtsByConditionCnt(CustomerCareSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 고객케어미션 관리 정보를 조회한다.
     * @param CustomerCareSearchVO - 판매고문, 고객명, 고객케어미션유형코드
     * @return 조회 목록
     */
    public List<CustomerCareVO> selectCustomerCareMgmtsByCondition(CustomerCareSearchVO searchVO) throws Exception;

    /**
     * 고객케어미션 관리 상세 조회
     * @param CustomerCareSearchVO - 고객케어미션번호
     * @return
     */
    public CustomerCareVO selectCustomerCareMgmtByKey(CustomerCareSearchVO searchVO);

    /**
     * 고객케어미션 관리 정보를 등록한다.
     * @param CustomerCareVO - 고객케어미션 정보
     * @return 등록된 목록수
     */
    public int insertCustomerCareMgmt(CustomerCareVO salesActiveVO) throws Exception;

    /**
     * 고객케어미션 관리 정보를 수정한다.
     * @param CustomerCareVO - 고객케어미션 정보
     * @return 수정된 목록수
     */
    public int updateCustomerCareMgmt(CustomerCareVO salesActiveVO) throws Exception;

    /**
     * 고객케어미션 정보를 삭제 한다.
     * @param CustomerCareSearchVO - custCareSeq(고객케어번호)
     * @return 삭제 수량
     */
    public int deleteCustomerCareMgmt(CustomerCareSearchVO searchVO) throws Exception;

    /**
     * 추출차수 증가
     *
     * @param customerCareExtrTargetVO
     */
    public int updateExtrDgreCnt(CustomerCareExtrTargetVO customerCareExtrTargetVO) throws Exception;


}
