package chn.bhmc.dms.crm.dmm.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipIfVO
 * @Description : 블루멤버십 회원정보(인터페이스) VO
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

public class BlueMembershipIfConsumeRapVO extends BlueMembershipIfBaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5727498187901514053L;

    @JsonProperty("Data")
    private BlueMembershipIfConsumeVO data;

    public BlueMembershipIfConsumeRapVO(){}

    /**
     * @return the data
     */
    public BlueMembershipIfConsumeVO getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(BlueMembershipIfConsumeVO data) {
        this.data = data;
    }



}