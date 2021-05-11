package chn.bhmc.dms.par.pmm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 공급처별 부품구매 가격마스터 VO
 *
 * @ClassName   : PartsVenderPriceMasterVO.java
 * @Description : PartsVenderPriceMasterVO Class
 * @author In Bo Shim
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     In Bo Shim     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"           , mesgKey="par.lbl.dlrCd")
   ,@ValidField(field="bpCd"            , mesgKey="par.lbl.bpCd")
   ,@ValidField(field="itemCd"          , mesgKey="par.lbl.itemCd")
   ,@ValidField(field="prcTp"           , mesgKey="par.lbl.purcPrcTp")
   ,@ValidField(field="lineNo"          , mesgKey="par.lbl.lineNo")
   ,@ValidField(field="applyYn"         , mesgKey="par.lbl.applyYn")
   ,@ValidField(field="purcPrc"         , mesgKey="par.lbl.purcPrc")
   ,@ValidField(field="prcQty"          , mesgKey="par.lbl.prcQty")
   ,@ValidField(field="prcQtyUnitCd"    , mesgKey="par.lbl.prcQtyUnitCd")
   ,@ValidField(field="startDt"         , mesgKey="par.lbl.startDt")
   ,@ValidField(field="endDt"           , mesgKey="par.lbl.endDt")
   ,@ValidField(field="delYn"           , mesgKey="par.lbl.delYn")
   })
public class PartsVenderPriceMasterVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 516805863531190411L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String dlrCd;

    /**
     * 거래처 코드
     */
    private String bpCd;

    /**
     * 품목번호
     */
    private String itemCd;

    /**
     * 구매단가유형
     */
    private String prcTp;

    /**
     * 가격변경 라인
     */
    private int lineNo;

    /**
     * 적용여부
     */
    private String applyYn;

    /**
     * 구매단가금액
     */
    private double purcPrc;

    /**
     * 단가수량
     */
    private double prcQty;

    /**
     * 단가수량단위
     */
    private String prcQtyUnitCd;

    /**
     * 효력시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt = null;

    /**
     * 효력종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt = null;

    /**
     * 삭제여부
     */
    private String delYn;

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the bpCd
     */
    public String getBpCd() {
        return bpCd;
    }

    /**
     * @param bpCd the bpCd to set
     */
    public void setBpCd(String bpCd) {
        this.bpCd = bpCd;
    }

    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the prcTp
     */
    public String getPrcTp() {
        return prcTp;
    }

    /**
     * @param prcTp the prcTp to set
     */
    public void setPrcTp(String prcTp) {
        this.prcTp = prcTp;
    }

    /**
     * @return the lineNo
     */
    public int getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    /**
     * @return the applyYn
     */
    public String getApplyYn() {
        return applyYn;
    }

    /**
     * @param applyYn the applyYn to set
     */
    public void setApplyYn(String applyYn) {
        this.applyYn = applyYn;
    }

    /**
     * @return the purcPrc
     */
    public double getPurcPrc() {
        return purcPrc;
    }

    /**
     * @param purcPrc the purcPrc to set
     */
    public void setPurcPrc(double purcPrc) {
        this.purcPrc = purcPrc;
    }

    /**
     * @return the prcQty
     */
    public double getPrcQty() {
        return prcQty;
    }

    /**
     * @param prcQty the prcQty to set
     */
    public void setPrcQty(double prcQty) {
        this.prcQty = prcQty;
    }

    /**
     * @return the prcQtyUnitCd
     */
    public String getPrcQtyUnitCd() {
        return prcQtyUnitCd;
    }

    /**
     * @param prcQtyUnitCd the prcQtyUnitCd to set
     */
    public void setPrcQtyUnitCd(String prcQtyUnitCd) {
        this.prcQtyUnitCd = prcQtyUnitCd;
    }

    /**
     * @return the startDt
     */
    public Date getStartDt() {
        return startDt;
    }

    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(Date startDt) {
        this.startDt = startDt;
    }

    /**
     * @return the endDt
     */
    public Date getEndDt() {
        return endDt;
    }

    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(Date endDt) {
        this.endDt = endDt;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }
}
