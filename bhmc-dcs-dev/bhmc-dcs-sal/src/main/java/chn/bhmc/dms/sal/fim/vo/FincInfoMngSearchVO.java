package chn.bhmc.dms.sal.fim.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FincInfoMngSearchVO
 * @Description : 금융서비스 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 09.    Kim Jin Suk      최초 생성
 * </pre>
 */

public class FincInfoMngSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8786746648888504630L;

    /**
     * 딜러코드
     **/
    private  String               sDlrCd;

    /**
     * 차대번호
     **/
    private  String               sVinNo;

    /**
     * 신청상태
     **/
    private  String               sFincStatCd;

    /**
     * 신청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                 sStartFincReqDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                 sEndFincReqDt;

    /**
     * 금융회사코드
     **/
    private  String               sFincCmpCd;

    /**
     * 차종코드
     **/
    private  String               sCarlineCd;

    /**
     * 모델코드
     **/
    private  String               sModelCd;

    /**
     * OCN코드
     **/
    private  String               sOcnCd;

    /**
     * 외장색상코드
     **/
    private  String               sExtColorCd;

    /**
     * 내장색상코드
     **/
    private  String               sIntColorCd;

    /**
     * 계약번호
     **/
    private  String               sContractNo;

    /**
     * 금융번호
     */
    private  String               sFincNo;

    /**
     * 고객코드
     */
    private  String               sCustCd;

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
     * @return the sFincStatCd
     */
    public String getsFincStatCd() {
        return sFincStatCd;
    }

    /**
     * @param sFincStatCd the sFincStatCd to set
     */
    public void setsFincStatCd(String sFincStatCd) {
        this.sFincStatCd = sFincStatCd;
    }

    /**
     * @return the sStartFincReqDt
     */
    public Date getsStartFincReqDt() {
        return sStartFincReqDt;
    }

    /**
     * @param sStartFincReqDt the sStartFincReqDt to set
     */
    public void setsStartFincReqDt(Date sStartFincReqDt) {
        this.sStartFincReqDt = sStartFincReqDt;
    }

    /**
     * @return the sEndFincReqDt
     */
    public Date getsEndFincReqDt() {
        return sEndFincReqDt;
    }

    /**
     * @param sEndFincReqDt the sEndFincReqDt to set
     */
    public void setsEndFincReqDt(Date sEndFincReqDt) {
        this.sEndFincReqDt = sEndFincReqDt;
    }

    /**
     * @return the sFincCmpCd
     */
    public String getsFincCmpCd() {
        return sFincCmpCd;
    }

    /**
     * @param sFincCmpCd the sFincCmpCd to set
     */
    public void setsFincCmpCd(String sFincCmpCd) {
        this.sFincCmpCd = sFincCmpCd;
    }

    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }

    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }

    /**
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }

    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }

    /**
     * @return the sOcnCd
     */
    public String getsOcnCd() {
        return sOcnCd;
    }

    /**
     * @param sOcnCd the sOcnCd to set
     */
    public void setsOcnCd(String sOcnCd) {
        this.sOcnCd = sOcnCd;
    }

    /**
     * @return the sExtColorCd
     */
    public String getsExtColorCd() {
        return sExtColorCd;
    }

    /**
     * @param sExtColorCd the sExtColorCd to set
     */
    public void setsExtColorCd(String sExtColorCd) {
        this.sExtColorCd = sExtColorCd;
    }

    /**
     * @return the sIntColorCd
     */
    public String getsIntColorCd() {
        return sIntColorCd;
    }

    /**
     * @param sIntColorCd the sIntColorCd to set
     */
    public void setsIntColorCd(String sIntColorCd) {
        this.sIntColorCd = sIntColorCd;
    }

    /**
     * @return the sContractNo
     */
    public String getsContractNo() {
        return sContractNo;
    }

    /**
     * @param sContractNo the sContractNo to set
     */
    public void setsContractNo(String sContractNo) {
        this.sContractNo = sContractNo;
    }

    /**
     * @return the sFincNo
     */
    public String getsFincNo() {
        return sFincNo;
    }

    /**
     * @param sFincNo the sFincNo to set
     */
    public void setsFincNo(String sFincNo) {
        this.sFincNo = sFincNo;
    }

    /**
     * @return the sCustCd
     */
    public String getsCustCd() {
        return sCustCd;
    }

    /**
     * @param sCustCd the sCustCd to set
     */
    public void setsCustCd(String sCustCd) {
        this.sCustCd = sCustCd;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
