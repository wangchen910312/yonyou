package chn.bhmc.dms.cmm.sci.vo;

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
 * @ClassName   : SystemConfigInfoSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="prefKey", mesgKey="global.lbl.prefKey")
    ,@ValidField(field="prefVal", mesgKey="global.lbl.prefVal")
    ,@ValidField(field="multiYn", mesgKey="global.lbl.multiYn")
})
public class SystemConfigInfoSaveVO {

    @Valid
    List<SystemConfigInfoVO> updateList = new ArrayList<SystemConfigInfoVO>();

    /**
     * @return the updateList
     */
    public List<SystemConfigInfoVO> getUpdateList() {
        return updateList;
    }

    /**
     * @param updateList the updateList to set
     */
    public void setUpdateList(List<SystemConfigInfoVO> updateList) {
        this.updateList = updateList;
    }


}
