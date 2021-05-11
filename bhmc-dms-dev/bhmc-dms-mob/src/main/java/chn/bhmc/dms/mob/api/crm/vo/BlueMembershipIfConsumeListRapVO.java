package chn.bhmc.dms.mob.api.crm.vo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.mob.api.crm.vo.BlueMembershipIfConsumeVO;
import chn.bhmc.dms.mob.api.crm.vo.BlueMembershipIfBaseVO;

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

public class BlueMembershipIfConsumeListRapVO extends BlueMembershipIfBaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5727498187901514053L;

    @JsonProperty("Data")
    private List<BlueMembershipIfConsumeVO> dataList;

    public BlueMembershipIfConsumeListRapVO(){}

    /**
     * @return the dataList
     */
    public List<BlueMembershipIfConsumeVO> getDataList() {
        return dataList;
    }

    /**
     * @param dataList the dataList to set
     */
    public void setDataList(List<BlueMembershipIfConsumeVO> dataList) {
        this.dataList = dataList;
    }

}
