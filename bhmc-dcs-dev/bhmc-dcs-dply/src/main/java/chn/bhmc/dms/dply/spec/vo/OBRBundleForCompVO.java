package chn.bhmc.dms.dply.spec.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OBRBundleForCompVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 6. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 2.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class OBRBundleForCompVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3314330584997507529L;

    private String stdDt        ;

    private String symbolicNm   ;

    private String bundleVerNo  ;

    private String bundleCont   ;

    private String regUsrId     ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   regDt        ;

    private String updtUsrId    ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   updtDt       ;

    /**
     * @param stdDt the stdDt to set
     */
    public void setStdDt(String stdDt) {
        this.stdDt = stdDt;
    }

    /**
     * @return the stdDt
     */
    public String getStdDt() {
        return stdDt;
    }

    /**
     * @param symbolicNm the symbolicNm to set
     */
    public void setSymbolicNm(String symbolicNm) {
        this.symbolicNm = symbolicNm;
    }

    /**
     * @return the symbolicNm
     */
    public String getSymbolicNm() {
        return symbolicNm;
    }

    /**
     * @param bundleVerNo the bundleVerNo to set
     */
    public void setBundleVerNo(String bundleVerNo) {
        this.bundleVerNo = bundleVerNo;
    }

    /**
     * @return the bundleVerNo
     */
    public String getBundleVerNo() {
        return bundleVerNo;
    }

    /**
     * @param bundleCont the bundleCont to set
     */
    public void setBundleCont(String bundleCont) {
        this.bundleCont = bundleCont;
    }

    /**
     * @return the bundleCont
     */
    public String getBundleCont() {
        return bundleCont;
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
