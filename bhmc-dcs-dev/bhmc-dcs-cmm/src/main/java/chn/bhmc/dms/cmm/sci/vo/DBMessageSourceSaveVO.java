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
 * @ClassName   : DBMessageSourceSaveVO.java
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
    @ValidField(field="mesgSeq", mesgKey="global.lbl.no")
    ,@ValidField(field="bundleNm", mesgKey="global.lbl.bundle")
    ,@ValidField(field="langCd", mesgKey="global.lbl.langCd")
    ,@ValidField(field="cntryCd", mesgKey="global.lbl.cntryCd")
    ,@ValidField(field="mesgKey", mesgKey="global.lbl.mesgKey")
    ,@ValidField(field="mesgTxt", mesgKey="global.lbl.mesgTxt")
})
public class DBMessageSourceSaveVO extends BaseSaveVO<DBMessageSourceVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;

    public List<DBMessageSourceVO> batchUploadList = new ArrayList<DBMessageSourceVO>();

    /**
     * @return the batchUploadList
     */
    public List<DBMessageSourceVO> getBatchUploadList() {
        return batchUploadList;
    }

    /**
     * @param batchUploadList the batchUploadList to set
     */
    public void setBatchUploadList(List<DBMessageSourceVO> batchUploadList) {
        this.batchUploadList = batchUploadList;
    }



}
