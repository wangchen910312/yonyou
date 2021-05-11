package chn.bhmc.dms.sal.aap.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AapInfoSearchVO
 * @Description : 클래스 설명을 기술합니다.
 * @author KimJINSUK
 * @since 2017. 2. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 22.    KimJINSUK              최초 생성
 * </pre>
 */

public class AapInfoSearchVO extends BaseSearchVO {

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 7118558318838807397L;
    
    private String sDlrCd;              // 딜러코드
    private String sContractNo;         // 계약번호
    private String vContractCustNm;     // 고객명
    private String sContractCustNo;     // 고객번호
    private List<String> sAapWorksTp;          // 업무유형
    private String sAapWorkTp;
    private String sSaleEmpNo;          // 판매인
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartContractDt;      // 계약일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndContractDt;        // 계약일자
    
    
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
     * @return the vContractCustNm
     */
    public String getvContractCustNm() {
        return vContractCustNm;
    }
    /**
     * @param vContractCustNm the vContractCustNm to set
     */
    public void setvContractCustNm(String vContractCustNm) {
        this.vContractCustNm = vContractCustNm;
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
     * @return the sAapWorksTp
     */
    public List<String> getsAapWorksTp() {
        return sAapWorksTp;
    }
    /**
     * @param sAapWorksTp the sAapWorksTp to set
     */
    public void setsAapWorksTp(List<String> sAapWorksTp) {
        this.sAapWorksTp = sAapWorksTp;
    }
    /**
     * @return the sAapWorkTp
     */
    public String getsAapWorkTp() {
        return sAapWorkTp;
    }
    /**
     * @param sAapWorkTp the sAapWorkTp to set
     */
    public void setsAapWorkTp(String sAapWorkTp) {
        this.sAapWorkTp = sAapWorkTp;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
}