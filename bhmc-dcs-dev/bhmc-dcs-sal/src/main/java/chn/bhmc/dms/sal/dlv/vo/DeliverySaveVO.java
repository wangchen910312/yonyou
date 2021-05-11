package chn.bhmc.dms.sal.dlv.vo;

import java.util.ArrayList;

import javax.validation.Valid;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeliverySaveVO.java
 * @Description : 집단판매 고객인도
 * @author Kim yewon
 * @since 2016. 4. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 29.     Kim yewon     최초 생성
 * </pre>
 */

public class DeliverySaveVO extends BaseSaveVO<GroupSalesDeliveryVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;

    @Valid
    private ArrayList<DeliveryVO> list = new ArrayList<DeliveryVO>();

    /**
     * @return the list
     */
    public ArrayList<DeliveryVO> getList() {
        return list;
    }

    /**
     * @param list the list to set
     */
    public void setList(ArrayList<DeliveryVO> list) {
        this.list = list;
    }
}
