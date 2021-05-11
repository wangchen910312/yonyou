package chn.bhmc.dms.mob.api.main.vo;

import java.io.Serializable;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobileMainMappingVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 5. 18.     Kang Seok Han     최초 생성
 * </pre>
 */

public class MobileMainMappingVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2130634656388451682L;

    /**
     * 사용자ID
     */
    private String usrId;

    /**
     * 모바일메인화면구분
     * 01:총경리
     * 02:판매
     * 03:정비
     *
     * 공통코드그룹  COM066 참조
     */
    private String mobMainTp;

    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }

    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    /**
     * @return the mobMainTp
     */
    public String getMobMainTp() {
        return mobMainTp;
    }

    /**
     * @param mobMainTp the mobMainTp to set
     */
    public void setMobMainTp(String mobMainTp) {
        this.mobMainTp = mobMainTp;
    }

}
