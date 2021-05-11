package chn.bhmc.dms.sal.dlr.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeliveryVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 5. 25
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kim yewon             최초 생성
 *
 * </pre>
 */

public class DistDealerVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    //@JsonDeserialize(using=JsonDateDeserializer.class)

    private String usrId;                   //사무소코드
    private String usrNm;                   //사무소명
    private String dutyCd;                  //직무(담당업무)
    private String dlrCd;                   //딜러코드
    private String dlrNm;                   //딜러명
    private String mngDlrCd;                //관리딜러코드
    private String chkYn;                   //체크여부
    private String psitCd;                  //직무



    /**
     * @return the psitCd
     */
    public String getPsitCd() {
        return psitCd;
    }
    /**
     * @param psitCd the psitCd to set
     */
    public void setPsitCd(String psitCd) {
        this.psitCd = psitCd;
    }
    /**
     * @return the mngDlrCd
     */
    public String getMngDlrCd() {
        return mngDlrCd;
    }
    /**
     * @param mngDlrCd the mngDlrCd to set
     */
    public void setMngDlrCd(String mngDlrCd) {
        this.mngDlrCd = mngDlrCd;
    }
    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }
    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }
    /**
     * @return the chkYn
     */
    public String getChkYn() {
        return chkYn;
    }
    /**
     * @param chkYn the chkYn to set
     */
    public void setChkYn(String chkYn) {
        this.chkYn = chkYn;
    }
    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }
    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
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
    /**
     * @return the dutyCd
     */
    public String getDutyCd() {
        return dutyCd;
    }
    /**
     * @param dutyCd the dutyCd to set
     */
    public void setDutyCd(String dutyCd) {
        this.dutyCd = dutyCd;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}
