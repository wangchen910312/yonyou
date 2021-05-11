package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 기타사항 조회 SearchVO
 * </pre>
 *
 * @ClassName   : EtcIssueManageSearchVO.java
 * @Description : 기타사항관리 조회 SearchVO.
 * @author Kyung Mok Kim
 * @since 2016. 9. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 14.   Kyung Mok Kim     최초 생성
 * </pre>
 */

public class EtcIssueManageSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6947437845028486983L;

    /**
     * 조회조건 - 딜러코드
     */
    private String  sDlrCd;


    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

}
