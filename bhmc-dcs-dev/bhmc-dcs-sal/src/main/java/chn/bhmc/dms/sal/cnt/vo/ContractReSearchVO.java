package chn.bhmc.dms.sal.cnt.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractReSearchVO
 * @Description : 클래스 설명을 기술합니다.
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

public class ContractReSearchVO extends SearchVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6320446969727133575L;

    /**
     * 딜러코드
     **/
    private  String                 sDlrCd;

    /**
     * 계약번호
     **/
    private  String                 sContractNo;

    /**
     * 계약유형
     **/
    private  String                 sContractTp;

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
     * 차종코드
     **/
    private  String                 sCarlineCd;

    /**
     * 모델코드
     **/
    private  String                 sModelCd;

    /**
     * OCN코드
     **/
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
     *  프로모션 주관
     */
    private  String                 sPromotionOwnCd;

    /**
     * 프로모션 금액 : 직책별 할인내역 체크 (계약 저장 시)
     */
    private  double                 sPromotionAmt;

    /**
     * 보험유형 : 보험내역 저장시, 유효성체크
     */
    private  String                 sIncTp;

    /**
     * 계약용품 : 팝업조회
     */
    private  String                 sItemCd;
    private  String                 sItemNm;
    private  String                 sStrgeCd;

    /**
     * VIN NO : 팝업조회
     */
    private  String                 sVinNo1;
    private  String                 sVinNo2;

    /**
     * 판매기회번호
     */
    private  String                 sSaleOpptNo;

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
     * @return the sContractTp
     */
    public String getsContractTp() {
        return sContractTp;
    }
    /**
     * @param sContractTp the sContractTp to set
     */
    public void setsContractTp(String sContractTp) {
        this.sContractTp = sContractTp;
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
     * @return the sPromotionOwnCd
     */
    public String getsPromotionOwnCd() {
        return sPromotionOwnCd;
    }
    /**
     * @param sPromotionOwnCd the sPromotionOwnCd to set
     */
    public void setsPromotionOwnCd(String sPromotionOwnCd) {
        this.sPromotionOwnCd = sPromotionOwnCd;
    }
    /**
     * @return the sPromotionAmt
     */
    public double getsPromotionAmt() {
        return sPromotionAmt;
    }
    /**
     * @param sPromotionAmt the sPromotionAmt to set
     */
    public void setsPromotionAmt(double sPromotionAmt) {
        this.sPromotionAmt = sPromotionAmt;
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
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }
    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }
    /**
     * @return the sItemNm
     */
    public String getsItemNm() {
        return sItemNm;
    }
    /**
     * @param sItemNm the sItemNm to set
     */
    public void setsItemNm(String sItemNm) {
        this.sItemNm = sItemNm;
    }
    /**
     * @return the sStrgeCd
     */
    public String getsStrgeCd() {
        return sStrgeCd;
    }
    /**
     * @param sStrgeCd the sStrgeCd to set
     */
    public void setsStrgeCd(String sStrgeCd) {
        this.sStrgeCd = sStrgeCd;
    }
    /**
     * @return the sVinNo1
     */
    public String getsVinNo1() {
        return sVinNo1;
    }
    /**
     * @param sVinNo1 the sVinNo1 to set
     */
    public void setsVinNo1(String sVinNo1) {
        this.sVinNo1 = sVinNo1;
    }
    /**
     * @return the sVinNo2
     */
    public String getsVinNo2() {
        return sVinNo2;
    }
    /**
     * @param sVinNo2 the sVinNo2 to set
     */
    public void setsVinNo2(String sVinNo2) {
        this.sVinNo2 = sVinNo2;
    }

    /**
     * @return the sSaleOpptNo
     */
    public String getsSaleOpptNo() {
        return sSaleOpptNo;
    }
    /**
     * @param sSaleOpptNo the sSaleOpptNo to set
     */
    public void setsSaleOpptNo(String sSaleOpptNo) {
        this.sSaleOpptNo = sSaleOpptNo;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
