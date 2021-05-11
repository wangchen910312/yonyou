package chn.bhmc.dms.mob.api.sales.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.sales.vo.FundStatusReplace;
import chn.bhmc.dms.mob.api.sales.vo.FundStatusSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.FundStatusVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DayFundStatusDAO
 * @Description : 일자금현황 DAO
 * @author Kang Seok Han
 * @since 2016. 8. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("SalesFundStatusDAO")
public interface SalesFundStatusDAO {

    /**
     * 월별 자금현황의 갯수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectFundStatusByConditionCnt(FundStatusSearchVO searchVO) throws Exception;

    /**
     * 월별 자금현황을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<FundStatusVO> selectFundStatusByCondition(FundStatusSearchVO searchVO) throws Exception;

    /**
     * 일별 자금현황을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<FundStatusVO> selectFundStatusDaysByCondition(FundStatusSearchVO searchVO) throws Exception;

    /**
     * 전월 자금현황을 갯수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectBeforeAmtInfoSearchCnt(FundStatusSearchVO searchVO) throws Exception;

    /**
     * 전월 자금현황을 조회한다.
     *
     * @param searchVO
     * @return
     */
    public FundStatusReplace selectBeforeAmtInfoSearch(FundStatusSearchVO searchVO) throws Exception;

}
