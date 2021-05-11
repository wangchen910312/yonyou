package chn.bhmc.dms.core.datatype;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BaseVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.     Kang Seok Han     최초 생성
 * </pre>
 */

public class BaseVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6900960005159899721L;

    /**
     * 로우 번호
     */
    private int rnum;

    /**
     * 등록자 아이디
     */
    private String regUsrId;

    /**
     * 등록일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 수정자 아이디
     */
    private String updtUsrId;

    /**
     * 수정일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    /**
     * @return the rnum
     */
    public int getRnum() {
        return rnum;
    }

    /**
     * @param rnum the rnum to set
     */
    public void setRnum(int rnum) {
        this.rnum = rnum;
    }

    /**
     * 등록자 아이디를 리턴한다.
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * 등록자 아이디를 설정한다.
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * 등록일자를 리턴한다.
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * 등록일자를 설정한다.
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * 수정자 아이디를 리턴한다.
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * 수정자 아이디를 설정한다.
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * 수정일자를 리턴한다.
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * 수정일자를 설정한다.
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

}
