package chn.bhmc.dms.sal.trm.service.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.sal.trm.vo.DayFundStatusSearchVO;
import chn.bhmc.dms.sal.trm.vo.DayFundStatusVO;

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

@Mapper("dayFundStatusDAO")
public interface DayFundStatusDAO {

    /**
     * 조회월의 마지막 일자를 구해옴
     */
    public int selectDayFundStatusLastDaySearch(DayFundStatusVO searchVO)throws Exception;

    /**
     * 딜러자금현황의 일자 내역을 가져온다.
     */
    public List<DayFundStatusVO> selectDayFundStatusDaysByCondition(DayFundStatusVO searchVO) throws Exception;



    public DayFundStatusVO selectCarNameInfoSearch(DayFundStatusSearchVO searchVO) throws Exception;
    
    public  Map<String,Object> selectCarVinmBkwbSearch(@Param(value="salesNo")String salesNo,@Param(value="dlrCd")String dlrCd)throws Exception;

}
