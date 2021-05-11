package chn.bhmc.dms.crm.css.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionManageVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 03. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 11.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class SatisFactionResultMgmtVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7932763486175481280L;

       /**
        * 일련번호
        **/
       private  String     seq;

       /**
        * 제목명
        **/
       //TITLE_NM

       private  String     titleNm;

       /**
        * 배포일자
        **/
       //DIST_DT
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date       distDt;


       /**
        * 배포여부
        **/
       private  String     distYn;

       /**
        * 출력여부
        **/
       private  String     displayYn;

       /**
        * 등록자ID
        **/
       private  String     regUsrId;
       private  String     regUsrNm;

       /**
        * 등록일자
        **/
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date       regDt;

       /**
        * 수정자ID
        **/
       //UPDT_USR_ID
       private  String     updtUsrId;

       /**
        * 수정일자
        **/
       //UPDT_DT
       //@JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date       updtDt;

       /**
        * 딜러코드
        **/
       //DLR_CD
       private  String     dlrCd;

    /**
     * @return the seq
     */
    public String getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(String seq) {
        this.seq = seq;
    }

    /**
     * @return the titleNm
     */
    public String getTitleNm() {
        return titleNm;
    }

    /**
     * @param titleNm the titleNm to set
     */
    public void setTitleNm(String titleNm) {
        this.titleNm = titleNm;
    }

    /**
     * @return the distDt
     */
    public Date getDistDt() {
        return distDt;
    }

    /**
     * @param distDt the distDt to set
     */
    public void setDistDt(Date distDt) {
        this.distDt = distDt;
    }

    /**
     * @return the displayYn
     */
    public String getDisplayYn() {
        return displayYn;
    }

    /**
     * @param displayYn the displayYn to set
     */
    public void setDisplayYn(String displayYn) {
        this.displayYn = displayYn;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }

    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    /**
     * @return the distYn
     */
    public String getDistYn() {
        return distYn;
    }

    /**
     * @param distYn the distYn to set
     */
    public void setDistYn(String distYn) {
        this.distYn = distYn;
    }



}
