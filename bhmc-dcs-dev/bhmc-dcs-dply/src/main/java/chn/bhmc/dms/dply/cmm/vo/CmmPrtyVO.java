package chn.bhmc.dms.dply.cmm.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CmmPrty.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class CmmPrtyVO extends BaseVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8409977830712731667L;


    /**
     * PROPERTY명
     **/
    private String prtyNm      ;

    /**
     * PROPERTY내용
     **/
    private String prtyCont    ;

    /**
     * PROPERTY내용
     **/
    private String prtyVal    ;

    /**
     * 등록자ID
     **/
    private String regUsrId    ;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt         ;

    /**
     * 수정자ID
     **/
    private String updtUsrId   ;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt        ;


    private String prtyContZh;

    private String prtyType;

    /**
     * @param prtyNm the prtyNm to set
     */
    public void setPrtyNm(String prtyNm) {
        this.prtyNm = prtyNm;
    }

    /**
     * @return the prtyNm
     */
    public String getPrtyNm() {
        return prtyNm;
    }

    /**
     * @param prtyCont the prtyCont to set
     */
    public void setPrtyCont(String prtyCont) {
        this.prtyCont = prtyCont;
    }

    /**
     * @return the prtyCont
     */
    public String getPrtyCont() {
        return prtyCont;
    }

    /**
     * @param prtyVal the prtyVal to set
     */
    public void setPrtyVal(String prtyVal) {
        this.prtyVal = prtyVal;
    }

    /**
     * @return the prtyVal
     */
    public String getPrtyVal() {
        return prtyVal;
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
     * @param prtyContZh the prtyContZh to set
     */
    public void setPrtyContZh(String prtyContZh) {
        this.prtyContZh = prtyContZh;
    }

    /**
     * @return the prtyContZh
     */
    public String getPrtyContZh() {
        return prtyContZh;
    }

    /**
     * @param prtyType the prtyType to set
     */
    public void setPrtyType(String prtyType) {
        this.prtyType = prtyType;
    }

    /**
     * @return the prtyType
     */
    public String getPrtyType() {
        return prtyType;
    }


}
