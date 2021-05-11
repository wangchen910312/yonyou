package chn.bhmc.dms.bat.sal.orc.service;

/**
 * 미배정오더배치
 *
 * @author Lee Seungmin
 * @since 2017. 2. 25.
 * @version 1.0
 * @see <pre>
 *
 *       수정일               수정자             수정내용
 *  ----------------    ------------    ---------------------------
 *   2017. 2. 25.         Lee Seungmin           최초 생성
 * </pre>
 */

public interface BatchOrcMngService {

    // 미배정오더배치
    public void callOrcUpdateProcess() throws Exception;

}
