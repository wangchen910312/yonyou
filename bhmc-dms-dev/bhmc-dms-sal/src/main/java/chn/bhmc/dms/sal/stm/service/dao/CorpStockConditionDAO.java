package chn.bhmc.dms.sal.stm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.stm.vo.CorpStockConditionSearchVO;
import chn.bhmc.dms.sal.stm.vo.CorpStockConditionVO;

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

@Mapper("corpStockConditionDAO")
public interface CorpStockConditionDAO {

    /**
     * 법인재고현황(전략오더) 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCorpStockConditionsByConditionCnt(CorpStockConditionSearchVO searchVO) throws Exception;
    public List<CorpStockConditionVO> selectCorpStockConditionsByCondition(CorpStockConditionSearchVO searchVO) throws Exception;

    /**
     * 엑셀업로드한 data로 모델, 지도가격, 배기등급을 불러온다.
     * @param list
     * @return
     * @throws Exception
     */
    public List<CorpStockConditionVO> selectCorpStockConditionModelPrice(CorpStockConditionVO searchVO) throws Exception;

    /**
     * 법인재고현황(전략오더) 저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertCorpStockCondition(CorpStockConditionVO saveVO) throws Exception;

    /**
     * 법인재고현황(전략오더) 수정
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateCorpStockCondition(CorpStockConditionVO saveVO) throws Exception;


    /**
     * 법인재고현황(전략오더) 삭제
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteCorpStockCondition() throws Exception;


    /**
     * 인터페이스 테이블에 저장하여 DMS로 해당 Data를 보낸다.
     */
    public int callCorpStockConditionSync() throws Exception;
}
