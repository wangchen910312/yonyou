package chn.bhmc.dms.mis.tss.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.mis.tss.vo.TargetSalemanStatusSearchVO;

/**
 * <pre>
 * [딜러사] 판매고문 실적현황
 * </pre>
 *
 * @ClassName   : TargetSalemanStatusDAO.java
 * @Description : [딜러사] 판매고문 실적현황
 * @author chibeom.song
 * @since 2016. 10. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 23.     chibeom.song     최초 생성
 * </pre>
 */
@Mapper("targetSalemanStatusDAO")
public interface TargetSalemanStatusDAO {

    /**
     * 조회 조건에 해당하는 [딜러사] 판매고문 실적현황 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetSalemanStatusSearchVO
     * @return 조회 목록
     */
    public List<TargetSalemanStatusSearchVO> selectTargetSalemanStatusGrid(TargetSalemanStatusSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 [딜러사] 판매고문 실적현황  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetSalemanStatusSearchVO
     * @return
     */
    public int selectTargetSalemanStatusGridCnt(TargetSalemanStatusSearchVO searchVO);

}
