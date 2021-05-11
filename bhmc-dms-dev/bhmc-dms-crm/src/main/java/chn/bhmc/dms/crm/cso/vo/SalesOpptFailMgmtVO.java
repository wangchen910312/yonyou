package chn.bhmc.dms.crm.cso.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 판매기회 실패 VO
 *
 * @ClassName   : SalesOpptFailVO.java
 * @Description : SalesOpptFailVO Class
 * @author in moon lee
 * @since 2016.03.21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.21     in moon lee     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="saleOpptNo"     , mesgKey="global.lbl.saleOpptSeq")     // 판매기회번호
   ,@ValidField(field="failTpCd"  , mesgKey="global.lbl.failTpCd")                  // 실패유형
   ,@ValidField(field="failCau1Cd"  , mesgKey="global.lbl.failCau1Cd")          // 실패1급원인
   ,@ValidField(field="failCau2Cd"  , mesgKey="global.lbl.failCau2Cd")          // 실패2급원인
})
public class SalesOpptFailMgmtVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5042730199872922038L;


    @NotEmpty
    private  String           saleOpptNo;          // 판매기회일련번호

    @NotEmpty
    private  String           failTpCd;             // 실패유형 / CRM220

    @NotEmpty
    private  String           failCau1Cd;           // 실패 1급 원인 / CRM221

    @NotEmpty
    private  String           failCau2Cd;           // 실패 2급 원인 / CRM222

    private  String           failBrandCd;          // 실패 브랜드

    private  String           failModelCd;          // 실패 차형

    /**
     * @return the saleOpptNo
     */
    public String getSaleOpptNo() {
        return saleOpptNo;
    }

    /**
     * @param saleOpptNo the saleOpptNo to set
     */
    public void setSaleOpptNo(String saleOpptNo) {
        this.saleOpptNo = saleOpptNo;
    }

    /**
     * @return the failTpCd
     */
    public String getFailTpCd() {
        return failTpCd;
    }

    /**
     * @param failTpCd the failTpCd to set
     */
    public void setFailTpCd(String failTpCd) {
        this.failTpCd = failTpCd;
    }

    /**
     * @return the failCau1Cd
     */
    public String getFailCau1Cd() {
        return failCau1Cd;
    }

    /**
     * @param failCau1Cd the failCau1Cd to set
     */
    public void setFailCau1Cd(String failCau1Cd) {
        this.failCau1Cd = failCau1Cd;
    }

    /**
     * @return the failCau2Cd
     */
    public String getFailCau2Cd() {
        return failCau2Cd;
    }

    /**
     * @param failCau2Cd the failCau2Cd to set
     */
    public void setFailCau2Cd(String failCau2Cd) {
        this.failCau2Cd = failCau2Cd;
    }

    /**
     * @return the failBrandCd
     */
    public String getFailBrandCd() {
        return failBrandCd;
    }

    /**
     * @param failBrandCd the failBrandCd to set
     */
    public void setFailBrandCd(String failBrandCd) {
        this.failBrandCd = failBrandCd;
    }

    /**
     * @return the failModelCd
     */
    public String getFailModelCd() {
        return failModelCd;
    }

    /**
     * @param failModelCd the failModelCd to set
     */
    public void setFailModelCd(String failModelCd) {
        this.failModelCd = failModelCd;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "SalesOpptFailMgmtVO [saleOpptNo=" + saleOpptNo + ", failTpCd=" + failTpCd + ", failCau1Cd="
                + failCau1Cd + ", failCau2Cd=" + failCau2Cd + ", failBrandCd=" + failBrandCd + ", failModelCd="
                + failModelCd + "]";
    }




}