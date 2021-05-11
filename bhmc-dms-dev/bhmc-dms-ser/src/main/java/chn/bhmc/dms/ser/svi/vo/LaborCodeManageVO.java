package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LaborCodeMangeVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki Hyun Kwon
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.     Ki Hyun Kwon     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="lbrCd", mesgKey="global.lbl.lbrCd")
    ,@ValidField(field="lbrQty", mesgKey="global.lbl.qty")
    ,@ValidField(field="lbrEnNm", mesgKey="global.lbl.lbrEnNm")
    ,@ValidField(field="lbrChnNm", mesgKey="global.lbl.lbrChnNm")
})
public class LaborCodeManageVO extends BaseSaveVO<Object>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8799994745732945107L;


    private LaborCodeMasterVO laborCodeMasterVO;

    private BaseSaveVO<LaborCodeMasterVO> laborCodeMasterListVO;

    private BaseSaveVO<LaborCodeDetailVO> laborCodeDetailVO;

    private String dstinCd;
    /**
     * 딜러 코드
     */
    private String dlrCd;

    /**
     * 공임코드
     */
    private String lbrCd;

    /**
     * @return the laborCodeMasterVO
     */
    public LaborCodeMasterVO getLaborCodeMasterVO() {
        return laborCodeMasterVO;
    }

    /**
     * @param laborCodeMasterVO the laborCodeMasterVO to set
     */
    public void setLaborCodeMasterVO(LaborCodeMasterVO laborCodeMasterVO) {
        this.laborCodeMasterVO = laborCodeMasterVO;
    }

    /**
     * @return the laborCodeDetailVO
     */
    public BaseSaveVO<LaborCodeDetailVO> getLaborCodeDetailVO() {
        return laborCodeDetailVO;
    }

    /**
     * @param laborCodeDetailVO the laborCodeDetailVO to set
     */
    public void setLaborCodeDetailVO(BaseSaveVO<LaborCodeDetailVO> laborCodeDetailVO) {
        this.laborCodeDetailVO = laborCodeDetailVO;
    }

    /**
     * @return the dstinCd
     */
    public String getDstinCd() {
        return dstinCd;
    }

    /**
     * @param dstinCd the dstinCd to set
     */
    public void setDstinCd(String dstinCd) {
        this.dstinCd = dstinCd;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the lbrCd
     */
    public String getLbrCd() {
        return lbrCd;
    }

    /**
     * @param lbrCd the lbrCd to set
     */
    public void setLbrCd(String lbrCd) {
        this.lbrCd = lbrCd;
    }

    /**
     * @return the laborCodeMasterListVO
     */
    public BaseSaveVO<LaborCodeMasterVO> getLaborCodeMasterListVO() {
        return laborCodeMasterListVO;
    }

    /**
     * @param laborCodeMasterListVO the laborCodeMasterListVO to set
     */
    public void setLaborCodeMasterListVO(BaseSaveVO<LaborCodeMasterVO> laborCodeMasterListVO) {
        this.laborCodeMasterListVO = laborCodeMasterListVO;
    }



}
