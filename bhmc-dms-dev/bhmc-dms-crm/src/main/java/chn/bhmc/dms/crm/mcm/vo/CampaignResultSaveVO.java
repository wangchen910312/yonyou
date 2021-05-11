package chn.bhmc.dms.crm.mcm.vo;

import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignResultSaveVO.java
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
   ,@ValidField(field="makNm"            , mesgKey="global.lbl.makNm")

   ,@ValidField(field="seq"              , mesgKey="global.lbl.seq")
   ,@ValidField(field="targCd"           , mesgKey="global.lbl.targ")
   ,@ValidField(field="targNm"           , mesgKey="global.lbl.targ")
   ,@ValidField(field="targCntVal"       , mesgKey="global.lbl.targCntVal")
   ,@ValidField(field="targRsltVal"      , mesgKey="global.lbl.targRsltVal")

   ,@ValidField(field="subyTmplSeq"      , mesgKey="crm.lbl.subyTmplSeq")
   ,@ValidField(field="subyTmplQestSeq"  , mesgKey="crm.lbl.subyTmplQestSeq")
   ,@ValidField(field="answSeq"          , mesgKey="crm.lbl.answSeq")
   })

public class CampaignResultSaveVO extends BaseSaveVO<CampaignResultVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1486468267676209859L;

    private SatisFactionMobileResultVO satisFactionMobileResultVO;//만족도조사결과VO
    private String makCd;

    /**
     * @return the satisFactionMobileResultVO
     */
    public SatisFactionMobileResultVO getSatisFactionMobileResultVO() {
        return satisFactionMobileResultVO;
    }

    /**
     * @param satisFactionMobileResultVO the satisFactionMobileResultVO to set
     */
    public void setSatisFactionMobileResultVO(SatisFactionMobileResultVO satisFactionMobileResultVO) {
        this.satisFactionMobileResultVO = satisFactionMobileResultVO;
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

}