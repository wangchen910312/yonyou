package chn.bhmc.dms.par.cpm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.cpm.vo.SalePlanActVO;
import chn.bhmc.dms.par.cpm.vo.SalePlanSearchVO;
import chn.bhmc.dms.par.cpm.vo.SalePlanVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalePlanDAO.java
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
@Mapper("salePlanDAO")
public interface SalePlanDAO {

    /**
     * 판매계획  정보를 등록한다.
     * @param salePlanVO 등록할 정보가 담긴 SalePlanVO
     * @return 등록된 목록수
     */
    public int insertSalePlan(SalePlanVO salePlanVO) throws Exception;

    /**
     * 판매계획  정보를 수정한다.
     * @param salePlanVO - 수정할 정보가 담긴 SalePlanVO
     * @return 수정된 목록수
     */
    public int updateSalePlan(SalePlanVO salePlanVO) throws Exception;

    /**
     * 판매계획  정보를 삭제한다.
     * @param salePlanVO - 삭제할 정보가 담긴 SalePlanVO
     * @return 삭제된 목록수
     */
    public int deleteSalePlan(SalePlanVO salePlanVO) throws Exception;

    /**
     * 판매계획  정보를 등록/수정/삭제한다.
     * @param salePlanVO - 삭제할 정보가 담긴 SalePlanVO
     * @return 등록/수정/삭제 목록수
     */

    /**
     * Key에 해당하는 판매계획  정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param itemCd - 부품번호
     * @return 조회한 판매계획  정보
     */
    public SalePlanVO selectSalePlanByKey(@Param("dlrCd") String dlrCd) throws Exception;

    /**
     * 조회 조건에 해당하는 판매계획  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalePlanSearchVO
     * @return 조회 목록
     */
    public List<SalePlanActVO> selectSalePlansByCondition(SalePlanSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매계획  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalePlanSearchVO
     * @return 조회 목록 수
     */
    public int selectSalePlansByConditionCnt(SalePlanSearchVO searchVO) throws Exception;
}
