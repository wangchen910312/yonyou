package chn.bhmc.dms.ser.ins.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InsSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 5.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class InsRegSaveVO extends BaseSaveVO<Object>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5029937760058644563L;

    private BaseSaveVO<InsRegVO> insReqVO;

    private BaseSaveVO<InsRegDetailVO> insDetailVO;

    private List<InsRegVO> insRegList = new ArrayList<InsRegVO>();

    private String incDocNo;



    /**
     * @return the insRegList
     */
    public List<InsRegVO> getInsRegList() {
        return insRegList;
    }

    /**
     * @param insRegList the insRegList to set
     */
    public void setInsRegList(List<InsRegVO> insRegList) {
        this.insRegList = insRegList;
    }

    /**
     * @return the insReqVO
     */
    public BaseSaveVO<InsRegVO> getInsReqVO() {
        return insReqVO;
    }

    /**
     * @param insReqVO the insReqVO to set
     */
    public void setInsReqVO(BaseSaveVO<InsRegVO> insReqVO) {
        this.insReqVO = insReqVO;
    }

    /**
     * @return the insDetailVO
     */
    public BaseSaveVO<InsRegDetailVO> getInsDetailVO() {
        return insDetailVO;
    }

    /**
     * @param insDetailVO the insDetailVO to set
     */
    public void setInsDetailVO(BaseSaveVO<InsRegDetailVO> insDetailVO) {
        this.insDetailVO = insDetailVO;
    }

    /**
     * @return the incDocNo
     */
    public String getIncDocNo() {
        return incDocNo;
    }

    /**
     * @param incDocNo the incDocNo to set
     */
    public void setIncDocNo(String incDocNo) {
        this.incDocNo = incDocNo;
    }




}
