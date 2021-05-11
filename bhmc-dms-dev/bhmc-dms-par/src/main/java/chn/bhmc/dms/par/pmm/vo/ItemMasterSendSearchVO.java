package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 품목마스터 전송 조회 SearchVO
 *
 * @ClassName   : ItemMasterSendSearchVO.java
 * @Description : ItemMasterSendSearchVO Class
 * @author In Bo Shim
 * @since 2016. 5. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 27.     In Bo Shim     최초 생성
 * </pre>
 */

public class ItemMasterSendSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8354436170987718019L;

    /**
     * 딜러코드
     **/
    private String sDpsDlrCd;

    /**
     * 품목코드
     **/
    private String sDpsPno;

    /**
     * @return the sDpsDlrCd
     */
    public String getsDpsDlrCd() {
        return sDpsDlrCd;
    }

    /**
     * @param sDpsDlrCd the sDpsDlrCd to set
     */
    public void setsDpsDlrCd(String sDpsDlrCd) {
        this.sDpsDlrCd = sDpsDlrCd;
    }

    /**
     * @return the sDpsPno
     */
    public String getsDpsPno() {
        return sDpsPno;
    }

    /**
     * @param sDpsPno the sDpsPno to set
     */
    public void setsDpsPno(String sDpsPno) {
        this.sDpsPno = sDpsPno;
    }

}
