package chn.bhmc.dms.mob.api.sales.dao;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.sales.vo.DayFundStatusSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.DayFundStatusVO;



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

@Mapper("SalesDayFundStatusDAO")
public interface SalesDayFundStatusDAO {

   

    public DayFundStatusVO selectCarNameInfoSearch(DayFundStatusSearchVO searchVO) throws Exception;
}
