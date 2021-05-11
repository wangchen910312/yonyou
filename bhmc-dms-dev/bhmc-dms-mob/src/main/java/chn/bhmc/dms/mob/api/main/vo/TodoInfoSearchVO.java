package chn.bhmc.dms.mob.api.main.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TodoInfoSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

public class TodoInfoSearchVO extends BaseSearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 571424040290220502L;

    /**
     * To-do 수신자 ID
     */
    private String sUsrId;

    /**
     * 액션타켓 구분
     * '01' 웹/모바일
     * '02' 웹
     * '03' 모바일
     */
    private String sActionTargetTp;

    /**
     * 처리여부
     */
    private String sHndlYn;

    /**
     * 처리자 ID
     */
    private String sHndlUsrId;

    /**
     * 처리일자 - 조회시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartHndlDt;

    /**
     * 처리일자 - 조회종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndHndlDt;

    /**
     * 확인여부
     */
    private String sOpenYn;

    /**
     * 확인자 ID
     */
    private String sOpenUsrId;

    /**
     * 확인일자 - 조회시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartOpenDt;

    /**
     * 확인일자 - 조회종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndOpenDt;

    /**
     * 등록일자 - 조회시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartRegDt;

    /**
     * 등록일자 - 조회종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndRegDt;

    /**
     * @return the sUsrId
     */
    public String getsUsrId() {
        return sUsrId;
    }

    /**
     * @param sUsrId the sUsrId to set
     */
    public void setsUsrId(String sUsrId) {
        this.sUsrId = sUsrId;
    }

    /**
     * @return the sActionTargetTp
     */
    public String getsActionTargetTp() {
        return sActionTargetTp;
    }

    /**
     * @param sActionTargetTp the sActionTargetTp to set
     */
    public void setsActionTargetTp(String sActionTargetTp) {
        this.sActionTargetTp = sActionTargetTp;
    }

    /**
     * @return the sHndlYn
     */
    public String getsHndlYn() {
        return sHndlYn;
    }

    /**
     * @param sHndlYn the sHndlYn to set
     */
    public void setsHndlYn(String sHndlYn) {
        this.sHndlYn = sHndlYn;
    }

    /**
     * @return the sHndlUsrId
     */
    public String getsHndlUsrId() {
        return sHndlUsrId;
    }

    /**
     * @param sHndlUsrId the sHndlUsrId to set
     */
    public void setsHndlUsrId(String sHndlUsrId) {
        this.sHndlUsrId = sHndlUsrId;
    }

    /**
     * @return the sStartHndlDt
     */
    public Date getsStartHndlDt() {
        return sStartHndlDt;
    }

    /**
     * @param sStartHndlDt the sStartHndlDt to set
     */
    public void setsStartHndlDt(Date sStartHndlDt) {
        this.sStartHndlDt = sStartHndlDt;
    }

    /**
     * @return the sEndHndlDt
     */
    public Date getsEndHndlDt() {
        return sEndHndlDt;
    }

    /**
     * @param sEndHndlDt the sEndHndlDt to set
     */
    public void setsEndHndlDt(Date sEndHndlDt) {
        this.sEndHndlDt = sEndHndlDt;
    }

    /**
     * @return the sOpenYn
     */
    public String getsOpenYn() {
        return sOpenYn;
    }

    /**
     * @param sOpenYn the sOpenYn to set
     */
    public void setsOpenYn(String sOpenYn) {
        this.sOpenYn = sOpenYn;
    }

    /**
     * @return the sOpenUsrId
     */
    public String getsOpenUsrId() {
        return sOpenUsrId;
    }

    /**
     * @param sOpenUsrId the sOpenUsrId to set
     */
    public void setsOpenUsrId(String sOpenUsrId) {
        this.sOpenUsrId = sOpenUsrId;
    }

    /**
     * @return the sStartOpenDt
     */
    public Date getsStartOpenDt() {
        return sStartOpenDt;
    }

    /**
     * @param sStartOpenDt the sStartOpenDt to set
     */
    public void setsStartOpenDt(Date sStartOpenDt) {
        this.sStartOpenDt = sStartOpenDt;
    }

    /**
     * @return the sEndOpenDt
     */
    public Date getsEndOpenDt() {
        return sEndOpenDt;
    }

    /**
     * @param sEndOpenDt the sEndOpenDt to set
     */
    public void setsEndOpenDt(Date sEndOpenDt) {
        this.sEndOpenDt = sEndOpenDt;
    }

    /**
     * @return the sStartRegDt
     */
    public Date getsStartRegDt() {
        return sStartRegDt;
    }

    /**
     * @param sStartRegDt the sStartRegDt to set
     */
    public void setsStartRegDt(Date sStartRegDt) {
        this.sStartRegDt = sStartRegDt;
    }

    /**
     * @return the sEndRegDt
     */
    public Date getsEndRegDt() {
        return sEndRegDt;
    }

    /**
     * @param sEndRegDt the sEndRegDt to set
     */
    public void setsEndRegDt(Date sEndRegDt) {
        this.sEndRegDt = sEndRegDt;
    }

}
