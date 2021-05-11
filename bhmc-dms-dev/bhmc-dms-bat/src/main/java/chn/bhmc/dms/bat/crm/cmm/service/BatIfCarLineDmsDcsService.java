package chn.bhmc.dms.bat.crm.cmm.service;


//import chn.bhmc.dms.bat.ser.ro.vo.BatIfRepairOrderSearchVO;
//import chn.bhmc.dms.bat.ser.ro.vo.BatIfRepairOrderVO;
//import chn.bhmc.dms.bat.ser.ro.vo.BatRepairOrderVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatIfLeadInfoDmsDcsService
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

public interface BatIfCarLineDmsDcsService {

    /**
     * DMS - DCS로 전송하기위한 관심차종 정보 수집
     * @param null
     * @return Count
     */
    public int selectCarLineDmsDcs() throws Exception;


}