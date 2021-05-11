package chn.bhmc.dms.cmm.sci.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ZipCodeSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 28.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="zipCd", mesgKey="global.lbl.zipCd")
    ,@ValidField(field="sungCd", mesgKey="global.lbl.sungCd")
    ,@ValidField(field="cityCd", mesgKey="global.lbl.cityCd")
    ,@ValidField(field="distCd", mesgKey="global.lbl.distCd")
    ,@ValidField(field="sungNm", mesgKey="global.lbl.sungNm")
    ,@ValidField(field="cityNm", mesgKey="global.lbl.cityNm")
    ,@ValidField(field="distNm", mesgKey="global.lbl.distNm")
})
public class ZipCodeSaveVO extends BaseSaveVO<ZipCodeVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;

    public List<ZipCodeVO> batchUploadList = new ArrayList<ZipCodeVO>();

    /**
     * @return the batchUploadList
     */
    public List<ZipCodeVO> getBatchUploadList() {
        return batchUploadList;
    }

    /**
     * @param batchUploadList the batchUploadList to set
     */
    public void setBatchUploadList(List<ZipCodeVO> batchUploadList) {
        this.batchUploadList = batchUploadList;
    }

}
