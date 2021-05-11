package chn.bhmc.dms.sal.usc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.usc.vo.ExchResultSearchVO;
import chn.bhmc.dms.sal.usc.vo.ExchResultVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ExchResultDAO.java
 * @Description : 중고차치환판매심사결과 DAO
 * @author Kim yewon
 * @since 2016. 6. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 10.     Kim yewon              최초 생성
 * </pre>
 */

@Mapper("exchResultDAO")
public interface ExchResultDAO {


    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    public List<ExchResultVO> selectExchResultByCondition(ExchResultSearchVO searchVO);

    /**
     *  조회 조건에 해당하는  총 갯수를 조회한다.
     */
    public int selectExchResultByConditionCnt(ExchResultSearchVO searchVO);


    public int insertExchRegist(ExchResultVO exchResultVO);
    
    
    public int insertInterfaceExchRegist(ExchResultVO exchResultVO);

}
