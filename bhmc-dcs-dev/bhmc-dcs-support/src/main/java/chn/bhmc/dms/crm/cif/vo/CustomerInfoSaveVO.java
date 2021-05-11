package chn.bhmc.dms.crm.cif.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerInfoSaveVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since     author    description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */



public class CustomerInfoSaveVO {

    private List<CustomerInfoVO> custInfoDS = new ArrayList<CustomerInfoVO>();
    private List<AddressInfoVO> addressDS = new ArrayList<AddressInfoVO>();
    /**
     * @return the custInfoDS
     */
    public List<CustomerInfoVO> getCustInfoDS() {
        return custInfoDS;
    }
    /**
     * @param custInfoDS the custInfoDS to set
     */
    public void setCustInfoDS(List<CustomerInfoVO> custInfoDS) {
        this.custInfoDS = custInfoDS;
    }
    /**
     * @return the addressDS
     */
    public List<AddressInfoVO> getAddressDS() {
        return addressDS;
    }
    /**
     * @param addressDS the addressDS to set
     */
    public void setAddressDS(List<AddressInfoVO> addressDS) {
        this.addressDS = addressDS;
    }

}
