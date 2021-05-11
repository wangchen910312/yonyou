package chn.bhmc.dms.cmm.cmp.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * 판매고문직무상세 일괄등록 VO
 * </pre>
 *
 * @ClassName   : SalesMgrDetlSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 7. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 27.     Kang Seok Han     최초 생성
 * </pre>
 */

@ValidDescriptor({
     @ValidField(field="saleMgrDetlCd", mesgKey="global.lbl.saleMgrDetlCd")
    ,@ValidField(field="saleMgrDetlNm", mesgKey="global.lbl.saleMgrDetlNm")
    ,@ValidField(field="useYn", mesgKey="global.lbl.useYn")
})
public class SalesMgrDetlSaveVO extends BaseSaveVO<SalesMgrDetlVO> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5694192710661651339L;

}
