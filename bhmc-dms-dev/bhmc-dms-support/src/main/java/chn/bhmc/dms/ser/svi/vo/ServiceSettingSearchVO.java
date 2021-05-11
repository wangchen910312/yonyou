package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 서비스설정 조회 SearchVO
 * </pre>
 *
 * @ClassName   : ServiceSettingsSearchVO.java
 * @Description : 서비스설정 조회 SearchVO.
 * @author Yin Xueyuan
 * @since 2016. 7. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 7.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class ServiceSettingSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6947437255468486983L;

    /**
     * 조회조건 - 딜러코드
     */
    private String sDlrCd;


    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }


}
