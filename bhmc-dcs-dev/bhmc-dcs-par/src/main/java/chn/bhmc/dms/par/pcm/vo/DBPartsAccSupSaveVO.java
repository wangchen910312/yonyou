package chn.bhmc.dms.par.pcm.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


@ValidDescriptor({
    @ValidField(field="mesgSeq", mesgKey="global.lbl.no")
    ,@ValidField(field="itemCd", mesgKey="par.lbl.itemCd")
    ,@ValidField(field="bpNm", mesgKey="global.lbl.bpNm")
})
public class DBPartsAccSupSaveVO extends BaseSaveVO<DBPartsAccSupVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;

    public List<DBPartsAccSupVO> batchUploadList = new ArrayList<DBPartsAccSupVO>();

    /**
     * @return the batchUploadList
     */
    public List<DBPartsAccSupVO> getBatchUploadList() {
        return batchUploadList;
    }

    /**
     * @param batchUploadList the batchUploadList to set
     */
    public void setBatchUploadList(List<DBPartsAccSupVO> batchUploadList) {
        this.batchUploadList = batchUploadList;
    }



}
