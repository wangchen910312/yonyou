package chn.bhmc.dms.par.cpm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.cpm.vo.SalePlanSearchVO;
import chn.bhmc.dms.par.cpm.vo.SaleSummaryVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SaleSummaryDAO.java
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
@Mapper("saleSummaryDAO")
public interface SaleSummaryDAO {

    /**
     * 판매통계  정보를 등록한다.
     * @param saleSummaryVO 등록할 정보가 담긴 SaleSummaryVO
     * @return 등록된 목록수
     */
    public int insertSaleSummary(SaleSummaryVO saleSummaryVO) throws Exception;

    /**
     * 판매통계  정보를 수정한다.
     * @param saleSummaryVO - 수정할 정보가 담긴 SaleSummaryVO
     * @return 수정된 목록수
     */
    public int updateSaleSummary(SaleSummaryVO saleSummaryVO) throws Exception;

    /**
     * 판매통계  정보를 삭제한다.
     * @param saleSummaryVO - 삭제할 정보가 담긴 SaleSummaryVO
     * @return 삭제된 목록수
     */
    public int deleteSaleSummary(SaleSummaryVO saleSummaryVO) throws Exception;

    /**
     * Key에 해당하는 판매통계  정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param itemCd - 부품번호
     * @return 조회한 판매통계  정보
     */
    public SaleSummaryVO selectSaleSummaryByKey(@Param("dlrCd") String dlrCd) throws Exception;

    /**
     * 조회 조건에 해당하는 판매통계  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SaleSummarySearchVO
     * @return 조회 목록
     */
    public List<SaleSummaryVO> selectSaleSummarysByCondition(SalePlanSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매통계  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SaleSummarySearchVO
     * @return 조회 목록 수
     */
    public int selectSaleSummarysByConditionCnt(SalePlanSearchVO searchVO) throws Exception;
}
