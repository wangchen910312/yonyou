package chn.bhmc.dms.ser.cmm.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TabInfoSaveVO.java
 * @Description : 고객요구사항,고장서술, 기타사항 저장 VO
 * @author Kim Kyung Mok
 * @since 2016. 7. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 7.     Kim Kyung Mok     최초 생성
 * </pre>
 */

public class TabInfoSaveVO extends BaseSaveVO<Object> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4874972035470397876L;

    // 고장설명
    TrobleDescVO trobleDescVO;

    // 고객의견
    List<CustDemandVO> custDemandListVO;

    // 기타사항
    List<EtcIssueVO> etcIssueListVO;

    // 부품
    List<ServicePartVO> servicePartListVO;

    // 공임
    List<ServiceLaborVO> serviceLaborListVO;
    
    //수리건의
    List<LbrSuggestVO> lbrSuggestListVO;

    /**
     * @return the trobleDescVO
     */
    public TrobleDescVO getTrobleDescVO() {
        return trobleDescVO;
    }

    /**
     * @param trobleDescVO the trobleDescVO to set
     */
    public void setTrobleDescVO(TrobleDescVO trobleDescVO) {
        this.trobleDescVO = trobleDescVO;
    }

    /**
     * @return the custDemandListVO
     */
    public List<CustDemandVO> getCustDemandListVO() {
        return custDemandListVO;
    }

    /**
     * @param custDemandListVO the custDemandListVO to set
     */
    public void setCustDemandListVO(List<CustDemandVO> custDemandListVO) {
        this.custDemandListVO = custDemandListVO;
    }

    /**
     * @return the etcIssueListVO
     */
    public List<EtcIssueVO> getEtcIssueListVO() {
        return etcIssueListVO;
    }

    /**
     * @param etcIssueListVO the etcIssueListVO to set
     */
    public void setEtcIssueListVO(List<EtcIssueVO> etcIssueListVO) {
        this.etcIssueListVO = etcIssueListVO;
    }

    /**
     * @return the servicePartListVO
     */
    public List<ServicePartVO> getServicePartListVO() {
        return servicePartListVO;
    }

    /**
     * @param servicePartListVO the servicePartListVO to set
     */
    public void setServicePartListVO(List<ServicePartVO> servicePartListVO) {
        this.servicePartListVO = servicePartListVO;
    }

    /**
     * @return the serviceLaborListVO
     */
    public List<ServiceLaborVO> getServiceLaborListVO() {
        return serviceLaborListVO;
    }

    /**
     * @param serviceLaborListVO the serviceLaborListVO to set
     */
    public void setServiceLaborListVO(List<ServiceLaborVO> serviceLaborListVO) {
        this.serviceLaborListVO = serviceLaborListVO;
    }

    public List<LbrSuggestVO> getLbrSuggestListVO() {
        return lbrSuggestListVO;
    }

    public void setLbrSuggestListVO(List<LbrSuggestVO> lbrSuggestListVO) {
        this.lbrSuggestListVO = lbrSuggestListVO;
    }
    
    

}
