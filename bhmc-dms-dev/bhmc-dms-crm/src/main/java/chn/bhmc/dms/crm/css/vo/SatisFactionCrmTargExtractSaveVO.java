package chn.bhmc.dms.crm.css.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionCrmTargExtractSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author lee in moon
 * @since 2017.08.01.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017.08.01.   lee in moon     최초 생성
 * </pre>
 */
@ValidDescriptor({
     @ValidField(field="dlrCd"           , mesgKey="crm.lbl.dlrCd")
    ,@ValidField(field="custExtrTermNo"  , mesgKey="crm.lbl.custExtrTermNo")
    ,@ValidField(field="custExtrTermNm"  , mesgKey="crm.lbl.custExtrTermNm")
    ,@ValidField(field="randomYn"        , mesgKey="crm.lbl.randomYn")
    ,@ValidField(field="randomCnt"       , mesgKey="crm.lbl.randomCnt")
    ,@ValidField(field="useYn"           , mesgKey="crm.lbl.useYn")

    ,@ValidField(field="detlExtrTermCd"  , mesgKey="crm.lbl.detlExtrTermCd")
    ,@ValidField(field="termVal1"        , mesgKey="crm.lbl.termVal1")
    ,@ValidField(field="termVal2"        , mesgKey="crm.lbl.termVal2")
    ,@ValidField(field="termVal3"        , mesgKey="crm.lbl.termVal3")
    ,@ValidField(field="termVal4"        , mesgKey="crm.lbl.termVal4")
    ,@ValidField(field="termVal5"        , mesgKey="crm.lbl.termVal5")
})
public class SatisFactionCrmTargExtractSaveVO {


    @Valid
    List<SatisFactionCrmTargExtractVO> extractSaveList = new ArrayList<SatisFactionCrmTargExtractVO>();

    /**
     * @return the extractSaveList
     */
    public List<SatisFactionCrmTargExtractVO> getExtractSaveList() {
        return extractSaveList;
    }

    /**
     * @param extractSaveList the extractSaveList to set
     */
    public void setExtractSaveList(List<SatisFactionCrmTargExtractVO> extractSaveList) {
        this.extractSaveList = extractSaveList;
    }

}