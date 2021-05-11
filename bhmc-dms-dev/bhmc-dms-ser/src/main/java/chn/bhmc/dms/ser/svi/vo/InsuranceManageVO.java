package chn.bhmc.dms.ser.svi.vo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InsuranceManageVO.java
 * @Description : 보험관리 조회 저장 수정 VO
 * @author Ki Hyun Kwon
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

public class InsuranceManageVO extends BaseVO{


   /**
     * Statements
     * (long)serialVersionUID
     */
   private static final long serialVersionUID = 3222454790756864474L;

   @NotBlank
   private String dlrCd;        //딜러코드

   @NotBlank
   private String incCmpCd;     //보험사코드_사업자번호

   @NotBlank
   @Length(min=1, max=30)
   private String incCmpNm ;    //보험사명

   @NotBlank
   @Length(min=9, max=13)
   private String incCmpTelNo;  //보험사전화번호

   @NotBlank
   @Length(min=1, max=15)
   private String incDeptNm;    //보험부서명

   @NotBlank
   @Length(min=1, max=15)
   private String incUsrNm;     //보험사용자명

   @Length(min=9, max=13)
   private String incRespTelNo; //보험담당전화번호

   @Length(min=9, max=13)
   private String incRespHpNo;  //보험담당휴대폰번호

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
     * @return the incCmpCd
     */
    public String getIncCmpCd() {
        return incCmpCd;
    }
    /**
     * @param incCmpCd the incCmpCd to set
     */
    public void setIncCmpCd(String incCmpCd) {
        this.incCmpCd = incCmpCd;
    }
    /**
     * @return the incCmpNm
     */
    public String getIncCmpNm() {
        return incCmpNm;
    }
    /**
     * @param incCmpNm the incCmpNm to set
     */
    public void setIncCmpNm(String incCmpNm) {
        this.incCmpNm = incCmpNm;
    }
    /**
     * @return the incCmpTelNo
     */
    public String getIncCmpTelNo() {
        return incCmpTelNo;
    }
    /**
     * @param incCmpTelNo the incCmpTelNo to set
     */
    public void setIncCmpTelNo(String incCmpTelNo) {
        this.incCmpTelNo = incCmpTelNo;
    }
    /**
     * @return the incDeptNm
     */
    public String getIncDeptNm() {
        return incDeptNm;
    }
    /**
     * @param incDeptNm the incDeptNm to set
     */
    public void setIncDeptNm(String incDeptNm) {
        this.incDeptNm = incDeptNm;
    }
    /**
     * @return the incUsrNm
     */
    public String getIncUsrNm() {
        return incUsrNm;
    }
    /**
     * @param incUsrNm the incUsrNm to set
     */
    public void setIncUsrNm(String incUsrNm) {
        this.incUsrNm = incUsrNm;
    }
    /**
     * @return the incRespTelNo
     */
    public String getIncRespTelNo() {
        return incRespTelNo;
    }
    /**
     * @param incRespTelNo the incRespTelNo to set
     */
    public void setIncRespTelNo(String incRespTelNo) {
        this.incRespTelNo = incRespTelNo;
    }
    /**
     * @return the incRespHpNo
     */
    public String getIncRespHpNo() {
        return incRespHpNo;
    }
    /**
     * @param incRespHpNo the incRespHpNo to set
     */
    public void setIncRespHpNo(String incRespHpNo) {
        this.incRespHpNo = incRespHpNo;
    }




}
