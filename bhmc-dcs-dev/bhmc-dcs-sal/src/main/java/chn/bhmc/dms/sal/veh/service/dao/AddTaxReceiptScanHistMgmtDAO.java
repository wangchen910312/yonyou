package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.veh.vo.AddTaxReceiptScanHistMgmtVO;
import chn.bhmc.dms.sal.veh.vo.AddTaxReceiptScanHistMgmtSearchVO;

/**
 * <pre>
 * 기준정보 > 부가세영수증스캔이력관리
 * </pre>
 *
 * @ClassName   : AddTaxReceiptScanHistMgmtDAO.java
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
@Mapper("addTaxReceiptScanHistMgmtDAO")
public interface AddTaxReceiptScanHistMgmtDAO {
    
    /**
     * 조회 조건에 해당하는 기준정보 > 부가세영수증스캔이력관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AddTaxReceiptScanHistMgmtSearchVO
     * @return 조회 목록
     */
    public List<AddTaxReceiptScanHistMgmtVO> selectSalesAddTaxReceiptScanHistMgmtSearchData(AddTaxReceiptScanHistMgmtSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기준정보 > 부가세영수증스캔이력관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AddTaxReceiptScanHistMgmtSearchVO
     * @return
     */
    public int selectSalesAddTaxReceiptScanHistMgmtSearchCnt(AddTaxReceiptScanHistMgmtSearchVO searchVO);

}
