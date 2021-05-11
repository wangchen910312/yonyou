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
 * @ClassName   : MessageTemplateVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 4. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 28.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class SyncMessageTemplateVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2661996186994730548L;

    /**
     * 메세지코드
     **/
    private String mesgCd       ;

    /**
     * 메세지그룹코드
     **/
    private String mesgGrpCd    ;

    /**
     * 메세지명
     **/
    private String mesgNm      ;

    /**
     * 메세지바디내용
     **/
    private String mesgBodyCont ;

    /**
     * 삭제여부
     **/
    private String delYn        ;

    /**
     * 등록자ID
     **/
    private String regUsrId     ;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   regDt        ;

    /**
     * 수정자ID
     **/
    private String updtUsrId    ;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   updtDt       ;

    /**
     * @param mesgCd the mesgCd to set
     */
    public void setMesgCd(String mesgCd) {
        this.mesgCd = mesgCd;
    }

    /**
     * @return the mesgCd
     */
    public String getMesgCd() {
        return mesgCd;
    }

    /**
     * @param mesgGrpCd the mesgGrpCd to set
     */
    public void setMesgGrpCd(String mesgGrpCd) {
        this.mesgGrpCd = mesgGrpCd;
    }

    /**
     * @return the mesgGrpCd
     */
    public String getMesgGrpCd() {
        return mesgGrpCd;
    }

    /**
     * @param mesg_nm the mesgNm to set
     */
    public void setMesgnm(String mesgNm) {
        this.mesgNm = mesgNm;
    }

    /**
     * @return the mesgNm
     */
    public String getMesgNm() {
        return mesgNm;
    }

    /**
     * @param mesgBodyCont the mesgBodyCont to set
     */
    public void setMesgBodyCont(String mesgBodyCont) {
        this.mesgBodyCont = mesgBodyCont;
    }

    /**
     * @return the mesgBodyCont
     */
    public String getMesgBodyCont() {
        return mesgBodyCont;
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
