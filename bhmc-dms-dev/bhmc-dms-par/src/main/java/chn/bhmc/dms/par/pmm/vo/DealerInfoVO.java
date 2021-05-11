package chn.bhmc.dms.par.pmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DealerInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 7. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 31.     Ki hyun Kwon     최초 생성
 * </pre>
 */

public class DealerInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8780735799461535472L;

    private String dmrDlrCd;
    private String dmrDlrNm;
    private String dmrPdc;
    private String dmrDlrTyp;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dmrTrdBizStr;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dmrTrdBizEnd;
    private String dmrPnoMrnm;
    private String dmrAreaMrnm;
    private String dmrPnoMgrTel;
    private String dmrPnoMgrCell;
    private String dmrZip;
    private String dmrPnoMgrFax;
    private String dmrPnoMgrEmail;
    private String dmrIpAdr;
    /**
     * @return the dmrDlrCd
     */
    public String getDmrDlrCd() {
        return dmrDlrCd;
    }
    /**
     * @param dmrDlrCd the dmrDlrCd to set
     */
    public void setDmrDlrCd(String dmrDlrCd) {
        this.dmrDlrCd = dmrDlrCd;
    }
    /**
     * @return the dmrDlrNm
     */
    public String getDmrDlrNm() {
        return dmrDlrNm;
    }
    /**
     * @param dmrDlrNm the dmrDlrNm to set
     */
    public void setDmrDlrNm(String dmrDlrNm) {
        this.dmrDlrNm = dmrDlrNm;
    }
    /**
     * @return the dmrPdc
     */
    public String getDmrPdc() {
        return dmrPdc;
    }
    /**
     * @param dmrPdc the dmrPdc to set
     */
    public void setDmrPdc(String dmrPdc) {
        this.dmrPdc = dmrPdc;
    }
    /**
     * @return the dmrDlrTyp
     */
    public String getDmrDlrTyp() {
        return dmrDlrTyp;
    }
    /**
     * @param dmrDlrTyp the dmrDlrTyp to set
     */
    public void setDmrDlrTyp(String dmrDlrTyp) {
        this.dmrDlrTyp = dmrDlrTyp;
    }
    /**
     * @return the dmrTrdBizStr
     */
    public Date getDmrTrdBizStr() {
        return dmrTrdBizStr;
    }
    /**
     * @param dmrTrdBizStr the dmrTrdBizStr to set
     */
    public void setDmrTrdBizStr(Date dmrTrdBizStr) {
        this.dmrTrdBizStr = dmrTrdBizStr;
    }
    /**
     * @return the dmrTrdBizEnd
     */
    public Date getDmrTrdBizEnd() {
        return dmrTrdBizEnd;
    }
    /**
     * @param dmrTrdBizEnd the dmrTrdBizEnd to set
     */
    public void setDmrTrdBizEnd(Date dmrTrdBizEnd) {
        this.dmrTrdBizEnd = dmrTrdBizEnd;
    }
    /**
     * @return the dmrPnoMrnm
     */
    public String getDmrPnoMrnm() {
        return dmrPnoMrnm;
    }
    /**
     * @param dmrPnoMrnm the dmrPnoMrnm to set
     */
    public void setDmrPnoMrnm(String dmrPnoMrnm) {
        this.dmrPnoMrnm = dmrPnoMrnm;
    }
    /**
     * @return the dmrAreaMrnm
     */
    public String getDmrAreaMrnm() {
        return dmrAreaMrnm;
    }
    /**
     * @param dmrAreaMrnm the dmrAreaMrnm to set
     */
    public void setDmrAreaMrnm(String dmrAreaMrnm) {
        this.dmrAreaMrnm = dmrAreaMrnm;
    }
    /**
     * @return the dmrPnoMgrTel
     */
    public String getDmrPnoMgrTel() {
        return dmrPnoMgrTel;
    }
    /**
     * @param dmrPnoMgrTel the dmrPnoMgrTel to set
     */
    public void setDmrPnoMgrTel(String dmrPnoMgrTel) {
        this.dmrPnoMgrTel = dmrPnoMgrTel;
    }
    /**
     * @return the dmrPnoMgrCell
     */
    public String getDmrPnoMgrCell() {
        return dmrPnoMgrCell;
    }
    /**
     * @param dmrPnoMgrCell the dmrPnoMgrCell to set
     */
    public void setDmrPnoMgrCell(String dmrPnoMgrCell) {
        this.dmrPnoMgrCell = dmrPnoMgrCell;
    }
    /**
     * @return the dmrZip
     */
    public String getDmrZip() {
        return dmrZip;
    }
    /**
     * @param dmrZip the dmrZip to set
     */
    public void setDmrZip(String dmrZip) {
        this.dmrZip = dmrZip;
    }
    /**
     * @return the dmrPnoMgrFax
     */
    public String getDmrPnoMgrFax() {
        return dmrPnoMgrFax;
    }
    /**
     * @param dmrPnoMgrFax the dmrPnoMgrFax to set
     */
    public void setDmrPnoMgrFax(String dmrPnoMgrFax) {
        this.dmrPnoMgrFax = dmrPnoMgrFax;
    }
    /**
     * @return the dmrPnoMgrEmail
     */
    public String getDmrPnoMgrEmail() {
        return dmrPnoMgrEmail;
    }
    /**
     * @param dmrPnoMgrEmail the dmrPnoMgrEmail to set
     */
    public void setDmrPnoMgrEmail(String dmrPnoMgrEmail) {
        this.dmrPnoMgrEmail = dmrPnoMgrEmail;
    }
    /**
     * @return the dmrIpAdr
     */
    public String getDmrIpAdr() {
        return dmrIpAdr;
    }
    /**
     * @param dmrIpAdr the dmrIpAdr to set
     */
    public void setDmrIpAdr(String dmrIpAdr) {
        this.dmrIpAdr = dmrIpAdr;
    }




}
