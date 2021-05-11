package chn.bhmc.dms.bat.crm.cif.service;

import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerInfoVO;
import chn.bhmc.dms.core.support.camel.Data;

//import java.util.List;

//import chn.bhmc.dms.bat.ser.ro.vo.BatIfRepairOrderSearchVO;
//import chn.bhmc.dms.bat.ser.ro.vo.BatIfRepairOrderVO;
//import chn.bhmc.dms.bat.ser.ro.vo.BatRepairOrderVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatIfCustomerInfoDmsService
 * @Description : Customer Info. Interfacd Batch Service
 * @author LEE KYOJIN
 * @since 2016. 5. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 19.     LEE KYOJIN     최초 생성
 * </pre>
 */

public interface BatIfCustomerInfoDmsService {

    /**
     * DMS - DCS로 전송하기위한 고객정보 수집
     * @param null
     * @return Count
     */
    public int selectCustomerInfoDmsDcs() throws Exception;

    /**
     * DMS - DCS로 전송하기위한 고객정보 주소 수집
     * @param null
     * @return Count
     */
    public int selectCustomerInfoAddrDmsDcs() throws Exception;

    /**
     * DMS - DCS로 전송하기위한 고객정보 연계인 수집
     * @param null
     * @return Count
     */
    public int selectCustomerInfoRelCustDmsDcs() throws Exception;

    /**
     * DMS - Original 고객정보 입력 (CR_0101IR --> CR_0101T)
     * @param CR_0101IR
     * @return Count
     */
    public int selectCustomerInfoDmsOriginal() throws Exception;

    /**
     * DMS - Original 고객 주소 입력 (CR_0116IR --> CR_0116T)
     * @param CR_0101IR
     * @return Count
     */
    public int selectCustomerInfoAddrDmsOriginal() throws Exception;

    /**
     * DMS - Original 고객 연계인 입력 (CR_0111IR --> CR_0111T)
     * @param CR_0111IR
     * @return Count.
     */
    public int selectCustomerInfoRelDmsOriginal() throws Exception;

    /**
     * 판매기회에서 고객데이터 업데이트
     * @param null
     * @return Count.
     */
    public int updateCustomerFromSalesOppt(BatCustomerInfoVO batCustomerInfoVO) throws Exception;

    /**
     * Siebel RowId로 고객 존재여부 확인
     * @param null
     * @return Count.
     */
    public int selectCustomerRowId(BatCustomerInfoVO customerInfoVO) throws Exception;

    /**
     * 고객신규등록
     * Statements
     *
     * @param customerInfoVO
     * @return
     * @throws Exception
     */
    public BatCustomerInfoVO insertCustomer(BatCustomerInfoVO customerInfoVO) throws Exception;

    /**
     * Camel Call
     * Statements
     *
     * @param call Camel Id
     * @return
     * @throws Exception
     */
    public Data selectCallCamelClient(String camelId) throws Exception;

}