package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * 거래처 기본정보/연락처 정보 저장 VO
 *
 * @ClassName   : VenderMasterSaveVO.java
 * @Description : VenderMasterSaveVO Class
 * @author In Bo Shim
 * @since 2016. 4. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 21.     In Bo Shim     최초 생성
 * </pre>
 */
public class VenderMasterSaveVO {

    /**
     * 거래처 기본정보 VO
     **/
    private VenderMasterVO venderMasterVO;

    /**
     * 거래처 연락처 정보 추가/수정/삭제 목록 VO
     **/
    private BaseSaveVO<VenderTelVO> venderTelSaveVO;

    /**
     * @return the venderMasterVO
     */
    public VenderMasterVO getVenderMasterVO() {
        return venderMasterVO;
    }

    /**
     * @param venderMasterVO the venderMasterVO to set
     */
    public void setVenderMasterVO(VenderMasterVO venderMasterVO) {
        this.venderMasterVO = venderMasterVO;
    }

    /**
     * @return the venderTelSaveVO
     */
    public BaseSaveVO<VenderTelVO> getVenderTelSaveVO() {
        return venderTelSaveVO;
    }

    /**
     * @param venderTelSaveVO the venderTelSaveVO to set
     */
    public void setVenderTelSaveVO(BaseSaveVO<VenderTelVO> venderTelSaveVO) {
        this.venderTelSaveVO = venderTelSaveVO;
    }
}
