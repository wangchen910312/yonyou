package chn.bhmc.dms.crm.cmm.vo;

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
 * @ClassName   : CrmTargExtractSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author hyoung jun an
 * @since 2016. 4. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 30.   hyoung jun an     최초 생성
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
public class CrmTargExtractSaveVO {

    @Valid
    CrmTargExtractVO extractList = new CrmTargExtractVO();

    @Valid
    List<CrmTargExtractVO> extractSaveList = new ArrayList<CrmTargExtractVO>();

    /**
     * @return the extractList
     */
    public CrmTargExtractVO getExtractList() {
        return extractList;
    }

    /**
     * @param extractList the extractList to set
     */
    public void setExtractList(CrmTargExtractVO extractList) {
        this.extractList = extractList;
    }

    /**
     * @return the extractSaveList
     */
    public List<CrmTargExtractVO> getExtractSaveList() {
        return extractSaveList;
    }

    /**
     * @param extractSaveList the extractSaveList to set
     */
    public void setExtractSaveList(List<CrmTargExtractVO> extractSaveList) {
        this.extractSaveList = extractSaveList;
    }
}