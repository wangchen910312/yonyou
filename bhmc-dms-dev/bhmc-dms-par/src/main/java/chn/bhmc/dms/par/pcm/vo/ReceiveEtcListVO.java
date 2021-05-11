package chn.bhmc.dms.par.pcm.vo;

import java.io.Serializable;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReceiveEtcListVO.java
 * @Description : ReceiveEtcListVO.class
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */


public class ReceiveEtcListVO extends BaseVO implements Serializable{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2791818344189396054L;


    private  ReceiveEtcVO          receiveEtcVO;

    private  List<ReceiveEtcItemVO>    receiveEtcItemList;

    /**
     * @return the receiveEtcVO
     */
    public ReceiveEtcVO getReceiveEtcVO() {
        return receiveEtcVO;
    }

    /**
     * @param receiveEtcVO the receiveEtcVO to set
     */
    public void setReceiveEtcVO(ReceiveEtcVO receiveEtcVO) {
        this.receiveEtcVO = receiveEtcVO;
    }

    /**
     * @return the receiveEtcItemList
     */
    public List<ReceiveEtcItemVO> getReceiveEtcItemList() {
        return receiveEtcItemList;
    }

    /**
     * @param ReceiveEtcItemVO the ReceiveEtcItemVO to set
     */
    public void setReceiveEtcItemList(List<ReceiveEtcItemVO> receiveEtcItemList) {
        this.receiveEtcItemList = receiveEtcItemList;
    }

}
