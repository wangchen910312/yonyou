package chn.bhmc.dms.bat.sal.dlv.service;

/**
 * 이월소매취소심사완료알림
 *
 * @author Lee Seungmin
 * @since 2017. 3. 12.
 * @version 1.0
 * @see <pre>
 *
 *       수정일               수정자             수정내용
 *  ----------------    ------------    ---------------------------
 *   2017. 3. 12.         Lee Seungmin           최초 생성
 * </pre>
 */

public interface BatchDlvConfInfoService {

    // 이월소매취소심사완료알림
    public void callAlarmProcess(String flag) throws Exception;

}
