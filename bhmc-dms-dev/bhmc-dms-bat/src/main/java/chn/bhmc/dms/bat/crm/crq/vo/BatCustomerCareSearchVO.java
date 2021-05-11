package chn.bhmc.dms.bat.crm.crq.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 고객케어미션 조회 SearchVO
 *
 * @ClassName   : CustomerCareSearchVO.java
 * @Description : CustomerCareSearchVO.Class
 * @author in moon lee
 * @since 2016.05.02.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.05.02.     in moon lee     최초 생성
 * </pre>
 */

public class BatCustomerCareSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -870562470961786110L;

    private  String              sDlrCd;                // 딜러코드[고객케어관리]
    private  String              sSysOwnDlrYn;


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
     * @return the sSysOwnDlrYn
     */
    public String getsSysOwnDlrYn() {
        return sSysOwnDlrYn;
    }

    /**
     * @param sSysOwnDlrYn the sSysOwnDlrYn to set
     */
    public void setsSysOwnDlrYn(String sSysOwnDlrYn) {
        this.sSysOwnDlrYn = sSysOwnDlrYn;
    }



}