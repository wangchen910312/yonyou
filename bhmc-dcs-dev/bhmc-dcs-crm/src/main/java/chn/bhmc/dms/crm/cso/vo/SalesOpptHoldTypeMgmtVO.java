package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * 판매기회프로세스  VO
 *
 * @ClassName   : SalesOpptHoldTypeMgmtVO.java
 * @Description : SalesOpptHoldTypeMgmtVO
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


public class SalesOpptHoldTypeMgmtVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2370497889286958323L;

       /**
        * 딜러코드
        **/
       private  String         dlrCd;

       /**
        * 확보일련번호
        **/
       private  int            holdSeq;

       /**
        * 확보유형(CRM008)
        **/
       //HOLD_TP
       private  String         holdTp;

       /**
        * 확보상세유형명
        **/
       //HOLD_DETL_TP_NM
       private  String         holdDetlTpNm;

       /**
        * 비고
        **/
       //REMARK
       private  String         remark;

       /**
        * 정렬순서
        **/
       //SORT_ORDER
       private  int            sortOrder;

       /**
        * 삭제여부
        **/
       private  String         delYn;

       /**
        * 등록자ID
        **/
       private  String         regUsrId;

       /**
        * 등록일자
        **/
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date           regDt;

       /**
        * 수정자ID
        **/
       //UPDT_USR_ID

       private  String         updtUsrId;

       /**
        * 수정일자
        **/
       //UPDT_DT
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date           updtDt;

       /**
        * 시작일자
        **/
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date           startDt;

       /**
        * 종료일자
        **/
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date           endDt;

       private  String         siebelHoldRowId;

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
     * @return the holdSeq
     */
    public int getHoldSeq() {
        return holdSeq;
    }

    /**
     * @param holdSeq the holdSeq to set
     */
    public void setHoldSeq(int holdSeq) {
        this.holdSeq = holdSeq;
    }

    /**
     * @return the holdTp
     */
    public String getHoldTp() {
        return holdTp;
    }

    /**
     * @param holdTp the holdTp to set
     */
    public void setHoldTp(String holdTp) {
        this.holdTp = holdTp;
    }

    /**
     * @return the holdDetlTpNm
     */
    public String getHoldDetlTpNm() {
        return holdDetlTpNm;
    }

    /**
     * @param holdDetlTpNm the holdDetlTpNm to set
     */
    public void setHoldDetlTpNm(String holdDetlTpNm) {
        this.holdDetlTpNm = holdDetlTpNm;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the sortOrder
     */
    public int getSortOrder() {
        return sortOrder;
    }

    /**
     * @param sortOrder the sortOrder to set
     */
    public void setSortOrder(int sortOrder) {
        this.sortOrder = sortOrder;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
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
     * @return the startDt
     */
    public Date getStartDt() {
        return startDt;
    }

    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(Date startDt) {
        this.startDt = startDt;
    }

    /**
     * @return the endDt
     */
    public Date getEndDt() {
        return endDt;
    }

    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(Date endDt) {
        this.endDt = endDt;
    }

    /**
     * @return the siebelHoldRowId
     */
    public String getSiebelHoldRowId() {
        return siebelHoldRowId;
    }

    /**
     * @param siebelHoldRowId the siebelHoldRowId to set
     */
    public void setSiebelHoldRowId(String siebelHoldRowId) {
        this.siebelHoldRowId = siebelHoldRowId;
    }

}