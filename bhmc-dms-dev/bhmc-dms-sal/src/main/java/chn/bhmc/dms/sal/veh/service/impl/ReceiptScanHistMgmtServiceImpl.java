package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.vo.ReceiptScanHistMgmtVO;
import chn.bhmc.dms.sal.veh.vo.ReceiptScanHistMgmtSearchVO;
import chn.bhmc.dms.sal.veh.service.ReceiptScanHistMgmtService;
import chn.bhmc.dms.sal.veh.service.dao.ReceiptScanHistMgmtDAO;

/**
 * <pre>
 * 기준정보 > 영수증스캔이력관리
 * </pre>
 *
 * @ClassName   : ReceiptScanHistMgmtServiceImpl.java
 * @Description : 기준정보 > 영수증스캔이력관리
 * @author chibeom.song
 * @since 2017. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 17.   chibeom.song     최초 생성
 * </pre>
 */
@Service("receiptScanHistMgmtService")
public class ReceiptScanHistMgmtServiceImpl extends HService implements ReceiptScanHistMgmtService {
    
    /**
     * 기준정보 > 영수증스캔이력관리 DAO
     */
    @Resource(name="receiptScanHistMgmtDAO")
    ReceiptScanHistMgmtDAO receiptScanHistMgmtDAO;
    
    /**
     * 조회 조건에 해당하는 기준정보 > 영수증스캔이력관리 정보를 조회한다.
     */
    @Override
    public List<ReceiptScanHistMgmtVO> selectSalesReceiptScanHistMgmtSearchData(ReceiptScanHistMgmtSearchVO searchVO) throws Exception {
        return receiptScanHistMgmtDAO.selectSalesReceiptScanHistMgmtSearchData(searchVO);
    }

    /**
     * 조회 조건에 해당하는 기준정보 > 영수증스캔이력관리 총 갯수를 조회한다.
     */
    @Override
    public int selectSalesReceiptScanHistMgmtSearchCnt(ReceiptScanHistMgmtSearchVO searchVO) throws Exception {
        return receiptScanHistMgmtDAO.selectSalesReceiptScanHistMgmtSearchCnt(searchVO);
    }

}
