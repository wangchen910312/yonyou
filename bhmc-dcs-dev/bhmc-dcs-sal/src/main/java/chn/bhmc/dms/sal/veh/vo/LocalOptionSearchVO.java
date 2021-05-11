package chn.bhmc.dms.sal.veh.vo;

import java.util.Date;

import able.com.vo.SearchVO;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LocalOptionSearchVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.    Kim Jin Suk      최초 생성
 * </pre>
 */

public class LocalOptionSearchVO extends SearchVO{
    private static final long serialVersionUID = 1350937268701377094L;

    private String dlrCd;              // 딜러코드
    private String optionCd;           // 옵션코드

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;              // 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt;                // 종료일자

    //private String startDt;              // 시작일자
    //private String endDt;                // 종료일자

    private String optionNm;            // 옵션명(중복체크 요청)
    private String updateIsOptionCd;    // update 중복체크시, 같은 id의 동일 이름명일 경우는 통과

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
     * @return the optionCd
     */
    public String getOptionCd() {
        return optionCd;
    }
    /**
     * @param optionCd the optionCd to set
     */
    public void setOptionCd(String optionCd) {
        this.optionCd = optionCd;
    }
    /**
     * @return the startDt
     */
    public Date getStartDt() {
        return startDt;
    }
    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(Date startDt) {
        this.startDt = startDt;
    }
    /**
     * @return the endDt
     */
    public Date getEndDt() {
        return endDt;
    }
    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(Date endDt) {
        this.endDt = endDt;
    }
    /**
     * @return the optionNm
     */
    public String getOptionNm() {
        return optionNm;
    }
    /**
     * @param optionNm the optionNm to set
     */
    public void setOptionNm(String optionNm) {
        this.optionNm = optionNm;
    }
    /**
     * @return the updateIsOptionNm
     */
    public String getUpdateIsOptionCd() {
        return updateIsOptionCd;
    }
    /**
     * @param updateIsOptionNm the updateIsOptionNm to set
     */
    public void setUpdateIsOptionCd(String updateIsOptionCd) {
        this.updateIsOptionCd = updateIsOptionCd;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}
