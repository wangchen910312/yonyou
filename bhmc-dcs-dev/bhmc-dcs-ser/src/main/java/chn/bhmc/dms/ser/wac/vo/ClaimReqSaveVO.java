package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimReqSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class ClaimReqSaveVO extends BaseSaveVO<Object>{
    
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 861079766355283086L;

    private String claimDocNo;
    
    private String crudStatCd;
    
    ClaimReqVO claimReqVO;
    
    BaseSaveVO<ClaimReqLbrVO> claimReqLbrVO;
    
    BaseSaveVO<ClaimReqPartVO> claimReqPartVO;
    
    

    /**
     * @return the crudStatCd
     */
    public String getCrudStatCd() {
        return crudStatCd;
    }

    /**
     * @param crudStatCd the crudStatCd to set
     */
    public void setCrudStatCd(String crudStatCd) {
        this.crudStatCd = crudStatCd;
    }

    /**
     * @return the claimDocNo
     */
    public String getClaimDocNo() {
        return claimDocNo;
    }

    /**
     * @param claimDocNo the claimDocNo to set
     */
    public void setClaimDocNo(String claimDocNo) {
        this.claimDocNo = claimDocNo;
    }

    

    /**
     * @return the claimReqVO
     */
    public ClaimReqVO getClaimReqVO() {
        return claimReqVO;
    }

    /**
     * @param claimReqVO the claimReqVO to set
     */
    public void setClaimReqVO(ClaimReqVO claimReqVO) {
        this.claimReqVO = claimReqVO;
    }

    /**
     * @return the claimReqLbrVO
     */
    public BaseSaveVO<ClaimReqLbrVO> getClaimReqLbrVO() {
        return claimReqLbrVO;
    }

    /**
     * @param claimReqLbrVO the claimReqLbrVO to set
     */
    public void setClaimReqLbrVO(BaseSaveVO<ClaimReqLbrVO> claimReqLbrVO) {
        this.claimReqLbrVO = claimReqLbrVO;
    }

    /**
     * @return the claimReqPartVO
     */
    public BaseSaveVO<ClaimReqPartVO> getClaimReqPartVO() {
        return claimReqPartVO;
    }

    /**
     * @param claimReqPartVO the claimReqPartVO to set
     */
    public void setClaimReqPartVO(BaseSaveVO<ClaimReqPartVO> claimReqPartVO) {
        this.claimReqPartVO = claimReqPartVO;
    }
    
    
    

}
