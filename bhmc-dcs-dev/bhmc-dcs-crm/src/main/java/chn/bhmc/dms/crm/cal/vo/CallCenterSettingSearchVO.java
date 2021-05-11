package chn.bhmc.dms.crm.cal.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 콜센터설정 관리 조회 SearchVO
 *
 * @ClassName   : CallCenterSettingSearchVO.java
 * @Description : CallCenterSettingSearchVO Class
 * @author in moon lee
 * @since 2016.05.05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.05.05.     in moon lee     최초 생성
 * </pre>
 */

public class CallCenterSettingSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1103061946253859410L;

    private  String              sDlrCd;                // 딜러코드

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


}