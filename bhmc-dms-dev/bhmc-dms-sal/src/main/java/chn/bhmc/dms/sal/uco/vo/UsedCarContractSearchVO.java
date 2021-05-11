package chn.bhmc.dms.sal.uco.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarContractSearchVO
 * @Description : 중고차 - 계약 조회
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.    Kim Jin Suk      최초 생성
 * </pre>
 */

public class UsedCarContractSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5782683815658087706L;

    /**
     * 딜러코드
     **/
    private  String                 sDlrCd;

    /**
     * 계약번호
     **/
    private  String                 sContractNo;

    /**
     * 계약상태코드
     **/
    private  String                 sContractStatCd;

    /**
     * 계약일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sStartContractDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sEndContractDt;
    //private  String                   sStartContractDt;
    //private  String                   sEndContractDt;

    /**
     * 판매사원번호
     **/
    private  String                 sSaleEmpNo;

    /**
     * 계약고객번호
     **/
    private  String                 sContractCustNo;

    /**
     * 자사차 여부
     */
    private  String                 sCorpCarDstinCd;

    /**
     * 보험유형 : 보험내역 저장시, 유효성체크
     */
    private  String                 sIncTp;

    /**
     * 차종
     */
    private  String                 sCarlineCd;

    /**
     * 모델
     */
    private  String                 sModelCd;

    /**
     * OCN
     */
    private  String                 sOcnCd;

    /**
     * 외장색
     */
    private  String                 sExtColorCd;

    /**
     * 내장색
     */
    private  String                 sIntColorCd;

    /**
     * 브랜드
     */
    private  String                 sCarBrandCd;

    /**
     * 차종명
     */
    private  String                 sCarNm;

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
     * @return the sContractStatCd
     */
    public String getsContractStatCd() {
        return sContractStatCd;
    }

    /**
     * @param sContractStatCd the sContractStatCd to set
     */
    public void setsContractStatCd(String sContractStatCd) {
        this.sContractStatCd = sContractStatCd;
    }

    /**
     * @return the sStartContractDt
     */
    public Date getsStartContractDt() {
        return sStartContractDt;
    }

    /**
     * @param sStartContractDt the sStartContractDt to set
     */
    public void setsStartContractDt(Date sStartContractDt) {
        this.sStartContractDt = sStartContractDt;
    }

    /**
     * @return the sEndContractDt
     */
    public Date getsEndContractDt() {
        return sEndContractDt;
    }

    /**
     * @param sEndContractDt the sEndContractDt to set
     */
    public void setsEndContractDt(Date sEndContractDt) {
        this.sEndContractDt = sEndContractDt;
    }

    /**
     * @return the sSaleEmpNo
     */
    public String getsSaleEmpNo() {
        return sSaleEmpNo;
    }

    /**
     * @param sSaleEmpNo the sSaleEmpNo to set
     */
    public void setsSaleEmpNo(String sSaleEmpNo) {
        this.sSaleEmpNo = sSaleEmpNo;
    }

    /**
     * @return the sContractCustNo
     */
    public String getsContractCustNo() {
        return sContractCustNo;
    }

    /**
     * @param sContractCustNo the sContractCustNo to set
     */
    public void setsContractCustNo(String sContractCustNo) {
        this.sContractCustNo = sContractCustNo;
    }

    /**
     * @return the sCorpCarDstinCd
     */
    public String getsCorpCarDstinCd() {
        return sCorpCarDstinCd;
    }

    /**
     * @param sCorpCarDstinCd the sCorpCarDstinCd to set
     */
    public void setsCorpCarDstinCd(String sCorpCarDstinCd) {
        this.sCorpCarDstinCd = sCorpCarDstinCd;
    }

    /**
     * @return the sIncTp
     */
    public String getsIncTp() {
        return sIncTp;
    }

    /**
     * @param sIncTp the sIncTp to set
     */
    public void setsIncTp(String sIncTp) {
        this.sIncTp = sIncTp;
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
     * @return the sCarBrandCd
     */
    public String getsCarBrandCd() {
        return sCarBrandCd;
    }

    /**
     * @param sCarBrandCd the sCarBrandCd to set
     */
    public void setsCarBrandCd(String sCarBrandCd) {
        this.sCarBrandCd = sCarBrandCd;
    }

    /**
     * @return the sCarNm
     */
    public String getsCarNm() {
        return sCarNm;
    }

    /**
     * @param sCarNm the sCarNm to set
     */
    public void setsCarNm(String sCarNm) {
        this.sCarNm = sCarNm;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
