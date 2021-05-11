package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * 판매기회실패브랜드  VO
 *
 * @ClassName   : SalesOpptFailBrandMgmtVO.java
 * @Description : SalesOpptFailBrandMgmtVO
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07     kyo jin lee      Created First
 * </pre>
 */


public class SalesOpptFailOtherBrandMgmtVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3733267587634393426L;

    /**
    * 일련번호
    **/
    private  int                   seq;

    /**
    * 선호차종코드
    **/
    //INTR_CARLINE_CD
    private  String                intrCarlineCd;
    private  String                intrCarlineNm;

    /**
    * 타브랜드차량명
    **/
    //OTHER_BRAND_CARLINE_NM
    private  String                otherBrandCarlineNm;

    /**
    * 사용여부
    **/
    private  String                useYn;

    /**
    * 등록자ID
    **/
    private  String                regUsrId;

    /**
    * 등록일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  regDt;

    /**
    * 수정자ID
    **/
    //UPDT_USR_ID
    private  String                updtUsrId;

    /**
    * 수정일자
    **/
    //UPDT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  updtDt;

    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the intrCarlineCd
     */
    public String getIntrCarlineCd() {
        return intrCarlineCd;
    }

    /**
     * @param intrCarlineCd the intrCarlineCd to set
     */
    public void setIntrCarlineCd(String intrCarlineCd) {
        this.intrCarlineCd = intrCarlineCd;
    }

    /**
     * @return the otherBrandCarlineNm
     */
    public String getOtherBrandCarlineNm() {
        return otherBrandCarlineNm;
    }

    /**
     * @param otherBrandCarlineNm the otherBrandCarlineNm to set
     */
    public void setOtherBrandCarlineNm(String otherBrandCarlineNm) {
        this.otherBrandCarlineNm = otherBrandCarlineNm;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
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
     * @return the intrCarlineNm
     */
    public String getIntrCarlineNm() {
        return intrCarlineNm;
    }

    /**
     * @param intrCarlineNm the intrCarlineNm to set
     */
    public void setIntrCarlineNm(String intrCarlineNm) {
        this.intrCarlineNm = intrCarlineNm;
    }




}