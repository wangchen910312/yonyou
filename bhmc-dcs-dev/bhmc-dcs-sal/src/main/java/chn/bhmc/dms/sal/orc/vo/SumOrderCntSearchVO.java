package chn.bhmc.dms.sal.orc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SumOrderCntSearchVO.java
 * @Description :
 * @author Jin Suk Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.     Jin Suk Kim     최초 생성
 * </pre>
 */
public class SumOrderCntSearchVO extends BaseSearchVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5134930325848209742L;


    private  String                 sOrdYyMmDt;
    private  String                 sOrdPrid;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sOrdStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sOrdEndDt;
    private  String                 sConfirmDt;
    private  String                 sDlrCd;
    private  String                 sCarlineCd;
    private  String                 sModelCd;
    private  String                 sOcnCd;
    private  String                 sExtColorCd;
    private  String                 sIntColorCd;
    //private  List<String>           sOrdsTp;          // 주문유형(오더유형)
    private  String                 sOrdTp;             // 주문유형(오더유형)
    private  String                 sOrdStatCd;         // 주문상태
    private  String                 sOrdSeq;
    private  String                 sOrdsTp;            // 주문유형(오더유형)
    private String sConfirmDtVar;

    private String sOrdStartDtstr;
    private String sOrdEndDtstr;
    private String strOrdTp;
    private String sFscNm;
    /**
     * @return the strOrdTp
     */
    public String getStrOrdTp() {
        return strOrdTp;
    }

    /**
     * @param strOrdTp the strOrdTp to set
     */
    public void setStrOrdTp(String strOrdTp) {
        this.strOrdTp = strOrdTp;
    }

    /**
     * @return the sConfirmDtVar
     */
    public String getsConfirmDtVar() {
        return sConfirmDtVar;
    }

    /**
     * @param sConfirmDtVar the sConfirmDtVar to set
     */
    public void setsConfirmDtVar(String sConfirmDtVar) {
        this.sConfirmDtVar = sConfirmDtVar;
    }

    /**
     * @return the sOrdsTp
     */
    public String getsOrdsTp() {
        return sOrdsTp;
    }

    /**
     * @param sOrdsTp the sOrdsTp to set
     */
    public void setsOrdsTp(String sOrdsTp) {
        this.sOrdsTp = sOrdsTp;
    }

    /**
     * @return the sOrdYyMmDt
     */
    public String getsOrdYyMmDt() {
        return sOrdYyMmDt;
    }

    /**
     * @param sOrdYyMmDt the sOrdYyMmDt to set
     */
    public void setsOrdYyMmDt(String sOrdYyMmDt) {
        this.sOrdYyMmDt = sOrdYyMmDt;
    }

    /**
     * @return the sOrdPrid
     */
    public String getsOrdPrid() {
        return sOrdPrid;
    }

    /**
     * @param sOrdPrid the sOrdPrid to set
     */
    public void setsOrdPrid(String sOrdPrid) {
        this.sOrdPrid = sOrdPrid;
    }

    /**
     * @return the sOrdStartDt
     */
    public Date getsOrdStartDt() {
        return sOrdStartDt;
    }

    /**
     * @param sOrdStartDt the sOrdStartDt to set
     */
    public void setsOrdStartDt(Date sOrdStartDt) {
        this.sOrdStartDt = sOrdStartDt;
    }

    /**
     * @return the sOrdEndDt
     */
    public Date getsOrdEndDt() {
        return sOrdEndDt;
    }

    /**
     * @param sOrdEndDt the sOrdEndDt to set
     */
    public void setsOrdEndDt(Date sOrdEndDt) {
        this.sOrdEndDt = sOrdEndDt;
    }

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }

    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }

    /**
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }

    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }

    /**
     * @return the sOcnCd
     */
    public String getsOcnCd() {
        return sOcnCd;
    }

    /**
     * @param sOcnCd the sOcnCd to set
     */
    public void setsOcnCd(String sOcnCd) {
        this.sOcnCd = sOcnCd;
    }

    /**
     * @return the sExtColorCd
     */
    public String getsExtColorCd() {
        return sExtColorCd;
    }

    /**
     * @param sExtColorCd the sExtColorCd to set
     */
    public void setsExtColorCd(String sExtColorCd) {
        this.sExtColorCd = sExtColorCd;
    }

    /**
     * @return the sIntColorCd
     */
    public String getsIntColorCd() {
        return sIntColorCd;
    }

    /**
     * @param sIntColorCd the sIntColorCd to set
     */
    public void setsIntColorCd(String sIntColorCd) {
        this.sIntColorCd = sIntColorCd;
    }


    /**
     * @return the sOrdTp
     */
    public String getsOrdTp() {
        return sOrdTp;
    }

    /**
     * @param sOrdTp the sOrdTp to set
     */
    public void setsOrdTp(String sOrdTp) {
        this.sOrdTp = sOrdTp;
    }

    /**
     * @return the sOrdStatCd
     */
    public String getsOrdStatCd() {
        return sOrdStatCd;
    }

    /**
     * @param sOrdStatCd the sOrdStatCd to set
     */
    public void setsOrdStatCd(String sOrdStatCd) {
        this.sOrdStatCd = sOrdStatCd;
    }

    /**
     * @return the sOrdSeq
     */
    public String getsOrdSeq() {
        return sOrdSeq;
    }

    /**
     * @param sOrdSeq the sOrdSeq to set
     */
    public void setsOrdSeq(String sOrdSeq) {
        this.sOrdSeq = sOrdSeq;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the sConfirmDt
     */
    public String getsConfirmDt() {
        return sConfirmDt;
    }

    /**
     * @param sConfirmDt the sConfirmDt to set
     */
    public void setsConfirmDt(String sConfirmDt) {
        this.sConfirmDt = sConfirmDt;
    }

    /**
     * @return the sOrdStartDtstr
     */
    public String getsOrdStartDtstr() {
        return sOrdStartDtstr;
    }

    /**
     * @param sOrdStartDtstr the sOrdStartDtstr to set
     */
    public void setsOrdStartDtstr(String sOrdStartDtstr) {
        this.sOrdStartDtstr = sOrdStartDtstr;
    }

    /**
     * @return the sOrdEndDtstr
     */
    public String getsOrdEndDtstr() {
        return sOrdEndDtstr;
    }

    /**
     * @param sOrdEndDtstr the sOrdEndDtstr to set
     */
    public void setsOrdEndDtstr(String sOrdEndDtstr) {
        this.sOrdEndDtstr = sOrdEndDtstr;
    }

    /**
     * @return the sFscNm
     */
    public String getsFscNm() {
        return sFscNm;
    }

    /**
     * @param sFscNm the sFscNm to set
     */
    public void setsFscNm(String sFscNm) {
        this.sFscNm = sFscNm;
    }

}
