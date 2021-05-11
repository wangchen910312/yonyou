package chn.bhmc.dms.sal.fas.vo;

import java.util.ArrayList;

import javax.validation.Valid;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CoercionApprovalVO.java
 * @Description : 강제판매승인 VO
 * @author Jin Suk Kim
 * @since 2016. 3. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 22.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class CoercionApprovalSaveVO extends BaseVO{
    private static final long serialVersionUID = -4411410408776475257L;

    @Valid
    private ArrayList<CoercionApprovalVO> list = new ArrayList<CoercionApprovalVO>();

    /**
     * @return the list
     */
    public ArrayList<CoercionApprovalVO> getList() {
        return list;
    }

    /**
     * @param list the list to set
     */
    public void setList(ArrayList<CoercionApprovalVO> list) {
        this.list = list;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
