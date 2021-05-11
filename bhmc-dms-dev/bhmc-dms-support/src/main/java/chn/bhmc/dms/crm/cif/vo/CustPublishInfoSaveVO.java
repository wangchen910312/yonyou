package chn.bhmc.dms.crm.cif.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustPublishInfoSaveVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */

public class CustPublishInfoSaveVO extends BaseSaveVO<CustPublishInfoVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1092389448686588164L;

    public List<CustPublishInfoVO> custPublishInfoList = new ArrayList<CustPublishInfoVO>();

    /**
     * @return the custPublishInfoList
     */
    public List<CustPublishInfoVO> getCustPublishInfoList() {
        return custPublishInfoList;
    }

    /**
     * @param custPublishInfoList the custPublishInfoList to set
     */
    public void setCustPublishInfoList(List<CustPublishInfoVO> custPublishInfoList) {
        this.custPublishInfoList = custPublishInfoList;
    }


}
