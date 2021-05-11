package chn.bhmc.dms.ser.rcv.vo;

import java.util.List;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.crm.cif.vo.CustChargeHistVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalculateSaveVO.java
 * @Description : 정산 save VO
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.    KyungMok Kim     최초 생성
 * </pre>
 */

@ValidDescriptor({

})
public class ServiceReceiveSaveVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2203335658456307165L;

    ServiceReceiveDetailVO serviceReceiveDetailVO;

    // 적립카드(선불카드)
    MembershipPointHisVO cardPointHisVO;

    // 딜러포인트적립
    MembershipPointHisVO dlrPointAccuVO;
    
    //고객예치금
    CustChargeHistVO custChargeHistVO;
    
    
    List<ServiceReceiveDetailVO> serviceReceiveDetailListVO;
    
    // 적립카드(선불카드)
    List<MembershipPointHisVO> cardPointHisListVO;
    
    // 딜러포인트적립
    List<MembershipPointHisVO> dlrPointAccuListVO;
    
    //고객예치금
    List<CustChargeHistVO> custChargeHistListVO;
    
    

    /**
     * @return the serviceReceiveDetailVO
     */
    public ServiceReceiveDetailVO getServiceReceiveDetailVO() {
        return serviceReceiveDetailVO;
    }

    /**
     * @param serviceReceiveDetailVO the serviceReceiveDetailVO to set
     */
    public void setServiceReceiveDetailVO(ServiceReceiveDetailVO serviceReceiveDetailVO) {
        this.serviceReceiveDetailVO = serviceReceiveDetailVO;
    }

    /**
     * @return the cardPointHisVO
     */
    public MembershipPointHisVO getCardPointHisVO() {
        return cardPointHisVO;
    }

    /**
     * @param cardPointHisVO the cardPointHisVO to set
     */
    public void setCardPointHisVO(MembershipPointHisVO cardPointHisVO) {
        this.cardPointHisVO = cardPointHisVO;
    }

    /**
     * @return the dlrPointAccuVO
     */
    public MembershipPointHisVO getDlrPointAccuVO() {
        return dlrPointAccuVO;
    }

    /**
     * @param dlrPointAccuVO the dlrPointAccuVO to set
     */
    public void setDlrPointAccuVO(MembershipPointHisVO dlrPointAccuVO) {
        this.dlrPointAccuVO = dlrPointAccuVO;
    }

    public List<ServiceReceiveDetailVO> getServiceReceiveDetailListVO() {
        return serviceReceiveDetailListVO;
    }

    public void setServiceReceiveDetailListVO(List<ServiceReceiveDetailVO> serviceReceiveDetailListVO) {
        this.serviceReceiveDetailListVO = serviceReceiveDetailListVO;
    }

    public List<MembershipPointHisVO> getCardPointHisListVO() {
        return cardPointHisListVO;
    }

    public void setCardPointHisListVO(List<MembershipPointHisVO> cardPointHisListVO) {
        this.cardPointHisListVO = cardPointHisListVO;
    }

    public List<MembershipPointHisVO> getDlrPointAccuListVO() {
        return dlrPointAccuListVO;
    }

    public void setDlrPointAccuListVO(List<MembershipPointHisVO> dlrPointAccuListVO) {
        this.dlrPointAccuListVO = dlrPointAccuListVO;
    }

    public CustChargeHistVO getCustChargeHistVO() {
        return custChargeHistVO;
    }

    public void setCustChargeHistVO(CustChargeHistVO custChargeHistVO) {
        this.custChargeHistVO = custChargeHistVO;
    }

    public List<CustChargeHistVO> getCustChargeHistListVO() {
        return custChargeHistListVO;
    }

    public void setCustChargeHistListVO(List<CustChargeHistVO> custChargeHistListVO) {
        this.custChargeHistListVO = custChargeHistListVO;
    }
    
    

}