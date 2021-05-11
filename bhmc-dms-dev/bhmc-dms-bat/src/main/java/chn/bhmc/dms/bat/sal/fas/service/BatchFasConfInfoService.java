package chn.bhmc.dms.bat.sal.fas.service;

/**
 * 강제출고심사완료알림
 *
 * @author Lee Seungmin
 * @since 2017. 2. 16.
 * @version 1.0
 * @see <pre>
 *
 *       수정일               수정자             수정내용
 *  ----------------    ------------    ---------------------------
 *   2017. 2. 16.         Lee Seungmin           최초 생성
 * </pre>
 */

public interface BatchFasConfInfoService {

    // 강제출고심사완료알림
    public void callAlarmProcess(String flag) throws Exception;

}
