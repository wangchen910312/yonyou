package chn.bhmc.dms.crm.cso.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtVO;

/**
 * 판매기회 타브랜드 실패 차량 관리 DAO
 *
 * @author liu jing
 * @since 2016.12.12
 * @version 1.0
 * @see <pre>
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.12.12                                 최초 생성
 * </pre>
 */

@Mapper("salesOpptFailOtherBrandMgmtDAO")
public interface SalesOpptFailOtherBrandMgmtDAO {

    /**
     * 조건에 따라 판매기회 타브랜드 실패 차량 관리 update
     * @param searchVO - 조회 조건을 포함하는 SalesOpptFailOtherBrandMgmtVO
     * @return 목록 update
     */
    public void updateSalesOpptFailOtherBrand(SalesOpptFailOtherBrandMgmtVO searchVO) throws Exception;

    /**
     * 조건에 따라 판매기회 타브랜드 실패 차량 관리 insert
     * @param searchVO - 조회 조건을 포함하는 SalesOpptFailOtherBrandMgmtVO
     * @return 목록 insert
     */
    public void insertSalesOpptFailOtherBrand(SalesOpptFailOtherBrandMgmtVO searchVO) throws Exception;

    /**
     * 조건에 따라 판매기회 타브랜드 실패 차량 관리 delete(사용 안함)
     * @param searchVO - 조회 조건을 포함하는 SalesOpptFailOtherBrandMgmtVO
     * @return 목록 delete( 사용 안함)
     */
    public void deleteSalesOpptFailOtherBrand(SalesOpptFailOtherBrandMgmtVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는조건에 따라 판매기회 타브랜드 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptFailOtherBrandSearchVO
     * @return 조회 목록
     */
    public List<SalesOpptFailOtherBrandMgmtVO> selectSalesOpptFailOtherBrandMgmtsByCondition(SalesOpptFailOtherBrandMgmtSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는조건에 따라 판매기회 타브랜드 정보 개숫을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptFailOtherBrandSearchVO
     * @return 조회 목록
     */
    public int selectSalesOpptFailOtherBrandMgmtsByConditionCnt(SalesOpptFailOtherBrandMgmtSearchVO searchVO)throws Exception;


	/**
     * DMS로 배포
     */
    public void updateDistOpptFailOtherBrand() throws Exception;

}
