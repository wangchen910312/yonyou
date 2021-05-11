package chn.bhmc.dms.bat.crm.css.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatSatisFactionManageSearchVO.java
 * @Description : 만족도 조사 배치를 조회하기 위한 SearchVO
 * @author Kim Hyun Ho
 * @since 2016. 8. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 8.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class BatSatisFactionManageSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4285344022095006639L;


    //[TODO] 조회용

    private String sDlrCd;
    private String sUseYn;
    private String sCustExtrAutoYn;
    private  String           sSeq;
    private  Date              sCurruntDt;


    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }
    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }
    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }
    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }
    /**
     * @return the sCustExtrAutoYn
     */
    public String getsCustExtrAutoYn() {
        return sCustExtrAutoYn;
    }


    /**
     * @return the sSeq
     */
    public String getsSeq() {
        return sSeq;
    }
    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(String sSeq) {
        this.sSeq = sSeq;
    }

    /**
     * @return the sCurruntDt
     */
    public Date getsCurruntDt() {
        return sCurruntDt;
    }
    /**
     * @param sCurruntDt the sCurruntDt to set
     */
    public void setsCurruntDt(Date sCurruntDt) {
        this.sCurruntDt = sCurruntDt;
    }

    /**
     * @param sCustExtrAutoYn the sCustExtrAutoYn to set
     */
    public void setsCustExtrAutoYn(String sCustExtrAutoYn) {
        this.sCustExtrAutoYn = sCustExtrAutoYn;
    }




}
