package chn.bhmc.dms.cmm.mail.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InternalMailReceiverSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 6.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class InternalMailReceiverSaveVO extends BaseSaveVO<InternalMailReceiverVO> {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7820310523371380077L;

    private InternalMailVO internalMailVO;
    private BaseSaveVO<InternalMailReceiverVO> internalMailRoleVO;
    private BaseSaveVO<InternalMailReceiverVO> internalMailUserVO;
    /**
     * @return the internalMailVO
     */
    public InternalMailVO getInternalMailVO() {
        return internalMailVO;
    }
    /**
     * @param internalMailVO the internalMailVO to set
     */
    public void setInternalMailVO(InternalMailVO internalMailVO) {
        this.internalMailVO = internalMailVO;
    }
    /**
     * @return the internalMailRoleVO
     */
    public BaseSaveVO<InternalMailReceiverVO> getInternalMailRoleVO() {
        return internalMailRoleVO;
    }
    /**
     * @param internalMailRoleVO the internalMailRoleVO to set
     */
    public void setInternalMailRoleVO(BaseSaveVO<InternalMailReceiverVO> internalMailRoleVO) {
        this.internalMailRoleVO = internalMailRoleVO;
    }
    /**
     * @return the internalMailUserVO
     */
    public BaseSaveVO<InternalMailReceiverVO> getInternalMailUserVO() {
        return internalMailUserVO;
    }
    /**
     * @param internalMailUserVO the internalMailUserVO to set
     */
    public void setInternalMailUserVO(BaseSaveVO<InternalMailReceiverVO> internalMailUserVO) {
        this.internalMailUserVO = internalMailUserVO;
    }
}