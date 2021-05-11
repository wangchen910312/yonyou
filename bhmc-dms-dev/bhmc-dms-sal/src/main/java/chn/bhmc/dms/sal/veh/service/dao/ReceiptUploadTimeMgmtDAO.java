package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.sal.veh.vo.ReceiptUploadTimeMgmtVO;
import chn.bhmc.dms.sal.veh.vo.ReceiptUploadTimeMgmtSearchVO;


/**
 * <pre>
 * 기준정보 > 영수증업로드시간대관리
 * </pre>
 *
 * @ClassName   : ReceiptUploadTimeMgmtDAO.java
 * @Description : 기준정보 > 영수증업로드시간대관리
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
@Mapper("receiptUploadTimeMgmtDAO")
public interface ReceiptUploadTimeMgmtDAO {
    
    /**
     * 조회 조건에 해당하는 기준정보 > 영수증업로드시간대관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AddTaxReceiptScanHistMgmtSearchVO
     * @return 조회 목록
     */
    public List<ReceiptUploadTimeMgmtVO> selectSalesReceiptUploadTimeMgmtSearchData(ReceiptUploadTimeMgmtSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기준정보 > 영수증업로드시간대관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AddTaxReceiptScanHistMgmtSearchVO
     * @return
     */
    public int selectSalesReceiptUploadTimeMgmtSearchCnt(ReceiptUploadTimeMgmtSearchVO searchVO);
    
    /**
     * Key에 해당하는 기준정보 > 영수증업로드시간대관리 정보를 조회한다.
     * @param mesgKey - 메세지키
     * @return 조회한 기준정보 > 영수증업로드시간대관리 정보
     */
    public ReceiptUploadTimeMgmtVO selectSalesReceiptUploadTimeSaveByKey(@Param("rSeq") String rSeq);
    
    /**
     * 기준정보 > 영수증업로드시간대관리 정보를 등록한다.
     * @param receiptUploadTimeMgmtVO - 등록할 정보가 담긴 ReceiptUploadTimeMgmtVO
     * @return 등록된 목록수
     */
    public int insertSalesReceiptUploadTimeSave(ReceiptUploadTimeMgmtVO receiptUploadTimeMgmtVO);

    /**
     * 기준정보 > 영수증업로드시간대관리 정보를 수정한다.
     * @param receiptUploadTimeMgmtVO - 수정할 정보가 담긴 ReceiptUploadTimeMgmtVO
     * @return 수정된 목록수
     */
    public int updateSalesReceiptUploadTimeSave(ReceiptUploadTimeMgmtVO receiptUploadTimeMgmtVO);

    /**
     * 기준정보 > 영수증업로드시간대관리 정보를 삭제한다.
     * @param receiptUploadTimeMgmtVO - 삭제할 정보가 담긴 ReceiptUploadTimeMgmtVO
     * @return 삭제된 목록수
     */
    public int deleteSalesReceiptUploadTimeSave(ReceiptUploadTimeMgmtVO receiptUploadTimeMgmtVO);

}
