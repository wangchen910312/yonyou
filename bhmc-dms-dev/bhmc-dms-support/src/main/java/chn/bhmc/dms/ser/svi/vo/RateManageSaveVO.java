package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RateManageSaveVO.java
 * @Description :  임률코드 화면 수정/저장/삭제 VO
 * @author Yin Xueyuan
 * @since 2016. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 24.     Yin Xueyuan     최초 생성
 * </pre>
 */


public class RateManageSaveVO extends BaseSaveVO<RateManageVO> {

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -6832885613842881145L;

    private RateManageVO rateManageVO;
    
    private String rateDocNo = "";

     

    /**
     * @return the rateManageVO
     */
    public RateManageVO getRateManageVO() {
        return rateManageVO;
    }

    /**
     * @param rateManageVO the rateManageVO to set
     */
    public void setRateManageVO(RateManageVO rateManageVO) {
        this.rateManageVO = rateManageVO;
    }

    /**
     * @return the rateDocNo
     */
    public String getRateDocNo() {
        return rateDocNo;
    }

    /**
     * @param rateDocNo the rateDocNo to set
     */
    public void setRateDocNo(String rateDocNo) {
        this.rateDocNo = rateDocNo;
    }
     
     


}
