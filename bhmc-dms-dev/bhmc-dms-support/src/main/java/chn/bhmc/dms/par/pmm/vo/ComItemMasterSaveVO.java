package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ComItemMasterSaveVO.java
 * @Description : ComItemMasterSaveVO Class
 * @author Eun Jung Jang
 * @since 2016. 5. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 13.     Eun Jung Jang      최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="itemCd", mesgKey="par.lbl.itemCd")
    ,@ValidField(field="comItemCd", mesgKey="par.lbl.comItemCd")
    ,@ValidField(field="remark", mesgKey="par.lbl.remark")
    ,@ValidField(field="regUsrId", mesgKey="par.lbl.regUsrId")
    ,@ValidField(field="regDt", mesgKey="par.lbl.regDt")
    ,@ValidField(field="updtUsrId", mesgKey="par.lbl.updtUsrId")
    ,@ValidField(field="updtDt", mesgKey="par.lbl.updtDt")
})
public class ComItemMasterSaveVO extends BaseSaveVO<ComItemMasterVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7723810943221151958L;

    private  ComItemMasterVO          comItemMasterVO;

    /**
     * @return the comItemMasterVO
     */
    public ComItemMasterVO getComItemMasterVO() {
        return comItemMasterVO;
    }

    /**
     * @param comItemMasterVO the comItemMasterVO to set
     */
    public void setComItemMasterVO(ComItemMasterVO comItemMasterVO) {
        this.comItemMasterVO = comItemMasterVO;
    }
}
