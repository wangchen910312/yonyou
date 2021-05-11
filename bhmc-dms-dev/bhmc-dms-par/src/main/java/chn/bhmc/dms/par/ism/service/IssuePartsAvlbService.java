package chn.bhmc.dms.par.ism.service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;

/**
 * 부품가용처리 서비스
 *
 * @author In Bo Shim
 * @since 2016. 4. 7.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 4. 7.     In Bo Shim      최초 생성
 * </pre>
 */

public interface IssuePartsAvlbService {

    /**
     * 부품가용 정보를 등록/수정/삭제 처리한다.
     * @param issueReqDetailVO
     */
    public void multiIssueReqDetailPartsAvlbes(BaseSaveVO<IssueReqDetailVO> obj) throws Exception;

}
