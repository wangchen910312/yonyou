package chn.bhmc.dms.dply.cmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeployFailContentsVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 6. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 17.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class DeployFailContentsVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5470824102720340752L;

    private String specTpNm          ;

    private String operCmdNm         ;

    private String deployItem        ;

    private String errMsg            ;

    private int    deployFailDmsCnt  ;


    /**
     * @param specTpNm the specTpNm to set
     */
    public void setSpecTpNm(String specTpNm) {
        this.specTpNm = specTpNm;
    }
    /**
     * @return the specTpNm
     */
    public String getSpecTpNm() {
        return specTpNm;
    }
    /**
     * @param operCmdNm the operCmdNm to set
     */
    public void setOperCmdNm(String operCmdNm) {
        this.operCmdNm = operCmdNm;
    }
    /**
     * @return the operCmdNm
     */
    public String getOperCmdNm() {
        return operCmdNm;
    }
    /**
     * @param deployItem the deployItem to set
     */
    public void setDeployItem(String deployItem) {
        this.deployItem = deployItem;
    }
    /**
     * @return the deployItem
     */
    public String getDeployItem() {
        return deployItem;
    }
    /**
     * @param errMsg the errMsg to set
     */
    public void setErrMsg(String errMsg) {
        this.errMsg = errMsg;
    }
    /**
     * @return the errMsg
     */
    public String getErrMsg() {
        return errMsg;
    }
    /**
     * @param deployFailDmsCnt the deployFailDmsCnt to set
     */
    public void setDeployFailDmsCnt(int deployFailDmsCnt) {
        this.deployFailDmsCnt = deployFailDmsCnt;
    }
    /**
     * @return the deployFailDmsCnt
     */
    public int getDeployFailDmsCnt() {
        return deployFailDmsCnt;
    }
}
