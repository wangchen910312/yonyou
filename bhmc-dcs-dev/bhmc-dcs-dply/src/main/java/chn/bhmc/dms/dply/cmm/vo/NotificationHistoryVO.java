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
 * @ClassName   : NotificationHistoryVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 26.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NotificationHistoryVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5340258489302037315L;


    /**
     * 이벤트일자
     **/
    private String eventDt                ;

    /**
     * 일련번호
     **/
    private int    seq                    ;

    /**
     * 공지유형
     **/
    private String notiTp                 ;

    /**
     * 이메일명
     **/
    private String emailNm                ;

    /**
     * 휴대폰번호
     **/
    private String hpNo                   ;

    /**
     * 공지메세지바디내용
     **/
    private String notiMesgBodyCont       ;

    /**
     * 번들명
     **/
    private String bundleNm               ;

    /**
     * 등록자ID
     **/
    private String regUsrId               ;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   regDt                  ;

    /**
     * 수정자ID
     **/
    private String updtUsrId              ;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   updtDt                 ;

    /**
     * @param eventDt the eventDt to set
     */
    public void setEventDt(String eventDt) {
        this.eventDt = eventDt;
    }

    /**
     * @return the eventDt
     */
    public String getEventDt() {
        return eventDt;
    }

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
     * @param notiTp the notiTp to set
     */
    public void setNotiTp(String notiTp) {
        this.notiTp = notiTp;
    }

    /**
     * @return the notiTp
     */
    public String getNotiTp() {
        return notiTp;
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
     * @param notiMesgBodyCont the notiMesgBodyCont to set
     */
    public void setNotiMesgBodyCont(String notiMesgBodyCont) {
        this.notiMesgBodyCont = notiMesgBodyCont;
    }

    /**
     * @return the notiMesgBodyCont
     */
    public String getNotiMesgBodyCont() {
        return notiMesgBodyCont;
    }

    /**
     * @param bundleNm the bundleNm to set
     */
    public void setBundleNm(String bundleNm) {
        this.bundleNm = bundleNm;
    }

    /**
     * @return the bundleNm
     */
    public String getBundleNm() {
        return bundleNm;
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



}
