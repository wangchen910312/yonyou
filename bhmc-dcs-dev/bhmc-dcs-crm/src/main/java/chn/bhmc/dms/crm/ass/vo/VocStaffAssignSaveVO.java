package chn.bhmc.dms.crm.ass.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VocStaffAssignSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In moon Lee
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     In moon Lee     최초 생성
 * </pre>
 */

public class VocStaffAssignSaveVO {

    List<VocMgmtVO> assignList = new ArrayList<VocMgmtVO>();

    List<UserVO> userList = new ArrayList<UserVO>();

    /**
     * @return the assignList
     */
    public List<VocMgmtVO> getAssignList() {
        return assignList;
    }

    /**
     * @param assignList the assignList to set
     */
    public void setAssignList(List<VocMgmtVO> assignList) {
        this.assignList = assignList;
    }

    /**
     * @return the userList
     */
    public List<UserVO> getUserList() {
        return userList;
    }

    /**
     * @param userList the userList to set
     */
    public void setUserList(List<UserVO> userList) {
        this.userList = userList;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "VocStaffAssignSaveVO [assignList=" + assignList + ", userList=" + userList + "]";
    }


}
