package chn.bhmc.dms.crm.dmm.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipIfConsAndCopnRapVO
 * @Description : 블루멤버십 쿠폰+포인트(인터페이스) VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class BlueMembershipIfConsAndCopnRapVO extends BlueMembershipIfBaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2685724991871997626L;

    @JsonProperty("Data")
    private BlueMembershipIfConsAndCopnVO data;

    public BlueMembershipIfConsAndCopnRapVO(){}

    /**
     * @return the data
     */
    public BlueMembershipIfConsAndCopnVO getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(BlueMembershipIfConsAndCopnVO data) {
        this.data = data;
    }

}
