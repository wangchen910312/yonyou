package chn.bhmc.dms.bat.sal.rcp.service;

/**
 * service 요청.
 *
 * @author Kim Jin Suk
 * @since 2016.06.21
 * @version 1.0
 * @see <pre>
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.06.21         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface BatchInvCertInfoService {
    public void InvCertInfoRun(String serviceId) throws Exception;
}
