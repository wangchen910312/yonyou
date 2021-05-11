package chn.bhmc.dms.cmm.cmp.vo;

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
 * @ClassName   : StorageVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kang Seok Han     최초 생성
 * </pre>
 */

public class StorageVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 133891399423948989L;

    @NotBlank
    @Length(max=20)
    private String strgeCd;

    @NotBlank
    @Length(max=20)
    private String pltCd;

    private String pltNm;

    @NotBlank
    @Length(max=20)
    private String dlrCd;

    @NotBlank
    @Length(max=30)
    private String strgeNm;

    @NotBlank
    @Pattern(regexp="[Y|N]")
    private String netingUseYn;

    @NotBlank
    @Pattern(regexp="[Y|N]")
    private String locMngYn;

    @NotBlank
    @Length(min=2, max=10)
    private String strgeTp;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date strgeCreDt;

    /**
     * 창고등록인
     */
    private String strgeRegPrsnNm;

    /**
     * 창고담당자리스트
     */
    private String strgeManagerList = "";

    /**
     * 비고
     */
    private String remark;

    /**
     * DB 저장유무
     */
    private String dbYn = "N";

    /**
     * 완성차 삭제 유무
     */
    private String strgeSaleDelYn = "N";

    /**
     * 재고 테이블 창고사용 수
     */
    private int ptStockStrgeCnt = 0;

    /**
     * 부품마스터 테이블 입고창고 사용 수
     */
    private int ptMasterGrStrgeCnt = 0;

    /**
     * 부품마스터 테이블 출고창고 사용 수
     */
    private int ptMasterGiStrgeCnt = 0;

    /**
     * 로케이션 테이블 창고 사용 수
     */
    private int ptBinStrgeCnt = 0;

    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }

    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
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
     * @return the pltNm
     */
    public String getPltNm() {
        return pltNm;
    }

    /**
     * @param pltNm the pltNm to set
     */
    public void setPltNm(String pltNm) {
        this.pltNm = pltNm;
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
     * @return the strgeNm
     */
    public String getStrgeNm() {
        return strgeNm;
    }

    /**
     * @param strgeNm the strgeNm to set
     */
    public void setStrgeNm(String strgeNm) {
        this.strgeNm = strgeNm;
    }

    /**
     * @return the netingUseYn
     */
    public String getNetingUseYn() {
        return netingUseYn;
    }

    /**
     * @param netingUseYn the netingUseYn to set
     */
    public void setNetingUseYn(String netingUseYn) {
        this.netingUseYn = netingUseYn;
    }

    /**
     * @return the locMngYn
     */
    public String getLocMngYn() {
        return locMngYn;
    }

    /**
     * @param locMngYn the locMngYn to set
     */
    public void setLocMngYn(String locMngYn) {
        this.locMngYn = locMngYn;
    }

    /**
     * @return the strgeTp
     */
    public String getStrgeTp() {
        return strgeTp;
    }

    /**
     * @param strgeTp the strgeTp to set
     */
    public void setStrgeTp(String strgeTp) {
        this.strgeTp = strgeTp;
    }

    /**
     * @return the strgeCreDt
     */
    public Date getStrgeCreDt() {
        return strgeCreDt;
    }

    /**
     * @param strgeCreDt the strgeCreDt to set
     */
    public void setStrgeCreDt(Date strgeCreDt) {
        this.strgeCreDt = strgeCreDt;
    }

    /**
     * @return the strgeRegPrsnNm
     */
    public String getStrgeRegPrsnNm() {
        return strgeRegPrsnNm;
    }

    /**
     * @param strgeRegPrsnNm the strgeRegPrsnNm to set
     */
    public void setStrgeRegPrsnNm(String strgeRegPrsnNm) {
        this.strgeRegPrsnNm = strgeRegPrsnNm;
    }

    /**
     * @return the strgeManagerList
     */
    public String getStrgeManagerList() {
        return strgeManagerList;
    }

    /**
     * @param strgeManagerList the strgeManagerList to set
     */
    public void setStrgeManagerList(String strgeManagerList) {
        this.strgeManagerList = strgeManagerList;
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
     * @return the dbYn
     */
    public String getDbYn() {
        return dbYn;
    }

    /**
     * @param dbYn the dbYn to set
     */
    public void setDbYn(String dbYn) {
        this.dbYn = dbYn;
    }

    /**
     * @return the strgeSaleDelYn
     */
    public String getStrgeSaleDelYn() {
        return strgeSaleDelYn;
    }

    /**
     * @param strgeSaleDelYn the strgeSaleDelYn to set
     */
    public void setStrgeSaleDelYn(String strgeSaleDelYn) {
        this.strgeSaleDelYn = strgeSaleDelYn;
    }

    /**
     * @return the ptStockStrgeCnt
     */
    public int getPtStockStrgeCnt() {
        return ptStockStrgeCnt;
    }

    /**
     * @param ptStockStrgeCnt the ptStockStrgeCnt to set
     */
    public void setPtStockStrgeCnt(int ptStockStrgeCnt) {
        this.ptStockStrgeCnt = ptStockStrgeCnt;
    }

    /**
     * @return the ptMasterGrStrgeCnt
     */
    public int getPtMasterGrStrgeCnt() {
        return ptMasterGrStrgeCnt;
    }

    /**
     * @param ptMasterGrStrgeCnt the ptMasterGrStrgeCnt to set
     */
    public void setPtMasterGrStrgeCnt(int ptMasterGrStrgeCnt) {
        this.ptMasterGrStrgeCnt = ptMasterGrStrgeCnt;
    }

    /**
     * @return the ptMasterGiStrgeCnt
     */
    public int getPtMasterGiStrgeCnt() {
        return ptMasterGiStrgeCnt;
    }

    /**
     * @param ptMasterGiStrgeCnt the ptMasterGiStrgeCnt to set
     */
    public void setPtMasterGiStrgeCnt(int ptMasterGiStrgeCnt) {
        this.ptMasterGiStrgeCnt = ptMasterGiStrgeCnt;
    }

    /**
     * @return the ptBinStrgeCnt
     */
    public int getPtBinStrgeCnt() {
        return ptBinStrgeCnt;
    }

    /**
     * @param ptBinStrgeCnt the ptBinStrgeCnt to set
     */
    public void setPtBinStrgeCnt(int ptBinStrgeCnt) {
        this.ptBinStrgeCnt = ptBinStrgeCnt;
    }


}
