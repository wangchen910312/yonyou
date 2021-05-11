package chn.bhmc.dms.par.cpm.vo;

import java.util.List;

/**
 * 방치품 전송 VO.
 *
 * @ClassName   : LeaveItemSendVO.java
 * @Description : LeaveItemSendVO Class
 * @author In Bo Shim
 * @since 2017. 1. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 23.     In Bo Shim     최초 생성
 * </pre>
 */

public class LeaveItemSendVO {

    /**
     * 방치품 전송 리스트
     */
    private List<LeaveItemVO> list;

    /**
     * 방치품 전체 전송 구분자
     */
    private String sendAllFlag;

    /**
     * @return the list
     */
    public List<LeaveItemVO> getList() {
        return list;
    }

    /**
     * @param list the list to set
     */
    public void setList(List<LeaveItemVO> list) {
        this.list = list;
    }

    /**
     * @return the sendAllFlag
     */
    public String getSendAllFlag() {
        return sendAllFlag;
    }

    /**
     * @param sendAllFlag the sendAllFlag to set
     */
    public void setSendAllFlag(String sendAllFlag) {
        this.sendAllFlag = sendAllFlag;
    }

}
