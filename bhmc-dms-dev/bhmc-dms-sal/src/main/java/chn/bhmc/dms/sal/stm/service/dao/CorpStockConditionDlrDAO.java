package chn.bhmc.dms.sal.stm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.stm.vo.CorpStockConditionDlrVO;
import chn.bhmc.dms.sal.stm.vo.CorpStockConditionSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CorpStockConditionDAO
 * @Description : 법인재고현황(전략오더) DAO
 * @author Kim Jin Suk
 * @since 2016. 7. 25.
 * @version 1.0
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 25.     Kim Jin Suk           최초 생성
 * </pre>
 */

@Mapper("corpStockConditionDlrDAO")
public interface CorpStockConditionDlrDAO {

    /**
     * 차종 명칭 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public CorpStockConditionDlrVO selectCorpStockCarNmSearch(CorpStockConditionDlrVO searchVO) throws Exception;


    /**
     * [딜러]법인재고현황(전략오더) 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCorpStockConditionDlrDBsByConditionCnt(CorpStockConditionSearchVO searchVO) throws Exception;
    public List<CorpStockConditionDlrVO>  selectCorpStockConditionDlrDBsByCondition(CorpStockConditionSearchVO searchVO) throws Exception;
}
