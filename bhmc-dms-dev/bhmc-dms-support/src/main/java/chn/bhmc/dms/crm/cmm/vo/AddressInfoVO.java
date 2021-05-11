package chn.bhmc.dms.crm.cmm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AddressInfoVO.java.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"        , mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="pltCd"        , mesgKey="global.lbl.pltCd")
    ,@ValidField(field="refTableNm"   , mesgKey="global.lbl.refTableNm")
    ,@ValidField(field="refKeyNm"     , mesgKey="global.lbl.refKeyNm")
    ,@ValidField(field="addrTp"       , mesgKey="global.lbl.addrTp")
    ,@ValidField(field="zipCd"        , mesgKey="global.lbl.zipCd")
    ,@ValidField(field="sungCd"       , mesgKey="global.lbl.sungCd")
    ,@ValidField(field="cityCd"       , mesgKey="global.lbl.cityCd")
    ,@ValidField(field="distCd"       , mesgKey="global.lbl.distCd")
    ,@ValidField(field="addrNm"       , mesgKey="global.lbl.addrNm")
    ,@ValidField(field="addrDetlCont" , mesgKey="global.lbl.addrDetlCont")
    ,@ValidField(field="remark"       , mesgKey="global.lbl.remark")
    ,@ValidField(field="flagYn"       , mesgKey="global.lbl.flagYn")
    ,@ValidField(field="useYn"        , mesgKey="global.lbl.useYn")
    ,@ValidField(field="regUsrId"     , mesgKey="global.lbl.regUsrId")
    ,@ValidField(field="regDt"        , mesgKey="global.lbl.regDt")
    ,@ValidField(field="updtUsrId"    , mesgKey="global.lbl.updtUsrId")
    ,@ValidField(field="updtDt"       , mesgKey="global.lbl.updtDt")
})

public class AddressInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6966951830307598890L;

        private String seq;

       /**
        * 딜러코드
        **/
       @NotEmpty

       private String dlrCd;

       /**
        * 사업장코드
        **/
       @NotEmpty

       private String pltCd;

       /**
        * 참조테이블명
        **/
       //REF_TABLE_NM

       private String refTableNm;

       /**
        * 참조키명
        **/
       //REG_KEY_NM

       private String refKeyNm;

       /**
        * 주소유형
        **/
       //ADDR_TP

       private String addrTp;

       /**
        * 우편번호
        **/
       //ZIP_CD

       private String zipCd;

       /**
        * 성코드
        **/
       //SUNG_CD

       private String sungCd;

       /**
        * 도시코드
        **/
       //CITY_CD

       private String cityCd;

       /**
        * 지역코드
        **/
       //DIST_CD

       private String distCd;

       /**
        * 주소명
        **/
       //ADDR_NM

       private String addrNm;

       /**
        * 주소상세내용
        **/
       //ADDR_DETL_CONT

       private String addrDetlCont;

       /**
        * 비고
        **/
       //REMARK

       private String remark;

       /**
        * 주요주소
        **/
       @NotEmpty

       private String flagYn;

       /**
        * 사용여부
        **/
       @NotEmpty

       private String useYn;

       private String sungNm;
       private String cityNm;
       private String distNm;
       private String extZipCd;

       private Date regDt;
       private Date updtDt;
       private String regUsrId;
       private String updtUsrId;


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
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the refTableNm
     */
    public String getRefTableNm() {
        return refTableNm;
    }

    /**
     * @param refTableNm the refTableNm to set
     */
    public void setRefTableNm(String refTableNm) {
        this.refTableNm = refTableNm;
    }

    /**
     * @return the refKeyNm
     */
    public String getrefKeyNm() {
        return refKeyNm;
    }

    /**
     * @param refKeyNm the refKeyNm to set
     */
    public void setrefKeyNm(String refKeyNm) {
        this.refKeyNm = refKeyNm;
    }

    /**
     * @return the addrTp
     */
    public String getAddrTp() {
        return addrTp;
    }

    /**
     * @param addrTp the addrTp to set
     */
    public void setAddrTp(String addrTp) {
        this.addrTp = addrTp;
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
     * @return the sungCd
     */
    public String getSungCd() {
        return sungCd;
    }

    /**
     * @param sungCd the sungCd to set
     */
    public void setSungCd(String sungCd) {
        this.sungCd = sungCd;
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
     * @return the flagYn
     */
    public String getFlagYn() {
        return flagYn;
    }

    /**
     * @param flagYn the flagYn to set
     */
    public void setFlagYn(String flagYn) {
        this.flagYn = flagYn;
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



}
