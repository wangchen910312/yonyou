package chn.bhmc.dms.sal.fin.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * @ClassName   : PayInfoSearchVO
 * @Description : 수납관리 조회 VO
 * @author Kang Seok Han
 * @since 2017. 1. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 09.    Kim Jin Suk      최초 생성
 * </pre>
 */

public class PayInfoSearchVO extends BaseSearchVO{

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 9061560084199329770L;
    
    /**
     * 정산일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date    sRctFromDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date    sRctToDt;

    /**
     * 수납완료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date    sCompFromDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date    sCompToDt;
    
    /**
     * vin no
     **/
    private  String  sVinNo;

    /**
     * 계약번호
     **/
    private  String  sJobContractNo;
    
    /**
     * 고객명
     **/
    private  String  sCustNm;
    private  String  sCustNo;
    
    /**
     * sPaymentTp
     **/
    private  String  sPaymentTp;
    
    /**
     * sPayEmpNo
     **/
    private  String  sPayEmpNo;
    
    /**
     * 관련업무
     **/
    private  String  sJobTp;
    
    /**
     * 딜러코드
     **/
    private  String  sDlrCd;
    
    /**
     * 수납문서번호
     **/
    private  String  sFinDocNo;

    /**
     * 삭제건 제외
     **/
    private  String  sDelYn;
    
    /**
     * seq 리스트
     **/
    private  List<?> sSeqList;
    
    
    /**
     * @return the sRctFromDt
     */
    public Date getsRctFromDt() {
        return sRctFromDt;
    }

    /**
     * @param sRctFromDt the sRctFromDt to set
     */
    public void setsRctFromDt(Date sRctFromDt) {
        this.sRctFromDt = sRctFromDt;
    }

    /**
     * @return the sRctToDt
     */
    public Date getsRctToDt() {
        return sRctToDt;
    }

    /**
     * @param sRctToDt the sRctToDt to set
     */
    public void setsRctToDt(Date sRctToDt) {
        this.sRctToDt = sRctToDt;
    }

    /**
     * @return the sCompFromDt
     */
    public Date getsCompFromDt() {
        return sCompFromDt;
    }

    /**
     * @param sCompFromDt the sCompFromDt to set
     */
    public void setsCompFromDt(Date sCompFromDt) {
        this.sCompFromDt = sCompFromDt;
    }

    /**
     * @return the sCompToDt
     */
    public Date getsCompToDt() {
        return sCompToDt;
    }

    /**
     * @param sCompToDt the sCompToDt to set
     */
    public void setsCompToDt(Date sCompToDt) {
        this.sCompToDt = sCompToDt;
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
     * @return the sJobContractNo
     */
    public String getsJobContractNo() {
        return sJobContractNo;
    }

    /**
     * @param sJobContractNo the sJobContractNo to set
     */
    public void setsJobContractNo(String sJobContractNo) {
        this.sJobContractNo = sJobContractNo;
    }

    /**
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }

    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
    }

    /**
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }

    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }

    /**
     * @return the sPaymentTp
     */
    public String getsPaymentTp() {
        return sPaymentTp;
    }

    /**
     * @param sPaymentTp the sPaymentTp to set
     */
    public void setsPaymentTp(String sPaymentTp) {
        this.sPaymentTp = sPaymentTp;
    }

    /**
     * @return the sPayEmpNo
     */
    public String getsPayEmpNo() {
        return sPayEmpNo;
    }

    /**
     * @param sPayEmpNo the sPayEmpNo to set
     */
    public void setsPayEmpNo(String sPayEmpNo) {
        this.sPayEmpNo = sPayEmpNo;
    }

    /**
     * @return the sJobTp
     */
    public String getsJobTp() {
        return sJobTp;
    }

    /**
     * @param sJobTp the sJobTp to set
     */
    public void setsJobTp(String sJobTp) {
        this.sJobTp = sJobTp;
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
     * @return the sFinDocNo
     */
    public String getsFinDocNo() {
        return sFinDocNo;
    }

    /**
     * @param sFinDocNo the sFinDocNo to set
     */
    public void setsFinDocNo(String sFinDocNo) {
        this.sFinDocNo = sFinDocNo;
    }
    
    /**
     * @return the sDelYn
     */
    public String getsDelYn() {
        return sDelYn;
    }

    /**
     * @param sDelYn the sDelYn to set
     */
    public void setsDelYn(String sDelYn) {
        this.sDelYn = sDelYn;
    }

    /**
     * @return the sSeqList
     */
    public List<?> getsSeqList() {
        return sSeqList;
    }

    /**
     * @param sSeqList the sSeqList to set
     */
    public void setsSeqList(List<?> sSeqList) {
        this.sSeqList = sSeqList;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
