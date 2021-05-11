package chn.bhmc.dms.mob.api.repair.vo;

import java.util.Date;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CommonCodeVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.     Kang Seok Han     최초 생성
 * </pre>
 */


public class CommonCodeVO extends BaseVO {


    /**
     *
     *
     *
CMM_CD   VARCHAR2(10 BYTE)   No      1   공통코드
CMM_GRP_CD  VARCHAR2(10 BYTE)   No      2   공통코드그룹코드
CMM_CD_NM   VARCHAR2(100 BYTE)  Yes     3   공통코드명
REMARK1 VARCHAR2(4000 BYTE) Yes     4   비고1
REMARK2 VARCHAR2(4000 BYTE) Yes     5   비고2
REMARK3 VARCHAR2(4000 BYTE) Yes     6   비고3
REMARK4 VARCHAR2(4000 BYTE) Yes     7   비고4
REMARK5 VARCHAR2(4000 BYTE) Yes     8   비고5
REMARK6 VARCHAR2(4000 BYTE) Yes     9   비고6
REMARK7 VARCHAR2(4000 BYTE) Yes     10  비고7
REMARK8 VARCHAR2(4000 BYTE) Yes     11  비고8
REMARK9 VARCHAR2(4000 BYTE) Yes     12  비고9
REMARK10    VARCHAR2(4000 BYTE) Yes     13  비고10
USE_YN  CHAR(1 BYTE)    No  'N'     14  사용여부
SORT_ORDER  NUMBER(3,0) Yes     15  정렬순서
REG_USR_ID  VARCHAR2(20 BYTE)   No      16  등록자ID
REG_DT  DATE    No      17  등록일자
UPDT_USR_ID VARCHAR2(20 BYTE)   Yes     18  수정자ID
UPDT_DT DATE    Yes     19  수정일자
     *
     *
     */


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;


    /**
     * 공통코드
     */
    @NotBlank
    private String cmmCd;

    /**
     * 공통코드 그룹번호
     */
    @NotBlank
    @Length(min=6,max=6)
    private String cmmGrpCd;

    /**
     * 공통코드 그룹명
     */

    private String cmmGrpCdNm;

    /**
     * 공통코드 명
     */
    @NotBlank
    private String cmmCdNm;

    /**
     * 공통코드명 - 언어별
     */
    private String cmmCdNmLang;

    /**
     * 비고1
     */
    private String remark1;

    /**
     * 비고2
     */
    private String remark2;

    /**
     * 비고3
     */
    private String remark3;

    /**
     * 비고4
     */
    private String remark4;

    /**
     * 비고5
     */
    private String remark5;


    /**
     * 비고6
     */
    private String remark6;

    /**
     * 비고7
     */
    private String remark7;

    /**
     * 비고8
     */
    private String remark8;


    /**
     * 비고9
     */
    private String remark9;


    /**
     * 비고10
     */
    private String remark10;

    /**
     * 사용유무
     */
    @NotBlank
    private String useYn;

    /**
     * 정렬순서
     */
    @NotBlank
    private String sortOrder ;

    /**
     * 최종변경일시
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lstUpdtDt;

    public CommonCodeVO(){}
    public CommonCodeVO(String cmmCd, String cmmCdNm, String useYn){
        this.cmmCd = cmmCd;
        this.cmmCdNm = cmmCdNm;
        this.useYn = useYn;
    }

    /**
     * @return the remark4
     */
    public String getRemark4() {
        return remark4;
    }

    /**
     * @param remark4 the remark4 to set
     */
    public void setRemark4(String remark4) {
        this.remark4 = remark4;
    }

    /**
     * @return the remark5
     */
    public String getRemark5() {
        return remark5;
    }

    /**
     * @param remark5 the remark5 to set
     */
    public void setRemark5(String remark5) {
        this.remark5 = remark5;
    }

    /**
     * @return the remark6
     */
    public String getRemark6() {
        return remark6;
    }

    /**
     * @param remark6 the remark6 to set
     */
    public void setRemark6(String remark6) {
        this.remark6 = remark6;
    }

    /**
     * @return the remark7
     */
    public String getRemark7() {
        return remark7;
    }

    /**
     * @param remark7 the remark7 to set
     */
    public void setRemark7(String remark7) {
        this.remark7 = remark7;
    }

    /**
     * @return the remark8
     */
    public String getRemark8() {
        return remark8;
    }

    /**
     * @param remark8 the remark8 to set
     */
    public void setRemark8(String remark8) {
        this.remark8 = remark8;
    }

    /**
     * @return the remark9
     */
    public String getRemark9() {
        return remark9;
    }

    /**
     * @param remark9 the remark9 to set
     */
    public void setRemark9(String remark9) {
        this.remark9 = remark9;
    }

    /**
     * @return the remark10
     */
    public String getRemark10() {
        return remark10;
    }

    /**
     * @param remark10 the remark10 to set
     */
    public void setRemark10(String remark10) {
        this.remark10 = remark10;
    }

    /**
     * @return the cmmCd
     */
    public String getCmmCd() {
        return cmmCd;
    }

    /**
     * @param cmmCd the cmmCd to set
     */
    public void setCmmCd(String cmmCd) {
        this.cmmCd = cmmCd;
    }

    /**
     * @return the cmmGrpCd
     */
    public String getCmmGrpCd() {
        return cmmGrpCd;
    }

    /**
     * @param cmmGrpCd the cmmGrpCd to set
     */
    public void setCmmGrpCd(String cmmGrpCd) {
        this.cmmGrpCd = cmmGrpCd;
    }

    /**
     * @return the cmmCdNm
     */
    public String getCmmCdNm() {
        return cmmCdNm;
    }

    /**
     * @param cmmCdNm the cmmCdNm to set
     */
    public void setCmmCdNm(String cmmCdNm) {
        this.cmmCdNm = cmmCdNm;
    }



    /**
     * @return the cmmCdNmLang
     */
    public String getCmmCdNmLang() {
        return cmmCdNmLang;
    }

    /**
     * @param cmmCdNmLang the cmmCdNmLang to set
     */
    public void setCmmCdNmLang(String cmmCdNmLang) {
        this.cmmCdNmLang = cmmCdNmLang;
    }

    /**
     * @return the remark1
     */
    public String getRemark1() {
        return remark1;
    }

    /**
     * @param remark1 the remark1 to set
     */
    public void setRemark1(String remark1) {
        this.remark1 = remark1;
    }

    /**
     * @return the remark2
     */
    public String getRemark2() {
        return remark2;
    }

    /**
     * @param remark2 the remark2 to set
     */
    public void setRemark2(String remark2) {
        this.remark2 = remark2;
    }

    /**
     * @return the remark3
     */
    public String getRemark3() {
        return remark3;
    }

    /**
     * @param remark3 the remark3 to set
     */
    public void setRemark3(String remark3) {
        this.remark3 = remark3;
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
     * @return the sortOrder
     */
    public String getSortOrder() {
        return sortOrder;
    }

    /**
     * @param sortOrder the sortOrder to set
     */
    public void setSortOrder(String sortOrder) {
        this.sortOrder = sortOrder;
    }

    /**
     * @return the lstUpdtDt
     */
    public Date getLstUpdtDt() {
        return lstUpdtDt;
    }

    /**
     * @param lstUpdtDt the lstUpdtDt to set
     */
    public void setLstUpdtDt(Date lstUpdtDt) {
        this.lstUpdtDt = lstUpdtDt;
    }

    /**
     * @param cmmGrpCdNm the cmmGrpCdNm to set
     */
    public void setCmmGrpCdNm(String cmmGrpCdNm) {
        this.cmmGrpCdNm = cmmGrpCdNm;
    }

    /**
     * @return the cmmGrpCdNm
     */
    public String getCmmGrpCdNm() {
        return cmmGrpCdNm;
    }



}
