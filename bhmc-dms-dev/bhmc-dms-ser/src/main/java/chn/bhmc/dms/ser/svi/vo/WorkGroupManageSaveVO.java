package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

@ValidDescriptor({
    @ValidField(field="wkgrpNo", mesgKey="global.lbl.wkgrpNo")
    ,@ValidField(field="wkgrpNm", mesgKey="global.lbl.wkgrpNm")
    ,@ValidField(field="mngSaId", mesgKey="global.lbl.mngSaNm")
})

public class WorkGroupManageSaveVO extends BaseSaveVO<Object> {

	private static final long serialVersionUID = 7601614535185580114L;
	
	
	BaseSaveVO<WorkGroupMasterVO> workGroupMasterListVO;
	
	BaseSaveVO<WorkGroupDetailVO> workGroupDetailListVO;

    public BaseSaveVO<WorkGroupMasterVO> getWorkGroupMasterListVO() {
        return workGroupMasterListVO;
    }

    public void setWorkGroupMasterListVO(BaseSaveVO<WorkGroupMasterVO> workGroupMasterListVO) {
        this.workGroupMasterListVO = workGroupMasterListVO;
    }

    public BaseSaveVO<WorkGroupDetailVO> getWorkGroupDetailListVO() {
        return workGroupDetailListVO;
    }

    public void setWorkGroupDetailListVO(BaseSaveVO<WorkGroupDetailVO> workGroupDetailListVO) {
        this.workGroupDetailListVO = workGroupDetailListVO;
    }

    
	
	

}
