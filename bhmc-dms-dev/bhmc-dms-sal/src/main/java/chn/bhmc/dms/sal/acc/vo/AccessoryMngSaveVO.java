package chn.bhmc.dms.sal.acc.vo;

import java.util.List;

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

    // 출고요청 item
    private List<AccessoryMngItemVO> aItemList;

    // 계약에서 저장되는 경우.
    private boolean isContract = false;

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
     * @return the aItemList
     */
    public List<AccessoryMngItemVO> getaItemList() {
        return aItemList;
    }

    /**
     * @param aItemList the aItemList to set
     */
    public void setaItemList(List<AccessoryMngItemVO> aItemList) {
        this.aItemList = aItemList;
    }

    /**
     * @return the isContract
     */
    public boolean isContract() {
        return isContract;
    }

    /**
     * @param isContract the isContract to set
     */
    public void setContract(boolean isContract) {
        this.isContract = isContract;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
