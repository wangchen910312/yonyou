package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.vo.AddTaxReceiptScanHistMgmtVO;
import chn.bhmc.dms.sal.veh.vo.AddTaxReceiptScanHistMgmtSearchVO;
import chn.bhmc.dms.sal.veh.service.AddTaxReceiptScanHistMgmtService;
import chn.bhmc.dms.sal.veh.service.dao.AddTaxReceiptScanHistMgmtDAO;

/**
 * <pre>
 * 기준정보 > 부가세영수증스캔이력관리
 * </pre>
 *
 * @ClassName   : AddTaxReceiptScanHistMgmtServiceImpl.java
 * @Description : 기준정보 > 부가세영수증스캔이력관리
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

@Service("addTaxReceiptScanHistMgmtService")
public class AddTaxReceiptScanHistMgmtServiceImpl extends HService implements AddTaxReceiptScanHistMgmtService {
    
    /**
     * 기준정보 > 부가세영수증스캔이력관리 DAO
     */
    @Resource(name="addTaxReceiptScanHistMgmtDAO")
    AddTaxReceiptScanHistMgmtDAO addTaxReceiptScanHistMgmtDAO;
    
    /**
     * 조회 조건에 해당하는 기준정보 > 영수증스캔이력관리 정보를 조회한다.
     */
    @Override
    public List<AddTaxReceiptScanHistMgmtVO> selectSalesAddTaxReceiptScanHistMgmtSearchData(AddTaxReceiptScanHistMgmtSearchVO searchVO) throws Exception {
        return addTaxReceiptScanHistMgmtDAO.selectSalesAddTaxReceiptScanHistMgmtSearchData(searchVO);
    }

    /**
     * 조회 조건에 해당하는 기준정보 > 영수증스캔이력관리 총 갯수를 조회한다.
     */
    @Override
    public int selectSalesAddTaxReceiptScanHistMgmtSearchCnt(AddTaxReceiptScanHistMgmtSearchVO searchVO) throws Exception {
        return addTaxReceiptScanHistMgmtDAO.selectSalesAddTaxReceiptScanHistMgmtSearchCnt(searchVO);
    }

}
