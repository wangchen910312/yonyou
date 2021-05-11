package chn.bhmc.dms.sal.cmm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserInfoVO
 * @Description : 사용자 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 5. 25.    Kim Jin Suk           최초 생성
 * </pre>
 */

public class UserInfoVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2727282040965777082L;

   /**
    * 사용자ID
    **/
   private  String        usrId;

   /**
    * 사용자명
    **/
   //USR_NM
   private  String        usrNm;

   /**
    * 사용자비밀번호
    **/
   //USR_PW
   private  String        usrPw;

   /**
    * 활성여부
    **/
   private  String        enabledYn;

   /**
    * 언어코드
    **/
   //LANG_CD
   private  String        langCd;

   /**
    * 사원번호
    **/
   //EMP_NO
   private  String        empNo;

   /**
    * 삭제여부
    **/
   private  String        delYn;

   /**
    * 테마
    **/
   //THEME_ID

   private  String        themeId;

   /**
    * 회사구분코드
    **/
   //CMPN_ID

   private  String        cmpnId;

   /**
    * 딜러코드
    **/
   @NotEmpty

   private  String        dlrCd;

   /**
    * 부서코드
    **/
   //DEPT_CD

   private  String        deptCd;

   /**
    * 직급코드
    **/
   //PSTN_CD

   private  String        pstnCd;

   /**
    * 직무코드
    **/
   //DUTY_CD

   private  String        dutyCd;

   /**
    * 이메일명
    **/
   //EMAIL

   private  String        email;

   /**
    * 휴대폰번호
    **/
   //HP_NO

   private  String        hpNo;

   /**
    * 전화번호1
    **/
   //TEL_NO1

   private  String        telNo1;

   /**
    * 사용자비밀번호변경일자
    **/
   //USR_PWD_CHG_DT
   @JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date          usrPwdChgDt;

   /**
    * 사용자ID번호
    **/
   //USR_ID_NO

   private  String        usrIdNo;

   /**
    * 입사일자
    **/
   //JOIN_DT

   private  String        joinDt;

   /**
    * 퇴사일자
    **/
   //RETIRE_DT

   private  String        retireDt;

   /**
    * 우편번호
    **/
   //ZIP_NO

   private  String        zipNo;

   /**
    * 주소1
    **/
   //ADDR1

   private  String        addr1;

   /**
    * 주소2
    **/
   //ADDR2

   private  String        addr2;

   /**
    * 주소3
    **/
   //ADDR3

   private  String        addr3;

   /**
    * 담당업무구분코드
    **/
   //BIZ_CD

   private  String        bizCd;

   /**
    * 정비업무여부
    **/
   //SERV_YN

   private  String        servYn;

   /**
    * 판매업무여부
    **/
   //SALE_YN

   private  String        saleYn;

   /**
    * 법인코드
    **/
   //CORP_CD

   private  String        corpCd;

   /**
    * 전화번호2
    **/
   //TEL_NO2

   private  String        telNo2;

    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }

    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    /**
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }

    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }

    /**
     * @return the usrPw
     */
    public String getUsrPw() {
        return usrPw;
    }

    /**
     * @param usrPw the usrPw to set
     */
    public void setUsrPw(String usrPw) {
        this.usrPw = usrPw;
    }

    /**
     * @return the enabledYn
     */
    public String getEnabledYn() {
        return enabledYn;
    }

    /**
     * @param enabledYn the enabledYn to set
     */
    public void setEnabledYn(String enabledYn) {
        this.enabledYn = enabledYn;
    }

    /**
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }

    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }

    /**
     * @return the empNo
     */
    public String getEmpNo() {
        return empNo;
    }

    /**
     * @param empNo the empNo to set
     */
    public void setEmpNo(String empNo) {
        this.empNo = empNo;
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
     * @return the themeId
     */
    public String getThemeId() {
        return themeId;
    }

    /**
     * @param themeId the themeId to set
     */
    public void setThemeId(String themeId) {
        this.themeId = themeId;
    }

    /**
     * @return the cmpnId
     */
    public String getCmpnId() {
        return cmpnId;
    }

    /**
     * @param cmpnId the cmpnId to set
     */
    public void setCmpnId(String cmpnId) {
        this.cmpnId = cmpnId;
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
     * @return the deptCd
     */
    public String getDeptCd() {
        return deptCd;
    }

    /**
     * @param deptCd the deptCd to set
     */
    public void setDeptCd(String deptCd) {
        this.deptCd = deptCd;
    }

    /**
     * @return the pstnCd
     */
    public String getPstnCd() {
        return pstnCd;
    }

    /**
     * @param pstnCd the pstnCd to set
     */
    public void setPstnCd(String pstnCd) {
        this.pstnCd = pstnCd;
    }

    /**
     * @return the dutyCd
     */
    public String getDutyCd() {
        return dutyCd;
    }

    /**
     * @param dutyCd the dutyCd to set
     */
    public void setDutyCd(String dutyCd) {
        this.dutyCd = dutyCd;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
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
     * @return the telNo1
     */
    public String getTelNo1() {
        return telNo1;
    }

    /**
     * @param telNo1 the telNo1 to set
     */
    public void setTelNo1(String telNo1) {
        this.telNo1 = telNo1;
    }

    /**
     * @return the usrPwdChgDt
     */
    public Date getUsrPwdChgDt() {
        return usrPwdChgDt;
    }

    /**
     * @param usrPwdChgDt the usrPwdChgDt to set
     */
    public void setUsrPwdChgDt(Date usrPwdChgDt) {
        this.usrPwdChgDt = usrPwdChgDt;
    }

    /**
     * @return the usrIdNo
     */
    public String getUsrIdNo() {
        return usrIdNo;
    }

    /**
     * @param usrIdNo the usrIdNo to set
     */
    public void setUsrIdNo(String usrIdNo) {
        this.usrIdNo = usrIdNo;
    }

    /**
     * @return the joinDt
     */
    public String getJoinDt() {
        return joinDt;
    }

    /**
     * @param joinDt the joinDt to set
     */
    public void setJoinDt(String joinDt) {
        this.joinDt = joinDt;
    }

    /**
     * @return the retireDt
     */
    public String getRetireDt() {
        return retireDt;
    }

    /**
     * @param retireDt the retireDt to set
     */
    public void setRetireDt(String retireDt) {
        this.retireDt = retireDt;
    }

    /**
     * @return the zipNo
     */
    public String getZipNo() {
        return zipNo;
    }

    /**
     * @param zipNo the zipNo to set
     */
    public void setZipNo(String zipNo) {
        this.zipNo = zipNo;
    }

    /**
     * @return the addr1
     */
    public String getAddr1() {
        return addr1;
    }

    /**
     * @param addr1 the addr1 to set
     */
    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    /**
     * @return the addr2
     */
    public String getAddr2() {
        return addr2;
    }

    /**
     * @param addr2 the addr2 to set
     */
    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }

    /**
     * @return the addr3
     */
    public String getAddr3() {
        return addr3;
    }

    /**
     * @param addr3 the addr3 to set
     */
    public void setAddr3(String addr3) {
        this.addr3 = addr3;
    }

    /**
     * @return the bizCd
     */
    public String getBizCd() {
        return bizCd;
    }

    /**
     * @param bizCd the bizCd to set
     */
    public void setBizCd(String bizCd) {
        this.bizCd = bizCd;
    }

    /**
     * @return the servYn
     */
    public String getServYn() {
        return servYn;
    }

    /**
     * @param servYn the servYn to set
     */
    public void setServYn(String servYn) {
        this.servYn = servYn;
    }

    /**
     * @return the saleYn
     */
    public String getSaleYn() {
        return saleYn;
    }

    /**
     * @param saleYn the saleYn to set
     */
    public void setSaleYn(String saleYn) {
        this.saleYn = saleYn;
    }

    /**
     * @return the corpCd
     */
    public String getCorpCd() {
        return corpCd;
    }

    /**
     * @param corpCd the corpCd to set
     */
    public void setCorpCd(String corpCd) {
        this.corpCd = corpCd;
    }

    /**
     * @return the telNo2
     */
    public String getTelNo2() {
        return telNo2;
    }

    /**
     * @param telNo2 the telNo2 to set
     */
    public void setTelNo2(String telNo2) {
        this.telNo2 = telNo2;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
