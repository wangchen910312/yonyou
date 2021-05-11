package chn.bhmc.dms.ser.ro.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkAssignSaveVO.java
 * @Description : 작업배정.
 * @author Yin Xueyuan
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 1.     Yin Xueyuan     최초 생성
 * </pre>
 */

@ValidDescriptor({
     @ValidField(field="roDocNo", mesgKey="ser.lbl.roDocNo")
    ,@ValidField(field="rpirCd", mesgKey="ser.lbl.lbrCd")
    ,@ValidField(field="realTecId", mesgKey="ser.lbl.tecNm")
    ,@ValidField(field="wrkEndDt", mesgKey="ser.lbl.preCompDt")
    ,@ValidField(field="wkgrpCd", mesgKey="ser.lbl.wkgrpNo")
})

public class WorkAssignSaveVO extends BaseSaveVO<WorkAssignVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2695416482791374372L;



}
