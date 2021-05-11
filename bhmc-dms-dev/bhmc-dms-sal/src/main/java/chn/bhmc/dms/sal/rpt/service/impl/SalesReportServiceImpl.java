package chn.bhmc.dms.sal.rpt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.rpt.service.dao.SalesReportDAO;

import chn.bhmc.dms.sal.rpt.vo.SalesOrderStatsSearchVO;
import chn.bhmc.dms.sal.rpt.vo.SalesOrderStatsVO;

import chn.bhmc.dms.sal.rpt.service.SalesReportService;

/**
 * <pre>
 * [DMS] 판매 레포트
 * </pre>
 *
 * @ClassName   : SalesReportServiceImpl.java
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
@Service("salesReportService")
public class SalesReportServiceImpl extends HService implements SalesReportService {

    /**
     * 포틀릿 레이아웃 관리 DAO
     */
    @Resource(name="salesReportDAO")
    SalesReportDAO salesReportDAO;


    /*
     * @see chn.bhmc.dms.sal.rpt.service.SalesReportService#selectSalesOrderStats(chn.bhmc.dms.sal.rpt.vo.SalesOrderStatsSearchVO)
     */
    @Override
    public List<SalesOrderStatsVO> selectSalesOrderStats(SalesOrderStatsSearchVO searchVO) {

        return salesReportDAO.selectSalesOrderStats(searchVO);

        //return portletLayoutDAO.selectSalesOrderStats(langCd);

    }

}
