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
 * @ClassName   : SpecBasicVO.java
 * @Description : SPEC 기본정보 조회 VO
 * @author Kang Seok Han
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SpecBasicVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 820152347702467701L;

    /**
     * SPEC코드
     **/
    private String specCd     ;

    /**
     * SPEC유형
     **/
    private String specTp     ;

    /**
     * SPEC명
     **/
    private String specNm     ;

    /**
     * SPEC내용
     **/
    private String specCont   ;

    /**
     * 등록자ID
     **/
    private String regUsrId  ;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   regDt      ;

    /**
     * 수정자ID
     **/
    private String updtUsrId ;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   updtDt     ;


    /**
     * 복제할 SPEC코드
     **/
    private String srcSpecCd     ;

    private String sServiceYN    ;

    private String sRepositoryYN ;

    private String sCommandYN    ;

    private String sSqlYN        ;

    private String sPropertyYN   ;

    private String sFileYN       ;




    /**
     * @param specCd the specCd to set
     */
    public void setSpecCd(String specCd) {
        this.specCd = specCd;
    }

    /**
     * @return the specCd
     */
    public String getSpecCd() {
        return specCd;
    }

    /**
     * @param specTp the specTp to set
     */
    public void setSpecTp(String specTp) {
        this.specTp = specTp;
    }

    /**
     * @return the specTp
     */
    public String getSpecTp() {
        return specTp;
    }

    /**
     * @param specNm the specNm to set
     */
    public void setSpecNm(String specNm) {
        this.specNm = specNm;
    }

    /**
     * @return the specNm
     */
    public String getSpecNm() {
        return specNm;
    }

    /**
     * @param specCont the specCont to set
     */
    public void setSpecCont(String specCont) {
        this.specCont = specCont;
    }

    /**
     * @return the specCont
     */
    public String getSpecCont() {
        return specCont;
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
     * @param srcSpecCd the srcSpecCd to set
     */
    public void setSrcSpecCd(String srcSpecCd) {
        this.srcSpecCd = srcSpecCd;
    }

    /**
     * @return the srcSpecCd
     */
    public String getSrcSpecCd() {
        return srcSpecCd;
    }

    /**
     * @param sServiceYN the sServiceYN to set
     */
    public void setsServiceYN(String sServiceYN) {
        this.sServiceYN = sServiceYN;
    }

    /**
     * @return the sServiceYN
     */
    public String getsServiceYN() {
        return sServiceYN;
    }

    /**
     * @param sRepositoryYN the sRepositoryYN to set
     */
    public void setsRepositoryYN(String sRepositoryYN) {
        this.sRepositoryYN = sRepositoryYN;
    }

    /**
     * @return the sRepositoryYN
     */
    public String getsRepositoryYN() {
        return sRepositoryYN;
    }

    /**
     * @param sCommandYN the sCommandYN to set
     */
    public void setsCommandYN(String sCommandYN) {
        this.sCommandYN = sCommandYN;
    }

    /**
     * @return the sCommandYN
     */
    public String getsCommandYN() {
        return sCommandYN;
    }

    /**
     * @param sSqlYN the sSqlYN to set
     */
    public void setsSqlYN(String sSqlYN) {
        this.sSqlYN = sSqlYN;
    }

    /**
     * @return the sSqlYN
     */
    public String getsSqlYN() {
        return sSqlYN;
    }

    /**
     * @param sPropertyYN the sPropertyYN to set
     */
    public void setsPropertyYN(String sPropertyYN) {
        this.sPropertyYN = sPropertyYN;
    }

    /**
     * @return the sPropertyYN
     */
    public String getsPropertyYN() {
        return sPropertyYN;
    }

    /**
     * @param sFileYN the sFileYN to set
     */
    public void setsFileYN(String sFileYN) {
        this.sFileYN = sFileYN;
    }

    /**
     * @return the sFileYN
     */
    public String getsFileYN() {
        return sFileYN;
    }















}
