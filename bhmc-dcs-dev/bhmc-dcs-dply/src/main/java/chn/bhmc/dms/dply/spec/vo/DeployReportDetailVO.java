package chn.bhmc.dms.dply.spec.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeployReportDetail.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class DeployReportDetailVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7594355524175398797L;

    private String specTpNm               ;

    private int    seq                    ;

    private String deployProcYn           ;

    private String deployProcDt           ;

    private String deployRsltCd           ;

    private String deployRsltMesgCont     ;

    private String operCmdNm              ;

    private String deployItem             ;

    private String rollbackRsltCd         ;

    private String rollbackRsltMesgCont   ;

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
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param deployProcYn the deployProcYn to set
     */
    public void setDeployProcYn(String deployProcYn) {
        this.deployProcYn = deployProcYn;
    }

    /**
     * @return the deployProcYn
     */
    public String getDeployProcYn() {
        return deployProcYn;
    }

    /**
     * @param deployProcDt the deployProcDt to set
     */
    public void setDeployProcDt(String deployProcDt) {
        this.deployProcDt = deployProcDt;
    }

    /**
     * @return the deployProcDt
     */
    public String getDeployProcDt() {
        return deployProcDt;
    }

    /**
     * @param deployRsltMesgCont the deployRsltMesgCont to set
     */
    public void setDeployRsltMesgCont(String deployRsltMesgCont) {
        this.deployRsltMesgCont = deployRsltMesgCont;
    }

    /**
     * @return the deployRsltMesgCont
     */
    public String getDeployRsltMesgCont() {
        return deployRsltMesgCont;
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
     * @param rollbackRsltCd the rollbackRsltCd to set
     */
    public void setRollbackRsltCd(String rollbackRsltCd) {
        this.rollbackRsltCd = rollbackRsltCd;
    }

    /**
     * @return the rollbackRsltCd
     */
    public String getRollbackRsltCd() {
        return rollbackRsltCd;
    }

    /**
     * @param rollbackRsltMesgCont the rollbackRsltMesgCont to set
     */
    public void setRollbackRsltMesgCont(String rollbackRsltMesgCont) {
        this.rollbackRsltMesgCont = rollbackRsltMesgCont;
    }

    /**
     * @return the rollbackRsltMesgCont
     */
    public String getRollbackRsltMesgCont() {
        return rollbackRsltMesgCont;
    }

    /**
     * @param deployRsltCd the deployRsltCd to set
     */
    public void setDeployRsltCd(String deployRsltCd) {
        this.deployRsltCd = deployRsltCd;
    }

    /**
     * @return the deployRsltCd
     */
    public String getDeployRsltCd() {
        return deployRsltCd;
    }


}
