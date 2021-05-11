package chn.bhmc.dms.par.cpm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.cpm.vo.SaleActualSummaryVO;
import chn.bhmc.dms.par.cpm.vo.SalePlanSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SaleActualSummaryDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 7. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 15.     In Bo Shim     최초 생성
 * </pre>
 */
@Mapper("saleActualSummaryDAO")
public interface SaleActualSummaryDAO {

    /**
     * 판매실적집계  정보를 등록한다.
     * @param saleActualSummaryVO 등록할 정보가 담긴 SaleActualSummaryVO
     * @return 등록된 목록수
     */
    public int insertSaleActualSummary(SaleActualSummaryVO saleActualSummaryVO) throws Exception;

    /**
     * 판매실적집계  정보를 수정한다.
     * @param saleActualSummaryVO - 수정할 정보가 담긴 SaleActualSummaryVO
     * @return 수정된 목록수
     */
    public int updateSaleActualSummary(SaleActualSummaryVO saleActualSummaryVO) throws Exception;

    /**
     * 판매실적집계  정보를 삭제한다.
     * @param saleActualSummaryVO - 삭제할 정보가 담긴 SaleActualSummaryVO
     * @return 삭제된 목록수
     */
    public int deleteSaleActualSummary(SaleActualSummaryVO saleActualSummaryVO) throws Exception;

    /**
     * 판매실적집계  정보를 등록/수정/삭제한다.
     * @param saleActualSummaryVO - 삭제할 정보가 담긴 SaleActualSummaryVO
     * @return 등록/수정/삭제 목록수
     */

    /**
     * Key에 해당하는 판매실적집계  정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param itemCd - 부품번호
     * @return 조회한 판매실적집계  정보
     */
    public SaleActualSummaryVO selectSaleActualSummaryByKey(@Param("dlrCd") String dlrCd) throws Exception;

    /**
     * 조회 조건에 해당하는 판매실적집계  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SaleActualSummarySearchVO
     * @return 조회 목록
     */
    public List<SaleActualSummaryVO> selectSaleActualSummarysByCondition(SalePlanSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매실적집계  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SaleActualSummarySearchVO
     * @return 조회 목록 수
     */
    public int selectSaleActualSummarysByConditionCnt(SalePlanSearchVO searchVO) throws Exception;
}
