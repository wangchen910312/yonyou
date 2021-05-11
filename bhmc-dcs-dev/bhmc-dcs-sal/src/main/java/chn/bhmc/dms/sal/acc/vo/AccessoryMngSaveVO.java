package chn.bhmc.dms.sal.acc.vo;

import javax.validation.Valid;

import chn.bhmc.dms.core.datatype.BaseSaveVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AccessoryMngSaveVO
 * @Description : 경품정보관리 save VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 7. 04.    Kim Jin Suk        최초 생성
 * </pre>
 */

public class AccessoryMngSaveVO extends BaseSaveVO<AccessoryMngItemVO>{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2054803684267596857L;

    // 용품
    @Valid
    private AccessoryMngVO goodsMainVO;

    /**
     * @return the goodsMainVO
     */
    public AccessoryMngVO getGoodsMainVO() {
        return goodsMainVO;
    }

    /**
     * @param goodsMainVO the goodsMainVO to set
     */
    public void setGoodsMainVO(AccessoryMngVO goodsMainVO) {
        this.goodsMainVO = goodsMainVO;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
