package chn.bhmc.dms.cmm.cmp.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * 부서정보 일괄등록 VO
 * </pre>
 *
 * @ClassName   : DepartmentSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 11. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 28.     Kang Seok Han     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="cmpTp", mesgKey="global.lbl.cmpTp")
    ,@ValidField(field="deptCd", mesgKey="global.lbl.deptCd")
    ,@ValidField(field="deptNm", mesgKey="global.lbl.deptNm")
    ,@ValidField(field="useYn", mesgKey="global.lbl.useYn")
})
public class DepartmentSaveVO extends BaseSaveVO<DepartmentVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3873795003714628131L;

}
