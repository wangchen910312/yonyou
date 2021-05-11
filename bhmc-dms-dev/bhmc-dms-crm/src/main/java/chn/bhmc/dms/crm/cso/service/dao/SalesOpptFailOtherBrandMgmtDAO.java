package chn.bhmc.dms.crm.cso.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtVO;

/**
 * 판매기회 실패브랜드 관리에 관한 데이터처리 매퍼 클래스
 *
 * @author kyo jin lee
 * @since 2016.03.22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.22         kyo jin lee            최초 생성
 * </pre>
 */

@Mapper("salesOpptFailOtherBrandMgmtDAO")
public interface SalesOpptFailOtherBrandMgmtDAO {


    /**
     * 조회 조건에 해당하는 판매기회실패브랜드 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptFailBrandMgmtSearchVO
     * @return int
     */
    public int selectSalesOpptFailOtherBrandMgmtsByConditionCnt(SalesOpptFailOtherBrandMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매기회실패브랜드 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptFailBrandMgmtSearchVO
     * @return 조회 목록 SalesOpptFailBrandMgmtVO
     */
    public List<SalesOpptFailOtherBrandMgmtVO> selectSalesOpptFailOtherBrandMgmtsByCondition(SalesOpptFailOtherBrandMgmtSearchVO searchVO) throws Exception;

}
