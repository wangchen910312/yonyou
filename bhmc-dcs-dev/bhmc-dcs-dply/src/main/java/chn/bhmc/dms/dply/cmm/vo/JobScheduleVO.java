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
 * @ClassName   : StorageVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kang Seok Han     최초 생성
 * </pre>
 */

public class JobScheduleVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 9078273773835296568L;

    /**
     * 스케줄명
     **/
    private String scheduleNm        ;

    /**
     * 스케줄유형코드
     **/
    private String scheduleTpCd      ;

    /**
     * CRONTAB패턴내용
     **/
    private String crontabPattCont   ;

    /**
     * 스케줄시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   scheduleStartDt   ;

    /**
     * 실행명령어명
     **/
    private String execCmdNm         ;

    /**
     * 삭제여부
     **/
    private String delYn             ;

    /**
     * 등록자ID
     **/
    private String regUsrId          ;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt               ;

    /**
     * 수정자ID
     **/
    private String updtUsrId         ;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt              ;

    /**
     * @param scheduleNm the scheduleNm to set
     */
    public void setScheduleNm(String scheduleNm) {
        this.scheduleNm = scheduleNm;
    }

    /**
     * @return the scheduleNm
     */
    public String getScheduleNm() {
        return scheduleNm;
    }

    /**
     * @param scheduleTpCd the scheduleTpCd to set
     */
    public void setScheduleTpCd(String scheduleTpCd) {
        this.scheduleTpCd = scheduleTpCd;
    }

    /**
     * @return the scheduleTpCd
     */
    public String getScheduleTpCd() {
        return scheduleTpCd;
    }

    /**
     * @param crontabPattCont the crontabPattCont to set
     */
    public void setCrontabPattCont(String crontabPattCont) {
        this.crontabPattCont = crontabPattCont;
    }

    /**
     * @return the crontabPattCont
     */
    public String getCrontabPattCont() {
        return crontabPattCont;
    }

    /**
     * @param scheduleStartDt the scheduleStartDt to set
     */
    public void setScheduleStartDt(Date scheduleStartDt) {
        this.scheduleStartDt = scheduleStartDt;
    }

    /**
     * @return the scheduleStartDt
     */
    public Date getScheduleStartDt() {
        return scheduleStartDt;
    }

    /**
     * @param execCmdNm the execCmdNm to set
     */
    public void setExecCmdNm(String execCmdNm) {
        this.execCmdNm = execCmdNm;
    }

    /**
     * @return the execCmdNm
     */
    public String getExecCmdNm() {
        return execCmdNm;
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


}
