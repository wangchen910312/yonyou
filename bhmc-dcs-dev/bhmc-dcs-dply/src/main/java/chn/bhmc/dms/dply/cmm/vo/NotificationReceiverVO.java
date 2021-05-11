package chn.bhmc.dms.dply.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationReceiverVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NotificationReceiverVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8021593415165384802L;


    /**
     * 일련번호
     **/
    private int    seq             ;

    /**
     * 이메일명
     **/
    private String emailNm         ;

    /**
     * 휴대폰번호
     **/
    private String hpNo            ;

    /**
     * DEPLOY공지여부
     **/
    private String deployNotiYn    ;

    /**
     * 시스템공지여부
     **/
    private String systemNotiYn    ;

    /**
     * 삭제여부
     **/
    private String delYn           ;

    /**
     * 등록자ID
     **/
    private String regUsrId        ;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   regDt           ;

    /**
     * 수정자ID
     **/
    private String updtUsrId       ;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   updtDt          ;

    /**
     * 이메일공지여부
     **/
    private String emailNotiYn     ;

    /**
     * 휴대폰공지여부
     **/
    private String hpNotiYn        ;

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param emailNm the emailNm to set
     */
    public void setEmailNm(String emailNm) {
        this.emailNm = emailNm;
    }

    /**
     * @return the emailNm
     */
    public String getEmailNm() {
        return emailNm;
    }

    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }

    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }

    /**
     * @param deployNotiYn the deployNotiYn to set
     */
    public void setDeployNotiYn(String deployNotiYn) {
        this.deployNotiYn = deployNotiYn;
    }

    /**
     * @return the deployNotiYn
     */
    public String getDeployNotiYn() {
        return deployNotiYn;
    }

    /**
     * @param systemNotiYn the systemNotiYn to set
     */
    public void setSystemNotiYn(String systemNotiYn) {
        this.systemNotiYn = systemNotiYn;
    }

    /**
     * @return the systemNotiYn
     */
    public String getSystemNotiYn() {
        return systemNotiYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }


    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param emailNotiYn the emailNotiYn to set
     */
    public void setEmailNotiYn(String emailNotiYn) {
        this.emailNotiYn = emailNotiYn;
    }

    /**
     * @return the emailNotiYn
     */
    public String getEmailNotiYn() {
        return emailNotiYn;
    }

    /**
     * @param hpNotiYn the hpNotiYn to set
     */
    public void setHpNotiYn(String hpNotiYn) {
        this.hpNotiYn = hpNotiYn;
    }

    /**
     * @return the hpNotiYn
     */
    public String getHpNotiYn() {
        return hpNotiYn;
    }


}
