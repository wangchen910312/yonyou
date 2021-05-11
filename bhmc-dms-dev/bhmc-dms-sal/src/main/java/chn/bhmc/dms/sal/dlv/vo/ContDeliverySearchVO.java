package chn.bhmc.dms.sal.dlv.vo;

import chn.bhmc.dms.core.datatype.SearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContDeliverySearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author yewon.kim
 * @since 2016. 10. 23
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 23     Kim yewon              최초 생성
 * </pre>
 */

public class ContDeliverySearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    //계약목록
    private String sDlrCd;						//딜러코드
    private String sContractCustNm;				//계약고객명
    private String sContractCustNo;				//계약고객코드
    private String sSaleEmpNm;					//판매고문명
    private String sSaleEmpNo;					//판매고문코드
    private String sHpNo;						//전화번호(핸드폰)

    //차량목록
    private String sCarlineCd;					//차종
    private String sFscCd;                      //차관
    private String sModelCd;					//모델
    private String sOcnCd;						//OCN코드
    private String sExtColorCd;					//외장색코드
    private String sIntColorCd;					//내장색코드
    private String sContractNo;                 //계약번호

    private String sCustSaleDt;					//출고일자
    private String sVinNo;						//VIN NO

    private String sSrchStartDtStr;             //검색시작일
    private String sSrchEndDtStr;               //검색종료일
    private String sCrcReqYn;                   //이상출고심사여부

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
     * @return the sContractCustNm
     */
    public String getsContractCustNm() {
        return sContractCustNm;
    }
    /**
     * @param sContractCustNm the sContractCustNm to set
     */
    public void setsContractCustNm(String sContractCustNm) {
        this.sContractCustNm = sContractCustNm;
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
     * @return the sSaleEmpNm
     */
    public String getsSaleEmpNm() {
        return sSaleEmpNm;
    }
    /**
     * @param sSaleEmpNm the sSaleEmpNm to set
     */
    public void setsSaleEmpNm(String sSaleEmpNm) {
        this.sSaleEmpNm = sSaleEmpNm;
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
     * @return the sHpNo
     */
    public String getsHpNo() {
        return sHpNo;
    }
    /**
     * @param sHpNo the sHpNo to set
     */
    public void setsHpNo(String sHpNo) {
        this.sHpNo = sHpNo;
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
     * @return the sFscCd
     */
    public String getsFscCd() {
        return sFscCd;
    }
    /**
     * @param sFscCd the sFscCd to set
     */
    public void setsFscCd(String sFscCd) {
        this.sFscCd = sFscCd;
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
     * @return the sCustSaleDt
     */
    public String getsCustSaleDt() {
        return sCustSaleDt;
    }
    /**
     * @param sCustSaleDt the sCustSaleDt to set
     */
    public void setsCustSaleDt(String sCustSaleDt) {
        this.sCustSaleDt = sCustSaleDt;
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
     * @return the sSrchStartDtStr
     */
    public String getsSrchStartDtStr() {
        return sSrchStartDtStr;
    }
    /**
     * @param sSrchStartDtStr the sSrchStartDtStr to set
     */
    public void setsSrchStartDtStr(String sSrchStartDtStr) {
        this.sSrchStartDtStr = sSrchStartDtStr;
    }
    /**
     * @return the sSrchEndDtStr
     */
    public String getsSrchEndDtStr() {
        return sSrchEndDtStr;
    }
    /**
     * @param sSrchEndDtStr the sSrchEndDtStr to set
     */
    public void setsSrchEndDtStr(String sSrchEndDtStr) {
        this.sSrchEndDtStr = sSrchEndDtStr;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the sCrcReqYn
     */
    public String getsCrcReqYn() {
        return sCrcReqYn;
    }
    /**
     * @param sCrcReqYn the sCrcReqYn to set
     */
    public void setsCrcReqYn(String sCrcReqYn) {
        this.sCrcReqYn = sCrcReqYn;
    }
}
