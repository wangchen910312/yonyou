package chn.bhmc.dms.mis.tds.vo;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * 목표 분해 공구
 * </pre>
 *
 * @ClassName   : TargetDcptStepBaseVO.java
 * @Description : 목표 분해 공구
 * @author chibeom.song
 * @since 2016. 9. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 20.   chibeom.song     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="manuCarlineCd"    , mesgKey="sal.lbl.carlineCd")
   ,@ValidField(field="manuCarlineNm"      , mesgKey="sal.lbl.modelCd")
   })
public class TargetDcptStepBaseVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1566890295849129058L;


    // 목표 분해 공구 - 제조사 목표
    private String manuCarlineCd;
    private String manuCarlineNm;
    private String manuTargQty;
    private String manuDlrCd;
    /**
     * @return the manuCarlineCd
     */
    public String getManuCarlineCd() {
        return manuCarlineCd;
    }
    /**
     * @param manuCarlineCd the manuCarlineCd to set
     */
    public void setManuCarlineCd(String manuCarlineCd) {
        this.manuCarlineCd = manuCarlineCd;
    }
    /**
     * @return the manuCarlineNm
     */
    public String getManuCarlineNm() {
        return manuCarlineNm;
    }
    /**
     * @param manuCarlineNm the manuCarlineNm to set
     */
    public void setManuCarlineNm(String manuCarlineNm) {
        this.manuCarlineNm = manuCarlineNm;
    }
    /**
     * @return the manuTargQty
     */
    public String getManuTargQty() {
        return manuTargQty;
    }
    /**
     * @param manuTargQty the manuTargQty to set
     */
    public void setManuTargQty(String manuTargQty) {
        this.manuTargQty = manuTargQty;
    }
    /**
     * @return the manuDlrCd
     */
    public String getManuDlrCd() {
        return manuDlrCd;
    }
    /**
     * @param manuDlrCd the manuDlrCd to set
     */
    public void setManuDlrCd(String manuDlrCd) {
        this.manuDlrCd = manuDlrCd;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}
