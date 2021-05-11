package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;

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
 * @ClassName   : MembershipPointHisVO.java
 * @Description : 멤버십 포인트 이력 VO.
 * @author Lee In Moon
 * @since 2016. 4. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 5.     Lee In Moon     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"             , mesgKey="crm.lbl.dlrCd")
    ,@ValidField(field="membershipNo"      , mesgKey="crm.lbl.membershipNo")
    ,@ValidField(field="pointHisSeq"       , mesgKey="crm.lbl.pointHisSeq")
    ,@ValidField(field="membershipTp"      , mesgKey="crm.lbl.membershipTp")
    ,@ValidField(field="cardNo"            , mesgKey="crm.lbl.cardNo")
    ,@ValidField(field="pointCd"           , mesgKey="crm.lbl.pointCd")
    ,@ValidField(field="pointTp"           , mesgKey="crm.lbl.pointTp")
    ,@ValidField(field="occrPointVal"      , mesgKey="crm.lbl.occrPointVal")
    ,@ValidField(field="occrPointCost"     , mesgKey="crm.lbl.occrPointCost")
    ,@ValidField(field="occrDt"            , mesgKey="crm.lbl.occrDt")
    ,@ValidField(field="deptNm"            , mesgKey="crm.lbl.deptNm")
    ,@ValidField(field="prsnId"            , mesgKey="crm.lbl.prsnId")
    ,@ValidField(field="regUsrId"          , mesgKey="crm.lbl.regUsrId")
    ,@ValidField(field="regDt"             , mesgKey="crm.lbl.regDt")
    ,@ValidField(field="updtUsrId"         , mesgKey="crm.lbl.updtUsrId")
    ,@ValidField(field="updtDt"            , mesgKey="crm.lbl.updtDt")
    ,@ValidField(field="extcDt"            , mesgKey="crm.lbl.extcDt")
    ,@ValidField(field="extcTargYn"        , mesgKey="crm.lbl.extcTargYn")
    ,@ValidField(field="extcTargPointVal"  , mesgKey="crm.lbl.extcTargPointVal")
    })

public class MembershipPointHisVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3832684247112116519L;

    /**
    * 딜러코드
    **/
    @NotEmpty
    private  String dlrCd;

    /**
    * 멤버쉽번호
    **/
    @NotEmpty
    private  String membershipNo;

    /**
    * 포인트이력일련번호
    **/

    private  int    pointHisSeq;
    private  int    cancelHisSeq;       // 포인트 이력 취소 번호 ( 취소한 포인트 이력 일련번호를 입력한다 )

    /**
    * 멤버쉽유형
    **/
    private  String membershipTp;

    /**
    * 카드번호
    **/
    private  String cardNo;

    /**
    * 포인트코드
    **/
    private  String pointCd;
    private  String pointCdNm;

    /**
    * 포인트유형
    **/
    private  String pointTp;

    /**
    * 발생포인트값
    **/
    private  Double    occrPointVal;

    /**
     * 발생포인트비용
     **/
    private  Double    occrPointCost;

    /**
    * 발생일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date occrDt;

    /**
    * 부서명
    **/
    //DEPT_NM

    private  String deptNm;

    /**
    * 담당자ID
    **/
    //PRSN_ID

    private  String prsnId;

    /**
     * 최종포인트값
     **/
    //LAST_POINT_VAL

    private  Double lastPointVal;   //20170602 REAL_TOT_AMT 컬럼 용도 변경 ( 수납금액 입력 ) 함에 따라 최종 금액은 LAST_POINT_VAL을 사용한다.

    /**
     * 실제총금액
     **/
    //REAL_TOT_AMT

    private  double realTotAmt;

    private  String prsnNm;

    /**
    * 소멸일자
    **/
    //EXTC_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date   extcDt;

    /**
    * 소멸대상여부
    **/
    @NotEmpty

    private  String extcTargYn;

    /**
    * 소멸대상포인트값
    **/
    //EXTC_TARG_POINT_VAL

    private  Double    extcTargPointVal;
    private  int    employPoint; //사용한 포인트
    private  int    savePoint;//적립포인트
    private  int    usePoint;//가용포인트
    private  String occrPointVal2;//부호포함

    private  int    chargeUsePoint;  // 충전가용포인트

    /**
     * 특별포인트 등록
     **/
    private String reason; //사유
    private String cardTpCd; //카드유형코드

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date   regDt;
    private  String custNo;
    private  String gradeCd;

    private  String membershipPointPeriod; //멤버십 포인트 유효기간
    private  String insertFlag; //충전카드 등록시 flag값에 따라 카드존재여부 확인

    /*
     * 프로시저 return
     */
    private String result;

    /*
     * 타시스템 사용시 필요함
     */
    private Boolean isResult;
    private String resultMsg;


    private String vinNo;   //VIN번호
    private String roDocNo;//RO문서번호
    private String srcSub1;//RO 하위번호 ( 정산 or 수납번호 )
    private String srcSub2;//정산 or 수납 line 번호
    private String srcSub3;//사용금액 출처 ( 포인트 적립 및 취소를 위함 )
    private String contractNo;//계약번호
    private String remark;//포인트 소멸 사유

    private int pointExtUsrCnt;  // 현시점포인트
    private int totalExtcPointVal;  // 현시점포인트
    private int totalRmnPointVal;   // 소멸예상포인트


    private String custNm;
    private String hpNo;
    private String telNo;

    private String useTp;   // 사용출처
    private String useNum;  // 송장번호

    private String pointMaxChk = "Y";

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
     * @return the pointHisSeq
     */
    public int getPointHisSeq() {
        return pointHisSeq;
    }



    /**
     * @param pointHisSeq the pointHisSeq to set
     */
    public void setPointHisSeq(int pointHisSeq) {
        this.pointHisSeq = pointHisSeq;
    }



    /**
     * @return the membershipTp
     */
    public String getMembershipTp() {
        return membershipTp;
    }



    /**
     * @param membershipTp the membershipTp to set
     */
    public void setMembershipTp(String membershipTp) {
        this.membershipTp = membershipTp;
    }



    /**
     * @return the cardNo
     */
    public String getCardNo() {
        return cardNo;
    }



    /**
     * @param cardNo the cardNo to set
     */
    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }



    /**
     * @return the pointCd
     */
    public String getPointCd() {
        return pointCd;
    }



    /**
     * @param pointCd the pointCd to set
     */
    public void setPointCd(String pointCd) {
        this.pointCd = pointCd;
    }



    /**
     * @return the pointTp
     */
    public String getPointTp() {
        return pointTp;
    }



    /**
     * @param pointTp the pointTp to set
     */
    public void setPointTp(String pointTp) {
        this.pointTp = pointTp;
    }



    /**
     * @return the occrPointVal
     */
    public Double getOccrPointVal() {
        return occrPointVal;
    }



    /**
     * @param occrPointVal the occrPointVal to set
     */
    public void setOccrPointVal(Double occrPointVal) {
        this.occrPointVal = occrPointVal;
    }



    /**
     * @return the occrDt
     */
    public Date getOccrDt() {
        return occrDt;
    }



    /**
     * @param occrDt the occrDt to set
     */
    public void setOccrDt(Date occrDt) {
        this.occrDt = occrDt;
    }



    /**
     * @return the deptNm
     */
    public String getDeptNm() {
        return deptNm;
    }



    /**
     * @param deptNm the deptNm to set
     */
    public void setDeptNm(String deptNm) {
        this.deptNm = deptNm;
    }



    /**
     * @return the prsnId
     */
    public String getPrsnId() {
        return prsnId;
    }



    /**
     * @param prsnId the prsnId to set
     */
    public void setPrsnId(String prsnId) {
        this.prsnId = prsnId;
    }



    /**
     * @return the extcDt
     */
    public Date getExtcDt() {
        return extcDt;
    }



    /**
     * @param extcDt the extcDt to set
     */
    public void setExtcDt(Date extcDt) {
        this.extcDt = extcDt;
    }



    /**
     * @return the extcTargYn
     */
    public String getExtcTargYn() {
        return extcTargYn;
    }



    /**
     * @param extcTargYn the extcTargYn to set
     */
    public void setExtcTargYn(String extcTargYn) {
        this.extcTargYn = extcTargYn;
    }



    /**
     * @return the extcTargPointVal
     */
    public Double getExtcTargPointVal() {
        return extcTargPointVal;
    }



    /**
     * @param extcTargPointVal the extcTargPointVal to set
     */
    public void setExtcTargPointVal(Double extcTargPointVal) {
        this.extcTargPointVal = extcTargPointVal;
    }






    /**
     * @return the employPoint
     */
    public int getEmployPoint() {
        return employPoint;
    }



    /**
     * @param employPoint the employPoint to set
     */
    public void setEmployPoint(int employPoint) {
        this.employPoint = employPoint;
    }



    /**
     * @return the savePoint
     */
    public int getSavePoint() {
        return savePoint;
    }



    /**
     * @param savePoint the savePoint to set
     */
    public void setSavePoint(int savePoint) {
        this.savePoint = savePoint;
    }



    /**
     * @return the usePoint
     */
    public int getUsePoint() {
        return usePoint;
    }



    /**
     * @param usePoint the usePoint to set
     */
    public void setUsePoint(int usePoint) {
        this.usePoint = usePoint;
    }



    /**
     * @return the occrPointVal2
     */
    public String getOccrPointVal2() {
        return occrPointVal2;
    }



    /**
     * @param occrPointVal2 the occrPointVal2 to set
     */
    public void setOccrPointVal2(String occrPointVal2) {
        this.occrPointVal2 = occrPointVal2;
    }



    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }



    /**
     * @return the chargeUsePoint
     */
    public int getChargeUsePoint() {
        return chargeUsePoint;
    }



    /**
     * @param chargeUsePoint the chargeUsePoint to set
     */
    public void setChargeUsePoint(int chargeUsePoint) {
        this.chargeUsePoint = chargeUsePoint;
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



    /**
     * @return the gradeCd
     */
    public String getGradeCd() {
        return gradeCd;
    }



    /**
     * @param gradeCd the gradeCd to set
     */
    public void setGradeCd(String gradeCd) {
        this.gradeCd = gradeCd;
    }



    /**
     * @return the reason
     */
    public String getReason() {
        return reason;
    }



    /**
     * @param reason the reason to set
     */
    public void setReason(String reason) {
        this.reason = reason;
    }



    /**
     * @return the cardTpCd
     */
    public String getCardTpCd() {
        return cardTpCd;
    }



    /**
     * @param cardTpCd the cardTpCd to set
     */
    public void setCardTpCd(String cardTpCd) {
        this.cardTpCd = cardTpCd;
    }



    /**
     * @return the membershipPointPeriod
     */
    public String getMembershipPointPeriod() {
        return membershipPointPeriod;
    }



    /**
     * @param membershipPointPeriod the membershipPointPeriod to set
     */
    public void setMembershipPointPeriod(String membershipPointPeriod) {
        this.membershipPointPeriod = membershipPointPeriod;
    }



    /**
     * @param prsnNm the prsnNm to set
     */
    public void setPrsnNm(String prsnNm) {
        this.prsnNm = prsnNm;
    }







    /**
     * @return the lastPointVal
     */
    public Double getLastPointVal() {
        return lastPointVal;
    }



    /**
     * @param lastPointVal the lastPointVal to set
     */
    public void setLastPointVal(Double lastPointVal) {
        this.lastPointVal = lastPointVal;
    }



    /**
     * @return the realTotAmt
     */
    public double getRealTotAmt() {
        return realTotAmt;
    }



    /**
     * @param realTotAmt the realTotAmt to set
     */
    public void setRealTotAmt(double realTotAmt) {
        this.realTotAmt = realTotAmt;
    }



    /**
     * @return the prsnNm
     */
    public String getPrsnNm() {
        return prsnNm;
    }



    /**
     * @return the insertFlag
     */
    public String getInsertFlag() {
        return insertFlag;
    }





    /**
     * @return the result
     */
    public String getResult() {
        return result;
    }



    /**
     * @param result the result to set
     */
    public void setResult(String result) {
        this.result = result;
    }



    /**
     * @param insertFlag the insertFlag to set
     */
    public void setInsertFlag(String insertFlag) {
        this.insertFlag = insertFlag;
    }




    /**
     * @return the isResult
     */
    public Boolean getIsResult() {
        return isResult;
    }



    /**
     * @param isResult the isResult to set
     */
    public void setIsResult(Boolean isResult) {
        this.isResult = isResult;
    }



    /**
     * @return the resultMsg
     */
    public String getResultMsg() {
        return resultMsg;
    }



    /**
     * @param resultMsg the resultMsg to set
     */
    public void setResultMsg(String resultMsg) {
        this.resultMsg = resultMsg;
    }



    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }



    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }



    /**
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }



    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }



    /**
     * @return the pointCdNm
     */
    public String getPointCdNm() {
        return pointCdNm;
    }



    /**
     * @param pointCdNm the pointCdNm to set
     */
    public void setPointCdNm(String pointCdNm) {
        this.pointCdNm = pointCdNm;
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
     * @return the srcSub1
     */
    public String getSrcSub1() {
        return srcSub1;
    }



    /**
     * @param srcSub1 the srcSub1 to set
     */
    public void setSrcSub1(String srcSub1) {
        this.srcSub1 = srcSub1;
    }



    /**
     * @return the srcSub2
     */
    public String getSrcSub2() {
        return srcSub2;
    }



    /**
     * @param srcSub2 the srcSub2 to set
     */
    public void setSrcSub2(String srcSub2) {
        this.srcSub2 = srcSub2;
    }

    /**
     * @return the srcSub3
     */
    public String getSrcSub3() {
        return srcSub3;
    }

    /**
     * @param srcSub3 the srcSub3 to set
     */
    public void setSrcSub3(String srcSub3) {
        this.srcSub3 = srcSub3;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }



    /**
     * @return the cancelHisSeq
     */
    public int getCancelHisSeq() {
        return cancelHisSeq;
    }



    /**
     * @param cancelHisSeq the cancelHisSeq to set
     */
    public void setCancelHisSeq(int cancelHisSeq) {
        this.cancelHisSeq = cancelHisSeq;
    }



    /**
     * @return the occrPointCost
     */
    public Double getOccrPointCost() {
        return occrPointCost;
    }



    /**
     * @param occrPointCost the occrPointCost to set
     */
    public void setOccrPointCost(Double occrPointCost) {
        this.occrPointCost = occrPointCost;
    }

    /**
     * @return the totalExtcPointVal
     */
    public int getTotalExtcPointVal() {
        return totalExtcPointVal;
    }

    /**
     * @param totalExtcPointVal the totalExtcPointVal to set
     */
    public void setTotalExtcPointVal(int totalExtcPointVal) {
        this.totalExtcPointVal = totalExtcPointVal;
    }

    /**
     * @return the totalRmnPointVal
     */
    public int getTotalRmnPointVal() {
        return totalRmnPointVal;
    }

    /**
     * @param totalRmnPointVal the totalRmnPointVal to set
     */
    public void setTotalRmnPointVal(int totalRmnPointVal) {
        this.totalRmnPointVal = totalRmnPointVal;
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
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }

    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }

    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }

    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    /**
     * @return the useTp
     */
    public String getUseTp() {
        return useTp;
    }

    /**
     * @param useTp the useTp to set
     */
    public void setUseTp(String useTp) {
        this.useTp = useTp;
    }

    /**
     * @return the useNum
     */
    public String getUseNum() {
        return useNum;
    }

    /**
     * @param useNum the useNum to set
     */
    public void setUseNum(String useNum) {
        this.useNum = useNum;
    }

    /**
     * @return the pointMaxChk
     */
    public String getPointMaxChk() {
        return pointMaxChk;
    }

    /**
     * @param pointMaxChk the pointMaxChk to set
     */
    public void setPointMaxChk(String pointMaxChk) {
        this.pointMaxChk = pointMaxChk;
    }



}