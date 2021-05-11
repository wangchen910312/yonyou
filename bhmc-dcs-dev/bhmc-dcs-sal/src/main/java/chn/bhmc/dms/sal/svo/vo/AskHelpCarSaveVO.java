package chn.bhmc.dms.sal.svo.vo;


import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractSearchVO
 * @Description : 계약정보 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 2. 15.    Kim Jin Suk        최초 생성
 * </pre>
 */

public class AskHelpCarSaveVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7325236452633850428L;

    @Valid
    private AskHelpCarVO askHelpCarVO;

    /**
     * 차량 추가목록
     */
    @Valid
    private List<AskHelpCarPopupCarVO> insertHelpCarList = new ArrayList<AskHelpCarPopupCarVO>();

    /**
     * 차량 수정목록
     */
    @Valid
    private List<AskHelpCarPopupCarVO> updateHelpCarList = new ArrayList<AskHelpCarPopupCarVO>();

    /**
     * 차량 삭제목록
     */
    private List<AskHelpCarPopupCarVO> deleteHelpCarList = new ArrayList<AskHelpCarPopupCarVO>();


    /**
     * @return the askHelpCarVO
     */
    public AskHelpCarVO getAskHelpCarVO() {
        return askHelpCarVO;
    }

    /**
     * @param askHelpCarVO the askHelpCarVO to set
     */
    public void setAskHelpCarVO(AskHelpCarVO askHelpCarVO) {
        this.askHelpCarVO = askHelpCarVO;
    }

    /**
     * @return the insertHelpCarList
     */
    public List<AskHelpCarPopupCarVO> getInsertHelpCarList() {
        return insertHelpCarList;
    }

    /**
     * @param insertHelpCarList the insertHelpCarList to set
     */
    public void setInsertHelpCarList(List<AskHelpCarPopupCarVO> insertHelpCarList) {
        this.insertHelpCarList = insertHelpCarList;
    }

    /**
     * @return the updateHelpCarList
     */
    public List<AskHelpCarPopupCarVO> getUpdateHelpCarList() {
        return updateHelpCarList;
    }

    /**
     * @param updateHelpCarList the updateHelpCarList to set
     */
    public void setUpdateHelpCarList(List<AskHelpCarPopupCarVO> updateHelpCarList) {
        this.updateHelpCarList = updateHelpCarList;
    }

    /**
     * @return the deleteHelpCarList
     */
    public List<AskHelpCarPopupCarVO> getDeleteHelpCarList() {
        return deleteHelpCarList;
    }

    /**
     * @param deleteHelpCarList the deleteHelpCarList to set
     */
    public void setDeleteHelpCarList(List<AskHelpCarPopupCarVO> deleteHelpCarList) {
        this.deleteHelpCarList = deleteHelpCarList;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
