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
 * @ClassName   : JobScheduleExecHistVO.java
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

public class JobScheduleExecHistVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1134893576845289547L;


    /**
     * 스케줄명
     **/
    private String scheduleNm        ;

    /**
     * 이벤트일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   eventDt           ;

    /**
     * 일련번호
     **/
    private int    seq               ;

    /**
     * 완료상태메세지내용
     **/
    private String endStatMesgCont   ;

    /**
     * 태스크ID
     **/
    private String taskId            ;

    /**
     * 시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   startDt           ;

    /**
     * 종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   endDt             ;

    /**
     * 등록자ID
     **/
    private String regUsrId          ;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   regDt             ;

    /**
     * 수정자ID
     **/
    private String updtUsrId         ;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   updtDt            ;

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
     * @param eventDt the eventDt to set
     */
    public void setEventDt(Date eventDt) {
        this.eventDt = eventDt;
    }

    /**
     * @return the eventDt
     */
    public Date getEventDt() {
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
     * @param endStatMesgCont the endStatMesgCont to set
     */
    public void setEndStatMesgCont(String endStatMesgCont) {
        this.endStatMesgCont = endStatMesgCont;
    }

    /**
     * @return the endStatMesgCont
     */
    public String getEndStatMesgCont() {
        return endStatMesgCont;
    }

    /**
     * @param taskId the taskId to set
     */
    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    /**
     * @return the taskId
     */
    public String getTaskId() {
        return taskId;
    }

    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(Date startDt) {
        this.startDt = startDt;
    }

    /**
     * @return the startDt
     */
    public Date getStartDt() {
        return startDt;
    }

    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(Date endDt) {
        this.endDt = endDt;
    }

    /**
     * @return the endDt
     */
    public Date getEndDt() {
        return endDt;
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
