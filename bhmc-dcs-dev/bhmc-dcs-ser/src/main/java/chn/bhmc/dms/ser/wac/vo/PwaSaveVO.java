package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 2. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 26.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="vinNo", mesgKey="global.lbl.vinNo")
    ,@ValidField(field="cauOperAtcCd", mesgKey="ser.lbl.mainLbrCd")
    ,@ValidField(field="pwaTpCd1", mesgKey="ser.lbl.pwaTpCd1")
})
public class PwaSaveVO extends BaseSaveVO<Object>{
    
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -1614165271874504325L;

    private String pwaDocNo; 
    
    private PwaVO pwaFormVO;
    
    private BaseSaveVO<PwaLbrVO> pwaLbrSaveVO;
    
    private BaseSaveVO<PwaPartVO> pwaPartSaveVO;

    
    /**
     * @return the pwaDocNo
     */
    public String getPwaDocNo() {
        return pwaDocNo;
    }

    /**
     * @param pwaDocNo the pwaDocNo to set
     */
    public void setPwaDocNo(String pwaDocNo) {
        this.pwaDocNo = pwaDocNo;
    }

    /**
     * @return the pwaFormVO
     */
    public PwaVO getPwaFormVO() {
        return pwaFormVO;
    }

    /**
     * @param pwaFormVO the pwaFormVO to set
     */
    public void setPwaFormVO(PwaVO pwaFormVO) {
        this.pwaFormVO = pwaFormVO;
    }

    /**
     * @return the pwaLbrSaveVO
     */
    public BaseSaveVO<PwaLbrVO> getPwaLbrSaveVO() {
        return pwaLbrSaveVO;
    }

    /**
     * @param pwaLbrSaveVO the pwaLbrSaveVO to set
     */
    public void setPwaLbrSaveVO(BaseSaveVO<PwaLbrVO> pwaLbrSaveVO) {
        this.pwaLbrSaveVO = pwaLbrSaveVO;
    }

    /**
     * @return the pwaPartSaveVO
     */
    public BaseSaveVO<PwaPartVO> getPwaPartSaveVO() {
        return pwaPartSaveVO;
    }

    /**
     * @param pwaPartSaveVO the pwaPartSaveVO to set
     */
    public void setPwaPartSaveVO(BaseSaveVO<PwaPartVO> pwaPartSaveVO) {
        this.pwaPartSaveVO = pwaPartSaveVO;
    }

     
    

}
