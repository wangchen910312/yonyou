package chn.bhmc.dms.sal.veh.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * 기준정보 > 영수증업로드시간대관리
 * </pre>
 *
 * @ClassName   : ReceiptUploadTimeMgmtSaveVO.java
 * @Description : 기준정보 > 영수증업로드시간대관리
 * @author chibeom.song
 * @since 2017. 2. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 26.     chibeom.song     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="outYyyymm", mesgKey="sal.lbl.outyyyymm")
    ,@ValidField(field="receiptTp", mesgKey="sal.lbl.invoiceTp")
    ,@ValidField(field="upStdt", mesgKey="sal.lbl.UploadImprovTime")
    ,@ValidField(field="upEddt", mesgKey="sal.lbl.UploadEndTime")
    ,@ValidField(field="controlChk", mesgKey="sal.lbl.ctrlYn")
})
public class ReceiptUploadTimeMgmtSaveVO extends BaseSaveVO<ReceiptUploadTimeMgmtVO> {
    
    private static final long serialVersionUID = -1210745396214803853L;
    
    public List<ReceiptUploadTimeMgmtVO> receiptUploadTimeList = new ArrayList<ReceiptUploadTimeMgmtVO>();

    /**
     * @return the receiptUploadTimeList
     */
    public List<ReceiptUploadTimeMgmtVO> getReceiptUploadTimeList() {
        return receiptUploadTimeList;
    }

    /**
     * @param receiptUploadTimeList the receiptUploadTimeList to set
     */
    public void setReceiptUploadTimeList(List<ReceiptUploadTimeMgmtVO> receiptUploadTimeList) {
        this.receiptUploadTimeList = receiptUploadTimeList;
    }

}
