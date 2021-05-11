package chn.bhmc.dms.sal.cnt.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * @ClassName   : ContractBeforeSearchVO
 * @Description : 전략출고(선출고관리) 조회 VO
 * @author Kim Jin Suk
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 26.    Kim Jin Suk      최초 생성
 * </pre>
 */

public class ContractBeforeSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6729975592836378353L;

    private  String          sDlrCd;                        // 딜러코드
    private  String          sSaleEmpNo;                    // 판매사원
    private  String          sCustNo;                       // 고객코드
    private  String          sBeContractNo;                 // 선출고 계약번호

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sStartContractDt;              // 계약 시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sEndContractDt;                // 계약 종료일

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
     * @return the sBeContractNo
     */
    public String getsBeContractNo() {
        return sBeContractNo;
    }

    /**
     * @param sBeContractNo the sBeContractNo to set
     */
    public void setsBeContractNo(String sBeContractNo) {
        this.sBeContractNo = sBeContractNo;
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
