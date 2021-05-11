package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DcSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 30.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class DcSaveVO extends BaseSaveVO<Object> {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2569810254488832570L;

    DcMasterVO dcMasterVO;

    BaseSaveVO<DcMasterVO> dcMasterVOList = new BaseSaveVO<DcMasterVO>();

    BaseSaveVO<DcDetailVO> dcSaDetailVO = new BaseSaveVO<DcDetailVO>();

    BaseSaveVO<DcDetailVO> dcCustDetailVO = new BaseSaveVO<DcDetailVO>();

    private String dcCd;

    /**
     * @return the dcMasterVO
     */
    public DcMasterVO getDcMasterVO() {
        return dcMasterVO;
    }

    /**
     * @param dcMasterVO the dcMasterVO to set
     */
    public void setDcMasterVO(DcMasterVO dcMasterVO) {
        this.dcMasterVO = dcMasterVO;
    }

    /**
     * @return the dcMasterVOList
     */
    public BaseSaveVO<DcMasterVO> getDcMasterVOList() {
        return dcMasterVOList;
    }

    /**
     * @param dcMasterVOList the dcMasterVOList to set
     */
    public void setDcMasterVOList(BaseSaveVO<DcMasterVO> dcMasterVOList) {
        this.dcMasterVOList = dcMasterVOList;
    }

    /**
     * @return the dcSaDetailVO
     */
    public BaseSaveVO<DcDetailVO> getDcSaDetailVO() {
        return dcSaDetailVO;
    }

    /**
     * @param dcSaDetailVO the dcSaDetailVO to set
     */
    public void setDcSaDetailVO(BaseSaveVO<DcDetailVO> dcSaDetailVO) {
        this.dcSaDetailVO = dcSaDetailVO;
    }

    /**
     * @return the dcCustDetailVO
     */
    public BaseSaveVO<DcDetailVO> getDcCustDetailVO() {
        return dcCustDetailVO;
    }

    /**
     * @param dcCustDetailVO the dcCustDetailVO to set
     */
    public void setDcCustDetailVO(BaseSaveVO<DcDetailVO> dcCustDetailVO) {
        this.dcCustDetailVO = dcCustDetailVO;
    }

    /**
     * @return the dcCd
     */
    public String getDcCd() {
        return dcCd;
    }

    /**
     * @param dcCd the dcCd to set
     */
    public void setDcCd(String dcCd) {
        this.dcCd = dcCd;
    }

}
