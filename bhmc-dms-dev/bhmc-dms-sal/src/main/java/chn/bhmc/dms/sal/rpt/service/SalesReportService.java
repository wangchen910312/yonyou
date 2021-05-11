package chn.bhmc.dms.sal.rpt.service;

import java.util.List;

import chn.bhmc.dms.sal.rpt.vo.SalesOrderStatsVO;

import chn.bhmc.dms.sal.rpt.vo.SalesOrderStatsSearchVO;

/**
 * <pre>
 * [DMS] 판매 레포트
 * </pre>
 *
 * @ClassName   : SalesReportService.java
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

public interface SalesReportService {

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<SalesOrderStatsVO> selectSalesOrderStats(SalesOrderStatsSearchVO searchVO);

}
