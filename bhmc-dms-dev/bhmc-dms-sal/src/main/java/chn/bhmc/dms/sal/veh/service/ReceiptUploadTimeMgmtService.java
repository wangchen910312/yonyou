package chn.bhmc.dms.sal.veh.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

import chn.bhmc.dms.sal.veh.vo.ReceiptUploadTimeMgmtVO;
import chn.bhmc.dms.sal.veh.vo.ReceiptUploadTimeMgmtSearchVO;

/**
 * <pre>
 * 기준정보 > 영수증업로드시간대관리
 * </pre>
 *
 * @ClassName   : ReceiptUploadTimeMgmtService.java
 * @Description : 기준정보 > 영수증업로드시간대관리
 * @author chibeom.song
 * @since 2017. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 17.     chibeom.song     최초 생성
 * </pre>
 */

public interface ReceiptUploadTimeMgmtService {
    
    /**
     * 조회 조건에 해당하는 기준정보 > 영수증업로드시간대관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiptScanHistMgmtSearchVO
     * @return 조회 목록
     */
    public List<ReceiptUploadTimeMgmtVO> selectSalesReceiptUploadTimeMgmtSearchData(ReceiptUploadTimeMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기준정보 > 영수증업로드시간대관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiptScanHistMgmtSearchVO
     * @return
     */
    public int selectSalesReceiptUploadTimeMgmtSearchCnt(ReceiptUploadTimeMgmtSearchVO searchVO) throws Exception;
    
    /**
     * 기준정보 > 영수증업로드시간대관리 정보를 등록/수정/삭제 처리한다.
     * @param ReceiptUploadTimeMgmtSaveVO
     */
    public void multiSalesReceiptUploadTimeSave(BaseSaveVO<ReceiptUploadTimeMgmtVO> receiptUploadTimeMgmtSaveVO) throws Exception;
    
    /**
     * Key에 해당하는 기준정보 > 영수증업로드시간대관리 정보를 조회한다.
     * @param rSeq - 메세지키
     * @return 조회한 기준정보 > 영수증업로드시간대관리 정보
     */
    public ReceiptUploadTimeMgmtVO selectSalesReceiptUploadTimeSaveByKey(String rSeq) throws Exception;
    
    /**
     * 기준정보 > 영수증업로드시간대관리 정보를 등록한다.
     * @param receiptUploadTimeMgmtVO - 등록할 정보가 담긴 ReceiptUploadTimeMgmtVO
     * @return 등록된 목록수
     */
    public int insertSalesReceiptUploadTimeSave(ReceiptUploadTimeMgmtVO receiptUploadTimeMgmtVO) throws Exception;

    /**
     * 기준정보 > 영수증업로드시간대관리 정보를 수정한다.
     * @param receiptUploadTimeMgmtVO - 수정할 정보가 담긴 ReceiptUploadTimeMgmtVO
     * @return 수정된 목록수
     */
    public int updateSalesReceiptUploadTimeSave(ReceiptUploadTimeMgmtVO receiptUploadTimeMgmtVO) throws Exception;

    /**
     * 기준정보 > 영수증업로드시간대관리 정보를 삭제한다.
     * @param receiptUploadTimeMgmtVO - 삭제할 정보가 담긴 ReceiptUploadTimeMgmtVO
     * @return 삭제된 목록수
     */
    public int deleteSalesReceiptUploadTimeSave(ReceiptUploadTimeMgmtVO receiptUploadTimeMgmtVO) throws Exception;

}
