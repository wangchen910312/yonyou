package chn.bhmc.dms.crm.dmm.vo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipIfPaymentRapVO
 * @Description : 블루멤버십 인증목록(인터페이스) VO
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

public class BlueMembershipIfPaymentRapVO extends BlueMembershipIfBaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5727498187901514053L;

    @JsonProperty("Data")
    private List<BlueMembershipIfPaymentVO> dataList;

    public BlueMembershipIfPaymentRapVO(){}

    /**
     * @return the dataList
     */
    public List<BlueMembershipIfPaymentVO> getDataList() {
        return dataList;
    }

    /**
     * @param dataList the dataList to set
     */
    public void setDataList(List<BlueMembershipIfPaymentVO> dataList) {
        this.dataList = dataList;
    }

}
