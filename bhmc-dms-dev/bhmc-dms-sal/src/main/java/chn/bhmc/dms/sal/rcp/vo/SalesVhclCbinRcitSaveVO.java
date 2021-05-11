package chn.bhmc.dms.sal.rcp.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * 영수증관리 > 기동차통일영수증관리
 * </pre>
 *
 * @ClassName   : SalesVhclCbinRcitSaveVO.java
 * @Description : 영수증관리 > 기동차통일영수증관리
 * @author chibeom.song
 * @since 2017. 2. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 20.   chibeom.song     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="carId", mesgKey="sal.lbl.carId")
})
public class SalesVhclCbinRcitSaveVO extends BaseSaveVO<SalesVhclCbinRcitVO> {

    private static final long serialVersionUID = -1210745396214803853L;

    public List<SalesVhclCbinRcitVO> vhclCbinRcitList = new ArrayList<SalesVhclCbinRcitVO>();

    /**
     * @return the vhclCbinRcitList
     */
    public List<SalesVhclCbinRcitVO> getVhclCbinRcitList() {
        return vhclCbinRcitList;
    }

    /**
     * @param vhclCbinRcitList
     * @param vhclCbinRcitList the vhclCbinRcitList to set
     */
    public void setVhclCbinRcitList(List<SalesVhclCbinRcitVO> targetSaleProfitList, List<SalesVhclCbinRcitVO> vhclCbinRcitList) {
        this.vhclCbinRcitList = vhclCbinRcitList;
    }

}
