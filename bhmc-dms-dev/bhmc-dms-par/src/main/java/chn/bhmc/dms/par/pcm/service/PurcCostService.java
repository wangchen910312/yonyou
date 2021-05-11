package chn.bhmc.dms.par.pcm.service;

import chn.bhmc.dms.par.pcm.vo.PurcCostSearchVO;

/**
 * 구매소요량 서비스
 *
 * @author In Bo Shim
 * @since 2016. 2. 1.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 1.     In Bo Shim      최초 생성
 * </pre>
 */

public interface PurcCostService {

    /**
     * 구매소요량  정보를 추가/수정/삭제한다.
     * @param purcRgstVO - 추가/수정/삭제 정보가 담긴 PurcCostVO
     * @return 삭제된 목록수
     */
    public void multiPurcCostes(PurcCostSearchVO PurcCostSearchVO) throws Exception;


}
