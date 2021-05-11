package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDefinedMasterVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 18.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class UserDefinedMasterVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7502257675218661205L;

    private String usrDefReqDocId;
    private String usrDefReqDocNm;
    private String usrDefReqCont;
    private String startDt;
    private String endDt;
    private String tempYn;
    private String docRefYn;
    private String delYn;
    private String usrNm;

    /**
     * @return the usrDefReqDocId
     */
    public String getUsrDefReqDocId() {
        return usrDefReqDocId;
    }
    /**
     * @param usrDefReqDocId the usrDefReqDocId to set
     */
    public void setUsrDefReqDocId(String usrDefReqDocId) {
        this.usrDefReqDocId = usrDefReqDocId;
    }
    /**
     * @return the usrDefReqDocNm
     */
    public String getUsrDefReqDocNm() {
        return usrDefReqDocNm;
    }
    /**
     * @param usrDefReqDocNm the usrDefReqDocNm to set
     */
    public void setUsrDefReqDocNm(String usrDefReqDocNm) {
        this.usrDefReqDocNm = usrDefReqDocNm;
    }
    /**
     * @return the usrDefReqCont
     */
    public String getUsrDefReqCont() {
        return usrDefReqCont;
    }
    /**
     * @param usrDefReqCont the usrDefReqCont to set
     */
    public void setUsrDefReqCont(String usrDefReqCont) {
        this.usrDefReqCont = usrDefReqCont;
    }
    /**
     * @return the startDt
     */
    public String getStartDt() {
        return startDt;
    }
    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(String startDt) {
        this.startDt = startDt;
    }
    /**
     * @return the endDt
     */
    public String getEndDt() {
        return endDt;
    }
    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(String endDt) {
        this.endDt = endDt;
    }
    /**
     * @return the tempYn
     */
    public String getTempYn() {
        return tempYn;
    }
    /**
     * @param tempYn the tempYn to set
     */
    public void setTempYn(String tempYn) {
        this.tempYn = tempYn;
    }
    /**
     * @return the docRefYn
     */
    public String getDocRefYn() {
        return docRefYn;
    }
    /**
     * @param docRefYn the docRefYn to set
     */
    public void setDocRefYn(String docRefYn) {
        this.docRefYn = docRefYn;
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
    /**
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }
    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }
}