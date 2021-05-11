package chn.bhmc.dms.crm.mcm.vo;

import chn.bhmc.dms.cmm.apr.vo.SignLineVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MarketingCampaignSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author hyoung jun an
 * @since 2016. 3. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 10.   hyoung jun an     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="makCd"            , mesgKey="global.lbl.makCd")
   ,@ValidField(field="imsSuptAmt"       , mesgKey="global.lbl.imsSuptAmt")
   })

public class MarketingCampaignSignVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8576209622208157525L;

    private SignLineVO signLineVO;

    private String makCd;
    private String reqTitleNm;
    private String tempSaveYn;


    /**
     * @return the signLineVO
     */
    public SignLineVO getSignLineVO() {
        return signLineVO;
    }
    /**
     * @param signLineVO the signLineVO to set
     */
    public void setSignLineVO(SignLineVO signLineVO) {
        this.signLineVO = signLineVO;
    }

    /**
     * @return the makCd
     */
    public String getMakCd() {
        return makCd;
    }
    /**
     * @param makCd the makCd to set
     */
    public void setMakCd(String makCd) {
        this.makCd = makCd;
    }
    /**
     * @return the reqTitleNm
     */
    public String getReqTitleNm() {
        return reqTitleNm;
    }
    /**
     * @param reqTitleNm the reqTitleNm to set
     */
    public void setReqTitleNm(String reqTitleNm) {
        this.reqTitleNm = reqTitleNm;
    }
    /**
     * @return the tempSaveYn
     */
    public String getTempSaveYn() {
        return tempSaveYn;
    }
    /**
     * @param tempSaveYn the tempSaveYn to set
     */
    public void setTempSaveYn(String tempSaveYn) {
        this.tempSaveYn = tempSaveYn;
    }






}