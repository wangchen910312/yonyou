package chn.bhmc.dms.ser.svi.vo;

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
 * @ClassName   : NcdCodeManageVO.java
 * @Description : 현상코드 저장/수정/삭제 VO
 * @author Ki Hyun Kwon
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

public class NcdCodeManageVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 743858086223652694L;

    /**
     * 구분코드(L:대분류,M:중분류,S:소분류)
     **/
    @NotEmpty
    private String phenDstinCd;

    /**
     * 현상코드
     **/
    @NotEmpty
    private String phenCd;

    /**
     * 현상대분류
     **/
    @NotEmpty
    private String phenLclsCd;

    /**
     * 현상중분류
     **/
    private String phenMclsCd;

    /**
     * 현상코드명칭
     **/
    private String phenNm;

    /**
     * 확정여부
     **/
    private String confirmYn;

    /**
     * 삭제여부
     **/
    @NotEmpty
    private String delYn;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    /**
     * @return the phenDstinCd
     */
    public String getPhenDstinCd() {
        return phenDstinCd;
    }

    /**
     * @param phenDstinCd the phenDstinCd to set
     */
    public void setPhenDstinCd(String phenDstinCd) {
        this.phenDstinCd = phenDstinCd;
    }

    /**
     * @return the phenCd
     */
    public String getPhenCd() {
        return phenCd;
    }

    /**
     * @param phenCd the phenCd to set
     */
    public void setPhenCd(String phenCd) {
        this.phenCd = phenCd;
    }

    /**
     * @return the phenLclsCd
     */
    public String getPhenLclsCd() {
        return phenLclsCd;
    }

    /**
     * @param phenLclsCd the phenLclsCd to set
     */
    public void setPhenLclsCd(String phenLclsCd) {
        this.phenLclsCd = phenLclsCd;
    }

    /**
     * @return the phenMclsCd
     */
    public String getPhenMclsCd() {
        return phenMclsCd;
    }

    /**
     * @param phenMclsCd the phenMclsCd to set
     */
    public void setPhenMclsCd(String phenMclsCd) {
        this.phenMclsCd = phenMclsCd;
    }

    

    /**
     * @return the phenNm
     */
    public String getPhenNm() {
        return phenNm;
    }

    /**
     * @param phenNm the phenNm to set
     */
    public void setPhenNm(String phenNm) {
        this.phenNm = phenNm;
    }

    /**
     * @return the confirmYn
     */
    public String getConfirmYn() {
        return confirmYn;
    }

    /**
     * @param confirmYn the confirmYn to set
     */
    public void setConfirmYn(String confirmYn) {
        this.confirmYn = confirmYn;
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

    

}
