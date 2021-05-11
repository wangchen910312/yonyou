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
 * @ClassName   : ContractPackageSearchVO
 * @Description : 집단계약 조회 VO
 * @author Kang Seok Han
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

public class ContractPackageSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2500740884019895238L;

    private  String          sDlrCd;

    private  String          sContractTp;

    private  String          sSaleEmpNo;

    private  String          sContractCustNo;

    private  String          sCustTp;

    private  String          sGrpContractNo;

    private  String          sContractStatCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sStartContractDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sEndContractDt;

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
     * @return the sCustTp
     */
    public String getsCustTp() {
        return sCustTp;
    }

    /**
     * @param sCustTp the sCustTp to set
     */
    public void setsCustTp(String sCustTp) {
        this.sCustTp = sCustTp;
    }

    /**
     * @return the sGrpContractNo
     */
    public String getsGrpContractNo() {
        return sGrpContractNo;
    }

    /**
     * @param sGrpContractNo the sGrpContractNo to set
     */
    public void setsGrpContractNo(String sGrpContractNo) {
        this.sGrpContractNo = sGrpContractNo;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
