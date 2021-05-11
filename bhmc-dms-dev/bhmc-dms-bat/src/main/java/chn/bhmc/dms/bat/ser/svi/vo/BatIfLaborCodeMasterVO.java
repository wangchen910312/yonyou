package chn.bhmc.dms.bat.ser.svi.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatIfLaborCodeMasterVO.java
 * @Description : 공임코드 마스터  VO
 * @author YIN XUEYUAN
 * @since 2016. 5. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 24.     YIN XUEYUAN     최초 생성
 * </pre>
 */

public class BatIfLaborCodeMasterVO extends BaseVO{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6775197571238685484L;

    /**
     * 구분코드
     */
    private String dstinCd;

    /**
     * 딜러 코드
     */
    private String dlrCd;

    /**
     * 공임코드
     */
    private String lbrCd;

    /**
     * 영문 작업명
     */
    private String lbrEnNm;

    /**
     * 중문작업명
     */
    private String lbrChnNm;

    /**
     * 작업수량
     */
    private int lbrQty;

    /**
     * 브랜드 코드
     */
    private String brandCd;

    /**
    * 인터페이스등록일자
    **/
    private Date ifRegDt;

    /**
     * 전송여부
     **/
    private String sendYn;

    /**
     * 적용여부
     **/
    private String applyYn;

    /**
     * 인터페이스결과코드
     **/
    private String ifresult;

    /**
     * 인터페이스실패메세지
     **/
    private String iffailmsg;

    /**
     * 인터페이스생성일자
     **/
    private String createdate;

    /**
     * 인터페이스수정일자
     **/
    private String updatedate;

    /**
     * 배치상태코드
     **/
    private String batStatCd;

    /**
     * 배치결과일자
     **/
    private Date batRsltDt;

    /**
     * 배치메세지내용
     **/
    private String batMesgCont;

    /**
     * @return the dstinCd
     */
    public String getDstinCd() {
        return dstinCd;
    }

    /**
     * @param dstinCd the dstinCd to set
     */
    public void setDstinCd(String dstinCd) {
        this.dstinCd = dstinCd;
    }


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
     * @return the lbrCd
     */
    public String getLbrCd() {
        return lbrCd;
    }

    /**
     * @param lbrCd the lbrCd to set
     */
    public void setLbrCd(String lbrCd) {
        this.lbrCd = lbrCd;
    }

    /**
     * @return the lbrEnNm
     */
    public String getLbrEnNm() {
        return lbrEnNm;
    }

    /**
     * @param lbrEnNm the lbrEnNm to set
     */
    public void setLbrEnNm(String lbrEnNm) {
        this.lbrEnNm = lbrEnNm;
    }

    /**
     * @return the lbrChnNm
     */
    public String getLbrChnNm() {
        return lbrChnNm;
    }

    /**
     * @param lbrChnNm the lbrChnNm to set
     */
    public void setLbrChnNm(String lbrChnNm) {
        this.lbrChnNm = lbrChnNm;
    }

    /**
     * @return the lbrQty
     */
    public int getLbrQty() {
        return lbrQty;
    }

    /**
     * @param lbrQty the lbrQty to set
     */
    public void setLbrQty(int lbrQty) {
        this.lbrQty = lbrQty;
    }

    /**
     * @return the brandCd
     */
    public String getBrandCd() {
        return brandCd;
    }

    /**
     * @param brandCd the brandCd to set
     */
    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
    }

    public String getSendYn() {
        return sendYn;
    }

    public void setSendYn(String sendYn) {
        this.sendYn = sendYn;
    }

    public String getApplyYn() {
        return applyYn;
    }

    public void setApplyYn(String applyYn) {
        this.applyYn = applyYn;
    }

    public String getIfresult() {
        return ifresult;
    }

    public void setIfresult(String ifresult) {
        this.ifresult = ifresult;
    }

    public String getIffailmsg() {
        return iffailmsg;
    }

    public void setIffailmsg(String iffailmsg) {
        this.iffailmsg = iffailmsg;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(String updatedate) {
        this.updatedate = updatedate;
    }

    public String getBatStatCd() {
        return batStatCd;
    }

    public void setBatStatCd(String batStatCd) {
        this.batStatCd = batStatCd;
    }

    public Date getBatRsltDt() {
        return batRsltDt;
    }

    public void setBatRsltDt(Date batRsltDt) {
        this.batRsltDt = batRsltDt;
    }

    public String getBatMesgCont() {
        return batMesgCont;
    }

    public void setBatMesgCont(String batMesgCont) {
        this.batMesgCont = batMesgCont;
    }

    public Date getIfRegDt() {
        return ifRegDt;
    }

    public void setIfRegDt(Date ifRegDt) {
        this.ifRegDt = ifRegDt;
    }



}
