package chn.bhmc.dms.par.stm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;
/**
 * 현재고 VO
 *
 * @ClassName   : StockInOutVO.java
 * @Description : StockInOutVO Class
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="pltCd", mesgKey="par.lbl.pltCd")
    ,@ValidField(field="strgeCd", mesgKey="par.lbl.strgeCd")
    ,@ValidField(field="itemCd", mesgKey="par.lbl.itemCd")
    ,@ValidField(field="grGiDocNo", mesgKey="par.lbl.grGiDocNo")
    ,@ValidField(field="grGiDocLineNo", mesgKey="par.lbl.lineNm")
    ,@ValidField(field="seq", mesgKey="par.lbl.seq")
    ,@ValidField(field="grGiTp", mesgKey="par.lbl.grGiTp")
    ,@ValidField(field="procQty", mesgKey="par.lbl.procQty")
    ,@ValidField(field="grGiQty", mesgKey="par.lbl.grGiQty")
    ,@ValidField(field="grGiScheDt", mesgKey="par.lbl.grGiScheDt")
    ,@ValidField(field="bpCd", mesgKey="par.lbl.bpCd")
    ,@ValidField(field="custCd", mesgKey="par.lbl.custCd")
})
public class GrGiScheduleVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2407073374327353084L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 창고코드
     **/
    @NotEmpty
    private String strgeCd;

    /**
     * 품목코드
     **/
    @NotEmpty
    private String itemCd;

    /**
     * 입출고문서번호
     **/
    @NotEmpty
    private String grGiDocNo;

    /**
     * 입출고문서라인번호
     **/
    @NotEmpty
    private int grGiDocLineNo;

    /**
     * 일련번호
     **/
    @NotEmpty
    private int seq;

    /**
     * 입출고유형
     **/
    @NotEmpty
    private String grGiTp;

    /**
     * 처리수량
     **/
    private Double procQty;

    /**
     * 입출고수량
     **/
    private Double grGiQty;

    /**
     * 입출고예정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grGiScheDt;

    /**
     * 거래처코드
     **/
    private String bpCd;

    /**
     * 고객코드
     **/
    private String custCd;

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
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }

    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
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
     * @return the grGiDocNo
     */
    public String getGrGiDocNo() {
        return grGiDocNo;
    }

    /**
     * @param grGiDocNo the grGiDocNo to set
     */
    public void setGrGiDocNo(String grGiDocNo) {
        this.grGiDocNo = grGiDocNo;
    }

    /**
     * @return the grGiDocLineNo
     */
    public int getGrGiDocLineNo() {
        return grGiDocLineNo;
    }

    /**
     * @param grGiDocLineNo the grGiDocLineNo to set
     */
    public void setGrGiDocLineNo(int grGiDocLineNo) {
        this.grGiDocLineNo = grGiDocLineNo;
    }

    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the grGiTp
     */
    public String getGrGiTp() {
        return grGiTp;
    }

    /**
     * @param grGiTp the grGiTp to set
     */
    public void setGrGiTp(String grGiTp) {
        this.grGiTp = grGiTp;
    }

    /**
     * @return the procQty
     */
    public Double getProcQty() {
        return procQty;
    }

    /**
     * @param procQty the procQty to set
     */
    public void setProcQty(Double procQty) {
        this.procQty = procQty;
    }

    /**
     * @return the grGiQty
     */
    public Double getGrGiQty() {
        return grGiQty;
    }

    /**
     * @param grGiQty the grGiQty to set
     */
    public void setGrGiQty(Double grGiQty) {
        this.grGiQty = grGiQty;
    }

    /**
     * @return the grGiScheDt
     */
    public Date getGrGiScheDt() {
        return grGiScheDt;
    }

    /**
     * @param grGiScheDt the grGiScheDt to set
     */
    public void setGrGiScheDt(Date grGiScheDt) {
        this.grGiScheDt = grGiScheDt;
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
     * @return the custCd
     */
    public String getCustCd() {
        return custCd;
    }

    /**
     * @param custCd the custCd to set
     */
    public void setCustCd(String custCd) {
        this.custCd = custCd;
    }
}
