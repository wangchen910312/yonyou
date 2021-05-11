package chn.bhmc.dms.mob.api.part.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.part.vo.ServicePartVO;
import chn.bhmc.dms.mob.api.part.vo.TabInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServicePartDAO.java
 * @Description : 공통 부품 DAO
 * @author KyungMok Kim
 * @since 2016. 8. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 23.   KyungMok Kim     최초 생성
 * </pre>
 */

@Mapper("PartServicePartDAO")
public interface PartServicePartDAO {

    /**
     * 조회 조건에 해당하는 부품 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectServicePartsByConditionCnt(TabInfoSearchVO searchVO) throws Exception;

   
    /**
     * 조회 조건에 해당하는 부품을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServicePartVO> selectServicePartsByCondition(TabInfoSearchVO searchVO) throws Exception;

//    
//    /**
//     * Key에 해당하는 부품 정보를 조회한다.
//     * @param dlrCd - 딜러코드
//     * @param preFixId - 구분코드
//     * @param docNo - 문서번호
//     * @param itemCd - 부품번호
//     * @return 조회한 서비스 부품 정보
//     */
//    public ServicePartVO selectServicePartByKey(@Param("dlrCd") String dlrCd, @Param("preFixId") String preFixId, @Param("docNo") String docNo, @Param("itemCd") String itemCd);

}