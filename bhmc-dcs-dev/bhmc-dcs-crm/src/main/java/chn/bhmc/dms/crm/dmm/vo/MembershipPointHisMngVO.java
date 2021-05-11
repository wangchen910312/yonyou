package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipPointHisMngVO.java
 * @Description : 포인트 소멸 이력 VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 28.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"        , mesgKey="crm.lbl.dlrCd")
    ,@ValidField(field="extcSeq"      , mesgKey="crm.lbl.extcSeq")
    ,@ValidField(field="pointExtcDt"  , mesgKey="crm.lbl.pointExtcDt")
    ,@ValidField(field="membershipNo" , mesgKey="crm.lbl.membershipNo")
    ,@ValidField(field="extcPointVal" , mesgKey="crm.lbl.extcPointVal")
    ,@ValidField(field="rmnPointVal"  , mesgKey="crm.lbl.rmnPointVal")
    ,@ValidField(field="regUsrId"     , mesgKey="crm.lbl.regUsrId")
    ,@ValidField(field="regDt"        , mesgKey="crm.lbl.regDt")
    ,@ValidField(field="updtUsrId"    , mesgKey="crm.lbl.updtUsrId")
    ,@ValidField(field="updtDt"       , mesgKey="crm.lbl.updtDt")
    })
public class MembershipPointHisMngVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6295987089311218781L;

    /**
     * 딜러코드
     **/
     private  String        dlrCd;

     /**
     * 소멸일련번호
     **/
     private  int           extcSeq;

     /**
     * 포인트소멸일자
     **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private  Date          pointExtcDt;

     /**
     * 멤버쉽번호
     **/
     private  String        membershipNo;

     /**
     * 소멸포인트값
     **/
     private  int           extcPointVal;
     /**
     * 잔여포인트값
     **/
     private  int           rmnPointVal;

     /*
      * 추가
      */
     private int pointExtUsrCnt;
     private String pointExtcDtStr;
     private String custNm;
     private String custNo;


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
      * @return the extcSeq
      */
     public int getExtcSeq() {
         return extcSeq;
     }
     /**
      * @param extcSeq the extcSeq to set
      */
     public void setExtcSeq(int extcSeq) {
         this.extcSeq = extcSeq;
     }
     /**
      * @return the pointExtcDt
      */
     public Date getPointExtcDt() {
         return pointExtcDt;
     }
     /**
      * @param pointExtcDt the pointExtcDt to set
      */
     public void setPointExtcDt(Date pointExtcDt) {
         this.pointExtcDt = pointExtcDt;
     }
     /**
      * @return the membershipNo
      */
     public String getMembershipNo() {
         return membershipNo;
     }
     /**
      * @param membershipNo the membershipNo to set
      */
     public void setMembershipNo(String membershipNo) {
         this.membershipNo = membershipNo;
     }
     /**
      * @return the extcPointVal
      */
     public int getExtcPointVal() {
         return extcPointVal;
     }
     /**
      * @param extcPointVal the extcPointVal to set
      */
     public void setExtcPointVal(int extcPointVal) {
         this.extcPointVal = extcPointVal;
     }
     /**
      * @return the rmnPointVal
      */
     public int getRmnPointVal() {
         return rmnPointVal;
     }
     /**
      * @param rmnPointVal the rmnPointVal to set
      */
     public void setRmnPointVal(int rmnPointVal) {
         this.rmnPointVal = rmnPointVal;


     }

     /**
     * @return the pointExtUsrCnt
     */
    public int getPointExtUsrCnt() {
        return pointExtUsrCnt;
    }
    /**
     * @param pointExtUsrCnt the pointExtUsrCnt to set
     */
    public void setPointExtUsrCnt(int pointExtUsrCnt) {
        this.pointExtUsrCnt = pointExtUsrCnt;
    }


    /**
     * @return the pointExtcDtStr
     */
    public String getPointExtcDtStr() {
        return pointExtcDtStr;
    }
    /**
     * @param pointExtcDtStr the pointExtcDtStr to set
     */
    public void setPointExtcDtStr(String pointExtcDtStr) {
        this.pointExtcDtStr = pointExtcDtStr;
    }

    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }
    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }
    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }
    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }
    /*
      * @see java.lang.Object#toString()
      */
     @Override
     public String toString() {
         return ReflectionToStringBuilder.toString(this);
     }

}
