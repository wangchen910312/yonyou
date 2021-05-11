package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.veh.vo.ReceiptScanHistMgmtVO;
import chn.bhmc.dms.sal.veh.vo.ReceiptScanHistMgmtSearchVO;

/**
 * <pre>
 * 기준정보 > 영수증스캔이력관리
 * </pre>
 *
 * @ClassName   : ReceiptScanHistMgmtDAO.java
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
@Mapper("receiptScanHistMgmtDAO")
public interface ReceiptScanHistMgmtDAO {
    
    /**
     * 조회 조건에 해당하는 기준정보 > 영수증스캔이력관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiptScanHistMgmtSearchVO
     * @return 조회 목록
     */
    public List<ReceiptScanHistMgmtVO> selectSalesReceiptScanHistMgmtSearchData(ReceiptScanHistMgmtSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기준정보 > 영수증스캔이력관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiptScanHistMgmtSearchVO
     * @return
     */
    public int selectSalesReceiptScanHistMgmtSearchCnt(ReceiptScanHistMgmtSearchVO searchVO);
    
    

}
