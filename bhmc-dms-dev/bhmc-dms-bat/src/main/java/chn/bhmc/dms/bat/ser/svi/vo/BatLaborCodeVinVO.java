package chn.bhmc.dms.bat.ser.svi.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatLaborCodeVinVO.java
 * @Description : 공임코드 VIN MAPPING VO
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
public class BatLaborCodeVinVO extends BaseVO {



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6065633764736763064L;

    /**
     * 차대번호
     */
    private String vinNo;

    /**
     * 딜러코드
     */
    private String ltsModelCd;

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

    public String getVinNo() {
        return vinNo;
    }

    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    public String getLtsModelCd() {
        return ltsModelCd;
    }

    public void setLtsModelCd(String ltsModelCd) {
        this.ltsModelCd = ltsModelCd;
    }

    public Date getIfRegDt() {
        return ifRegDt;
    }

    public void setIfRegDt(Date ifRegDt) {
        this.ifRegDt = ifRegDt;
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




}
