package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CcdCodeManageVO.java
 * @Description : 클래스 설명을 기술합니다.
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

public class CcdCodeManageVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 284440323662101429L;

    /**
     * 원인코드
     **/
    @NotBlank
    private String cauCd;

    /**
     * 원인코드명
     **/
    private String cauNm;

    /**
     * 원인내용
     **/
    private String cauCont;

    /**
     * 삭제여부
     **/
    @NotBlank
    private String delYn;


    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;
    
    /**
     * 원인/페인트 구분
     */
    private String cauDstinCd;


    /**
     * @return the cauCd
     */
    public String getCauCd() {
        return cauCd;
    }


    /**
     * @param cauCd the cauCd to set
     */
    public void setCauCd(String cauCd) {
        this.cauCd = cauCd;
    }


    /**
     * @return the cauNm
     */
    public String getCauNm() {
        return cauNm;
    }


    /**
     * @param cauNm the cauNm to set
     */
    public void setCauNm(String cauNm) {
        this.cauNm = cauNm;
    }


    /**
     * @return the cauCont
     */
    public String getCauCont() {
        return cauCont;
    }


    /**
     * @param cauCont the cauCont to set
     */
    public void setCauCont(String cauCont) {
        this.cauCont = cauCont;
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


    /**
     * @return the cauDstinCd
     */
    public String getCauDstinCd() {
        return cauDstinCd;
    }


    /**
     * @param cauDstinCd the cauDstinCd to set
     */
    public void setCauDstinCd(String cauDstinCd) {
        this.cauDstinCd = cauDstinCd;
    }

    
 



}
