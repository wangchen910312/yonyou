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
 * @ClassName   : ContractSearchVO
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

public class ContractSearchVO extends SearchVO{

    private static final long serialVersionUID = 4995351618121590353L;

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




    /****** 계약품위현황에 필요한 파라미터 추가[2016.02.18/kim yewon] *******/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                 sContractStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                 sContractEndDt;
    private  String                 sExtColorCd;
    private  String                 sIntColorCd;


    /****** 계약품의진척(간반차트)에 필요한 파라미터 추가[2016.02.22/kim yewon] *****/
    private  String                 sListType;
    private  String                 sSearchUserId;



    /**
     * @return the sListType
     */
    public String getsListType() {
        return sListType;
    }

    /**
     * @param sListType the sListType to set
     */
    public void setsListType(String sListType) {
        this.sListType = sListType;
    }

    /**
     * @return the sSearchUserId
     */
    public String getsSearchUserId() {
        return sSearchUserId;
    }

    /**
     * @param sSearchUserId the sSearchUserId to set
     */
    public void setsSearchUserId(String sSearchUserId) {
        this.sSearchUserId = sSearchUserId;
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
     * @return the sContractStartDt
     */
    public Date getsContractStartDt() {
        return sContractStartDt;
    }

    /**
     * @param sContractStartDt the sContractStartDt to set
     */
    public void setsContractStartDt(Date sContractStartDt) {
        this.sContractStartDt = sContractStartDt;
    }

    /**
     * @return the sContractEndDt
     */
    public Date getsContractEndDt() {
        return sContractEndDt;
    }

    /**
     * @param sContractEndDt the sContractEndDt to set
     */
    public void setsContractEndDt(Date sContractEndDt) {
        this.sContractEndDt = sContractEndDt;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
