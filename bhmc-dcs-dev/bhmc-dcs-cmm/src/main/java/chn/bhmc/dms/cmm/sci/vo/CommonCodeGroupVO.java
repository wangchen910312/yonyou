package chn.bhmc.dms.cmm.sci.vo;

import java.util.Date;

import javax.validation.constraints.Pattern;

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
 * @ClassName   : CommonCodeGroupVO.java
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

public class CommonCodeGroupVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2750004593982400456L;

    /**
     * 공통코드그룹코드
     */
    @NotBlank
    @Length(min=6, max=6)
    private String cmmGrpCd;

    /**
     * 공통코드그룹명
     */
    @NotBlank
    private String cmmGrpCdNm;

    /**
     * 공통코드그룹명 - 언어별
     */
    private String cmmGrpCdNmLang;

    /**
     * 사용여부
     */
    @NotBlank
    private String useYn="Y";

    /**
     * 시스템코드 여부
     */
    @NotBlank
    @Pattern(regexp="[Y|N]")
    private String sysCdYn;

    /**
     * 비고
     */
    private String remark;

    /**
     * 비고 제목 명
     */

    private String remarkTitleNm;

    /**
     * 비고 제목 언어
     */

    private String remarkTitleLang;

    /**
     * 최종변경일시
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lstUpdtDt;

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
     * @return the cmmGrpCdNm
     */
    public String getCmmGrpCdNm() {
        return cmmGrpCdNm;
    }

    /**
     * @param cmmGrpCdNm the cmmGrpCdNm to set
     */
    public void setCmmGrpCdNm(String cmmGrpCdNm) {
        this.cmmGrpCdNm = cmmGrpCdNm;
    }

    /**
     * @return the cmmGrpCdNmLang
     */
    public String getCmmGrpCdNmLang() {
        return cmmGrpCdNmLang;
    }

    /**
     * @param cmmGrpCdNmLang the cmmGrpCdNmLang to set
     */
    public void setCmmGrpCdNmLang(String cmmGrpCdNmLang) {
        this.cmmGrpCdNmLang = cmmGrpCdNmLang;
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
     * @return the sysCdYn
     */
    public String getSysCdYn() {
        return sysCdYn;
    }

    /**
     * @param sysCdYn the sysCdYn to set
     */
    public void setSysCdYn(String sysCdYn) {
        this.sysCdYn = sysCdYn;
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
     * @return the remarkTitleNm
     */
    public String getRemarkTitleNm() {
        return remarkTitleNm;
    }

    /**
     * @param remarkTitleNm the remarkTitleNm to set
     */
    public void setRemarkTitleNm(String remarkTitleNm) {
        this.remarkTitleNm = remarkTitleNm;
    }

    /**
     * @return the remarkTitleLang
     */
    public String getRemarkTitleLang() {
        return remarkTitleLang;
    }

    /**
     * @param remarkTitleLang the remarkTitleLang to set
     */
    public void setRemarkTitleLang(String remarkTitleLang) {
        this.remarkTitleLang = remarkTitleLang;
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

}
