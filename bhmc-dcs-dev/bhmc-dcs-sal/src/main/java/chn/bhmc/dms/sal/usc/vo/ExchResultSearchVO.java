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

public class ExchResultSearchVO extends SearchVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String sDlrCd;                      //딜러
    private String sSdptCd;                     //사업부
    private String sOfficeCd;                   //사무소
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUploadStartDt;                //등록일자 - 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUploadEndDt;                  //등록일자 - 종료일자
    private String sSungCd;                     //성코드
    private String sCityCd;                     //시코드
    private String sPayYyMmDt;                  //지불월
    private String sVinNo;                      //VIN NO





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
     * @return the sPayYyMmDt
     */
    public String getsPayYyMmDt() {
        return sPayYyMmDt;
    }
    /**
     * @param sPayYyMmDt the sPayYyMmDt to set
     */
    public void setsPayYyMmDt(String sPayYyMmDt) {
        this.sPayYyMmDt = sPayYyMmDt;
    }
    /**
     * @return the sSdptCd
     */
    public String getsSdptCd() {
        return sSdptCd;
    }
    /**
     * @param sSdptCd the sSdptCd to set
     */
    public void setsSdptCd(String sSdptCd) {
        this.sSdptCd = sSdptCd;
    }
    /**
     * @return the sSungCd
     */
    public String getsSungCd() {
        return sSungCd;
    }
    /**
     * @param sSungCd the sSungCd to set
     */
    public void setsSungCd(String sSungCd) {
        this.sSungCd = sSungCd;
    }
    /**
     * @return the sCityCd
     */
    public String getsCityCd() {
        return sCityCd;
    }
    /**
     * @param sCityCd the sCityCd to set
     */
    public void setsCityCd(String sCityCd) {
        this.sCityCd = sCityCd;
    }
    /**
     * @return the sOfficeCd
     */
    public String getsOfficeCd() {
        return sOfficeCd;
    }
    /**
     * @param sOfficeCd the sOfficeCd to set
     */
    public void setsOfficeCd(String sOfficeCd) {
        this.sOfficeCd = sOfficeCd;
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
     * @return the sUploadStartDt
     */
    public Date getsUploadStartDt() {
        return sUploadStartDt;
    }
    /**
     * @param sUploadStartDt the sUploadStartDt to set
     */
    public void setsUploadStartDt(Date sUploadStartDt) {
        this.sUploadStartDt = sUploadStartDt;
    }
    /**
     * @return the sUploadEndDt
     */
    public Date getsUploadEndDt() {
        return sUploadEndDt;
    }
    /**
     * @param sUploadEndDt the sUploadEndDt to set
     */
    public void setsUploadEndDt(Date sUploadEndDt) {
        this.sUploadEndDt = sUploadEndDt;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }




}
