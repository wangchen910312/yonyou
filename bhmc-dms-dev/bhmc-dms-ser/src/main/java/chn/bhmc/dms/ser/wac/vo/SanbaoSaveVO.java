package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 21.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

 
public class SanbaoSaveVO extends BaseSaveVO<Object>{
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 1851268889935220751L;

    private BaseSaveVO<SanbaoPartVO> sanbaoPartVO;
    
    private SanbaoVO sanbaoVO;
    
    /**
     * 문서번호
     */
    private String docNo;

    /**
     * @return the sanbaoPartVO
     */
    public BaseSaveVO<SanbaoPartVO> getSanbaoPartVO() {
        return sanbaoPartVO;
    }

    /**
     * @param sanbaoPartVO the sanbaoPartVO to set
     */
    public void setSanbaoPartVO(BaseSaveVO<SanbaoPartVO> sanbaoPartVO) {
        this.sanbaoPartVO = sanbaoPartVO;
    }

    /**
     * @return the sanbaoVO
     */
    public SanbaoVO getSanbaoVO() {
        return sanbaoVO;
    }

    /**
     * @param sanbaoVO the sanbaoVO to set
     */
    public void setSanbaoVO(SanbaoVO sanbaoVO) {
        this.sanbaoVO = sanbaoVO;
    }

    /**
     * @return the docNo
     */
    public String getDocNo() {
        return docNo;
    }

    /**
     * @param docNo the docNo to set
     */
    public void setDocNo(String docNo) {
        this.docNo = docNo;
    }

    
    
    

}
