package chn.bhmc.dms.bat.sal.veh.service;

/**
 * VIN RFID Resetss
 *
 * @author Lee Seungmin
 * @since 2017. 6. 7.
 * @version 1.0
 * @see <pre>
 *
 *       수정일               수정자             수정내용
 *  ----------------    ------------    ---------------------------
 *   2017. 6. 7.         Lee Seungmin           최초 생성
 * </pre>
 */

public interface BatchVehRfidResetService {

    // VIN RFID Reset
    public void callVehRfidResetProcess() throws Exception;

}
