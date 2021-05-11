package chn.bhmc.dms.sal.rpt.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.rpt.vo.SalesOrderStatsSearchVO;
import chn.bhmc.dms.sal.rpt.vo.SalesOrderStatsVO;

/**
 * <pre>
 * [DMS] 판매 레포트
 * </pre>
 *
 * @ClassName   : SalesReportDAO.java
 * @Description : [DMS] 판매 레포트
 * @author chibeom.song
 * @since 2017. 1. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 24.   chibeom.song     최초 생성
 * </pre>
 */
@Mapper("salesReportDAO")
public interface SalesReportDAO {

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    List<SalesOrderStatsVO> selectSalesOrderStats(SalesOrderStatsSearchVO searchVO);

}
