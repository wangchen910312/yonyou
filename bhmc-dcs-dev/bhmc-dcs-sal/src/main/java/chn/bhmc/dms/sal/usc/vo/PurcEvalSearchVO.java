package chn.bhmc.dms.sal.usc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcEvalSearchVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.    Kim yewon               최초 생성
 * </pre>
 */

public class PurcEvalSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String sDlrCd;                      //딜러번호
    private String sPurcNo;                     //매입번호
    private String sPurcCustNo;                 //구매고객번호
    private String sVinNo;                      //VIN NO
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPurcRegStartDt;               //매입등록일자 - 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPurcRegEndDt;                 //매입등록일자 - 종료일자



    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }
    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }
    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }
    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }
    /**
     * @return the sPurcNo
     */
    public String getsPurcNo() {
        return sPurcNo;
    }
    /**
     * @param sPurcNo the sPurcNo to set
     */
    public void setsPurcNo(String sPurcNo) {
        this.sPurcNo = sPurcNo;
    }
    /**
     * @return the sPurcCustNo
     */
    public String getsPurcCustNo() {
        return sPurcCustNo;
    }
    /**
     * @param sPurcCustNo the sPurcCustNo to set
     */
    public void setsPurcCustNo(String sPurcCustNo) {
        this.sPurcCustNo = sPurcCustNo;
    }
    /**
     * @return the sPurcRegStartDt
     */
    public Date getsPurcRegStartDt() {
        return sPurcRegStartDt;
    }
    /**
     * @param sPurcRegStartDt the sPurcRegStartDt to set
     */
    public void setsPurcRegStartDt(Date sPurcRegStartDt) {
        this.sPurcRegStartDt = sPurcRegStartDt;
    }
    /**
     * @return the sPurcRegEndDt
     */
    public Date getsPurcRegEndDt() {
        return sPurcRegEndDt;
    }
    /**
     * @param sPurcRegEndDt the sPurcRegEndDt to set
     */
    public void setsPurcRegEndDt(Date sPurcRegEndDt) {
        this.sPurcRegEndDt = sPurcRegEndDt;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}
