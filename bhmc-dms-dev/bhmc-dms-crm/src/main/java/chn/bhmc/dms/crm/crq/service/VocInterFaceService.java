package chn.bhmc.dms.crm.crq.service;

import chn.bhmc.dms.crm.crq.vo.VocActiveVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtSearchVO;

/**
 * VOC I/F 서비스
 *
 * @author lee In Moon
 * @since 2016.08.27
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.08.27         lee In Moon            최초 생성
 * </pre>
 */

public interface VocInterFaceService {

    /**
     * VOC I/F 등록한다.
     * @param VocMgmtSearchVO - dlrCd, bhmcVocNo  ( 본테이블에서 select 후 insert )
     * @return 등록된 목록수
     */
    public int insertVocMgmtIF(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * VOC I/F 삭제한다.
     * @param VocMgmtSearchVO - dlrCd, bhmcVocNo
     * @return 삭제된 목록수
     */
    public int deleteVocMgmtIF(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * VOC ACTIVE I/F 등록한다.
     * @param saveVO - 등록할 정보가 담긴 VocActiveVO
     * @return 등록된 목록수
     */
    public int insertVocActiveIF(VocActiveVO saveVO) throws Exception;

}