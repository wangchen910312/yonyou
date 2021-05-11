package chn.bhmc.dms.crm.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

//import org.hibernate.validator.constraints.NotEmpty;

//import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
//import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CrmTargExtractVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author hyoung jun an
 * @since 2016.04.05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.05.     hyoung jun an     최초 생성
 * </pre>
 */

@ValidDescriptor({
     @ValidField(field="dlrCd"           , mesgKey="crm.lbl.dlrCd")
    ,@ValidField(field="custExtrTermNo"  , mesgKey="crm.lbl.custExtrTermNo")
    ,@ValidField(field="custExtrTermNm"  , mesgKey="crm.lbl.custExtrTermNm")
    ,@ValidField(field="randomYn"        , mesgKey="crm.lbl.randomYn")
    ,@ValidField(field="randomCnt"       , mesgKey="crm.lbl.randomCnt")
    ,@ValidField(field="useYn"           , mesgKey="crm.lbl.useYn")

    ,@ValidField(field="detlExtrTermCd"  , mesgKey="crm.lbl.detlExtrTermCd")
    ,@ValidField(field="termVal1"        , mesgKey="crm.lbl.termVal1")
    ,@ValidField(field="termVal2"        , mesgKey="crm.lbl.termVal2")
    ,@ValidField(field="termVal3"        , mesgKey="crm.lbl.termVal3")
    ,@ValidField(field="termVal4"        , mesgKey="crm.lbl.termVal4")
    ,@ValidField(field="termVal5"        , mesgKey="crm.lbl.termVal5")
})

public class CrmTargExtractVO extends BaseVO {

   /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7315456847266341425L;

    private String dlrCd;           //딜러코드
    private String extrDgreCnt;     //추출차수
    private String custExtrTermNo;  //고객추출조건번호
    private String custExtrTermCd;
    private String custExtrTermNm;  //고객추출조건명
    private String randomYn;        //랜덤추출여부
    private int randomCnt;          //랜덤추출갯수
    private String useYn;           //사용여부
    private String regUsrId;        //등록자ID
    private Date regDt;             //등록일자
    private String updtUsrId;       //수정자ID
    private Date updtDt;            //수정일자
    private String detlExtrTermCd;  //상세추출조건코드
    private String detlExtrTermNm;  //상세추출조건코드
    private String termVal1;        //조건값1
    private String termVal2;        //조건값2
    private String termVal3;        //조건값3
    private String termVal4;        //조건값4
    private String termVal5;        //조건값5
    private String detlExtrTermCdTermVal;   //상세추출조건코드+조건값

    private int cnt;
    private String carRegNo;
    private String modelNm;
    private String sexCd;   //성별
    private String sexCdNm;   //성별
    private String birthDt; //생일
    private int haveCarCnt; //보유차량수량

    private String cityCd;          //도시코드
    private String cityNm;          //도시명
    private String carlineCd;       //차종코드
    private String carlineNm;       //차종명

    private String custNo;
    private String custNm;
    private String telNo;
    private String hpNo;
    private String wechatId;
    private String emailNm;
    private String zipCd;
    private String extZipCd;
    private String sungNm;
    private String distCd;
    private String distNm;
    private String addrNm;
    private String addrDetlCont;
    private String result;
    private int seq = 0;
    private String dataYn;
    private String makCd;
    private String makNm;
    private String blueMembershipYn;
    private String membershipYn;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDtFormat;

    private String dateFormat;

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
     * @return the extrDgreCnt
     */
    public String getExtrDgreCnt() {
        return extrDgreCnt;
    }

    /**
     * @param extrDgreCnt the extrDgreCnt to set
     */
    public void setExtrDgreCnt(String extrDgreCnt) {
        this.extrDgreCnt = extrDgreCnt;
    }

    /**
     * @return the custExtrTermNo
     */
    public String getCustExtrTermNo() {
        return custExtrTermNo;
    }

    /**
     * @param custExtrTermNo the custExtrTermNo to set
     */
    public void setCustExtrTermNo(String custExtrTermNo) {
        this.custExtrTermNo = custExtrTermNo;
    }

    /**
     * @return the custExtrTermNm
     */
    public String getCustExtrTermNm() {
        return custExtrTermNm;
    }

    /**
     * @param custExtrTermNm the custExtrTermNm to set
     */
    public void setCustExtrTermNm(String custExtrTermNm) {
        this.custExtrTermNm = custExtrTermNm;
    }

    /**
     * @return the randomYn
     */
    public String getRandomYn() {
        return randomYn;
    }

    /**
     * @param randomYn the randomYn to set
     */
    public void setRandomYn(String randomYn) {
        this.randomYn = randomYn;
    }

    /**
     * @return the randomCnt
     */
    public int getRandomCnt() {
        return randomCnt;
    }

    /**
     * @param randomCnt the randomCnt to set
     */
    public void setRandomCnt(int randomCnt) {
        this.randomCnt = randomCnt;
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
     * @return the detlExtrTermCd
     */
    public String getDetlExtrTermCd() {
        return detlExtrTermCd;
    }

    /**
     * @param detlExtrTermCd the detlExtrTermCd to set
     */
    public void setDetlExtrTermCd(String detlExtrTermCd) {
        this.detlExtrTermCd = detlExtrTermCd;
    }

    /**
     * @return the detlExtrTermNm
     */
    public String getDetlExtrTermNm() {
        return detlExtrTermNm;
    }

    /**
     * @param detlExtrTermNm the detlExtrTermNm to set
     */
    public void setDetlExtrTermNm(String detlExtrTermNm) {
        this.detlExtrTermNm = detlExtrTermNm;
    }

    /**
     * @return the termVal1
     */
    public String getTermVal1() {
        return termVal1;
    }

    /**
     * @param termVal1 the termVal1 to set
     */
    public void setTermVal1(String termVal1) {
        this.termVal1 = termVal1;
    }

    /**
     * @return the termVal2
     */
    public String getTermVal2() {
        return termVal2;
    }

    /**
     * @param termVal2 the termVal2 to set
     */
    public void setTermVal2(String termVal2) {
        this.termVal2 = termVal2;
    }

    /**
     * @return the termVal3
     */
    public String getTermVal3() {
        return termVal3;
    }

    /**
     * @param termVal3 the termVal3 to set
     */
    public void setTermVal3(String termVal3) {
        this.termVal3 = termVal3;
    }

    /**
     * @return the termVal4
     */
    public String getTermVal4() {
        return termVal4;
    }

    /**
     * @param termVal4 the termVal4 to set
     */
    public void setTermVal4(String termVal4) {
        this.termVal4 = termVal4;
    }

    /**
     * @return the termVal5
     */
    public String getTermVal5() {
        return termVal5;
    }

    /**
     * @param termVal5 the termVal5 to set
     */
    public void setTermVal5(String termVal5) {
        this.termVal5 = termVal5;
    }

    /**
     * @return the cityCd
     */
    public String getCityCd() {
        return cityCd;
    }

    /**
     * @param cityCd the cityCd to set
     */
    public void setCityCd(String cityCd) {
        this.cityCd = cityCd;
    }

    /**
     * @return the cityNm
     */
    public String getCityNm() {
        return cityNm;
    }

    /**
     * @param cityNm the cityNm to set
     */
    public void setCityNm(String cityNm) {
        this.cityNm = cityNm;
    }

    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }

    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }

    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }

    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
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
     * @return the wechatId
     */
    public String getWechatId() {
        return wechatId;
    }

    /**
     * @param wechatId the wechatId to set
     */
    public void setWechatId(String wechatId) {
        this.wechatId = wechatId;
    }

    /**
     * @return the emailNm
     */
    public String getEmailNm() {
        return emailNm;
    }

    /**
     * @param emailNm the emailNm to set
     */
    public void setEmailNm(String emailNm) {
        this.emailNm = emailNm;
    }

    /**
     * @return the zipCd
     */
    public String getZipCd() {
        return zipCd;
    }

    /**
     * @param zipCd the zipCd to set
     */
    public void setZipCd(String zipCd) {
        this.zipCd = zipCd;
    }

    /**
     * @return the sungNm
     */
    public String getSungNm() {
        return sungNm;
    }

    /**
     * @param sungNm the sungNm to set
     */
    public void setSungNm(String sungNm) {
        this.sungNm = sungNm;
    }

    /**
     * @return the distCd
     */
    public String getDistCd() {
        return distCd;
    }

    /**
     * @param distCd the distCd to set
     */
    public void setDistCd(String distCd) {
        this.distCd = distCd;
    }

    /**
     * @return the distNm
     */
    public String getDistNm() {
        return distNm;
    }

    /**
     * @param distNm the distNm to set
     */
    public void setDistNm(String distNm) {
        this.distNm = distNm;
    }

    /**
     * @return the addrNm
     */
    public String getAddrNm() {
        return addrNm;
    }

    /**
     * @param addrNm the addrNm to set
     */
    public void setAddrNm(String addrNm) {
        this.addrNm = addrNm;
    }

    /**
     * @return the addrDetlCont
     */
    public String getAddrDetlCont() {
        return addrDetlCont;
    }

    /**
     * @param addrDetlCont the addrDetlCont to set
     */
    public void setAddrDetlCont(String addrDetlCont) {
        this.addrDetlCont = addrDetlCont;
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
     * @return the dataYn
     */
    public String getDataYn() {
        return dataYn;
    }

    /**
     * @param dataYn the dataYn to set
     */
    public void setDataYn(String dataYn) {
        this.dataYn = dataYn;
    }

    /**
     * @return the makCd
     */
    public String getMakCd() {
        return makCd;
    }

    /**
     * @param makCd the makCd to set
     */
    public void setMakCd(String makCd) {
        this.makCd = makCd;
    }

    /**
     * @return the makNm
     */
    public String getMakNm() {
        return makNm;
    }

    /**
     * @param makNm the makNm to set
     */
    public void setMakNm(String makNm) {
        this.makNm = makNm;
    }

    /**
     * @return the custExtrTermCd
     */
    public String getCustExtrTermCd() {
        return custExtrTermCd;
    }

    /**
     * @param custExtrTermCd the custExtrTermCd to set
     */
    public void setCustExtrTermCd(String custExtrTermCd) {
        this.custExtrTermCd = custExtrTermCd;
    }

    /**
     * @return the regDtFormat
     */
    public Date getRegDtFormat() {
        return regDtFormat;
    }

    /**
     * @param regDtFormat the regDtFormat to set
     */
    public void setRegDtFormat(Date regDtFormat) {
        this.regDtFormat = regDtFormat;
    }

    /**
     * @return the cnt
     */
    public int getCnt() {
        return cnt;
    }

    /**
     * @param cnt the cnt to set
     */
    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    /**
     * @return the detlExtrTermCdTermVal
     */
    public String getDetlExtrTermCdTermVal() {
        return detlExtrTermCdTermVal;
    }

    /**
     * @param detlExtrTermCdTermVal the detlExtrTermCdTermVal to set
     */
    public void setDetlExtrTermCdTermVal(String detlExtrTermCdTermVal) {
        this.detlExtrTermCdTermVal = detlExtrTermCdTermVal;
    }

    /**
     * @return the blueMembershipYn
     */
    public String getBlueMembershipYn() {
        return blueMembershipYn;
    }

    /**
     * @param blueMembershipYn the blueMembershipYn to set
     */
    public void setBlueMembershipYn(String blueMembershipYn) {
        this.blueMembershipYn = blueMembershipYn;
    }

    /**
     * @return the membershipYn
     */
    public String getMembershipYn() {
        return membershipYn;
    }

    /**
     * @param membershipYn the membershipYn to set
     */
    public void setMembershipYn(String membershipYn) {
        this.membershipYn = membershipYn;
    }

    /**
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }

    /**
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }

    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }

    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }

    /**
     * @return the extZipCd
     */
    public String getExtZipCd() {
        return extZipCd;
    }

    /**
     * @param extZipCd the extZipCd to set
     */
    public void setExtZipCd(String extZipCd) {
        this.extZipCd = extZipCd;
    }

    /**
     * @return the sexCd
     */
    public String getSexCd() {
        return sexCd;
    }

    /**
     * @param sexCd the sexCd to set
     */
    public void setSexCd(String sexCd) {
        this.sexCd = sexCd;
    }

    /**
     * @return the sexCdNm
     */
    public String getSexCdNm() {
        return sexCdNm;
    }

    /**
     * @param sexCdNm the sexCdNm to set
     */
    public void setSexCdNm(String sexCdNm) {
        this.sexCdNm = sexCdNm;
    }

    /**
     * @return the birthDt
     */
    public String getBirthDt() {
        return birthDt;
    }

    /**
     * @param birthDt the birthDt to set
     */
    public void setBirthDt(String birthDt) {
        this.birthDt = birthDt;
    }

    /**
     * @return the haveCarCnt
     */
    public int getHaveCarCnt() {
        return haveCarCnt;
    }

    /**
     * @param haveCarCnt the haveCarCnt to set
     */
    public void setHaveCarCnt(int haveCarCnt) {
        this.haveCarCnt = haveCarCnt;
    }

    /**
     * @return the dateFormat
     */
    public String getDateFormat() {
        return dateFormat;
    }

    /**
     * @param dateFormat the dateFormat to set
     */
    public void setDateFormat(String dateFormat) {
        this.dateFormat = dateFormat;
    }



}