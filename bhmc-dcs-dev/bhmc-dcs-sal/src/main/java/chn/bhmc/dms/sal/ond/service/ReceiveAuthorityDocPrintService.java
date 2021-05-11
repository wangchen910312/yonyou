package chn.bhmc.dms.sal.ond.service;

import java.util.List;

import chn.bhmc.dms.sal.ond.vo.ReceiveAuthorityDocPrintSearchVO;
import chn.bhmc.dms.sal.ond.vo.ReceiveAuthorityDocPrintVO;

/**
 * <pre>
 * 수령권한문서출력 서비스
 * </pre>
 *
 * @ClassName   : ReceiveAuthorityDocPrintService.java
 * @Description : ReceiveAuthorityDocPrintService
 * @author Jin Choi
 * @since 2017. 3. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 6.     Jin Choi     최초 생성
 * </pre>
 */

public interface ReceiveAuthorityDocPrintService {

    /**
     * 수정권한문서출력 정보 총 갯수를 조회한다.
     *
     * @param ReceiveAuthorityDocPrintSearchVO
     * @return int
     */
    public int selectReceiveAuthorityDocPrintListByCnt(ReceiveAuthorityDocPrintSearchVO searchVO) throws Exception;

    /**
     * 수정권한문서출력 정보를 조회한다.
     *
     * @param ReceiveAuthorityDocPrintSearchVO
     * @return List<ReceiveAuthorityDocPrintVO> 조회 목록
     */
    public List<ReceiveAuthorityDocPrintVO> selectReceiveAuthorityDocPrintList(ReceiveAuthorityDocPrintSearchVO searchVO) throws Exception;

}
