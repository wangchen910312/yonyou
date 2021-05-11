package chn.bhmc.dms.bat.sal.fim.service;


/**
 * 금융상품정보 I/F DCS -> DMS
 * @author Kim Jin Suk
 * @since 2017. 4. 17
 * @version 1.0
 * @see <pre>
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017. 4. 17         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface FincProductService {

    /**
     * 금융상품정보 I/F DCS -> DMS
     * @param serviceId
     * @throws Exception
     */
    public int batFincProductSearch(String serviceId) throws Exception;

}
