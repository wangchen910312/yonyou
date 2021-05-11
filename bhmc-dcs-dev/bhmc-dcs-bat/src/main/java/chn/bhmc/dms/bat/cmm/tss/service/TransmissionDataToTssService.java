package chn.bhmc.dms.bat.cmm.tss.service;

/**
 * service 요청.
 *
 * @author Jia Ming
 * @since 2019.04.30
 * @version 1.0
 * @see <pre>
 *
 *      since          author              description
 *  ----------------    ------------    ---------------------------
 *   2019.04.30      Jia Ming           
 * </pre>
 */

public interface TransmissionDataToTssService {
	
	/**
     * 从DCS获取数据给TSS
     * @throws Exception
     */
    public void getDCSDataToTSS() throws Exception;
}
