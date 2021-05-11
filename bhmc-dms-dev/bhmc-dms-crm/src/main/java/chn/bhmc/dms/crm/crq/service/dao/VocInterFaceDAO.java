package chn.bhmc.dms.crm.crq.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.crq.vo.VocActiveVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtSearchVO;

/**
 * VOC에 관한 데이터처리 매퍼 클래스
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

@Mapper("vocInterFaceDAO")
public interface VocInterFaceDAO {

    /**
     * VOC I/F 등록한다.
     * @param VocMgmtSearchVO - dlrCd, bhmcVocNo  ( 본테이블에서 select 후 insert )
     * @return 등록된 목록수
     */
    public int insertVocMgmtIF(VocMgmtSearchVO searchVO);

    /**
     * VOC I/F 삭제한다.
     * @param VocMgmtSearchVO - dlrCd, bhmcVocNo
     * @return 삭제된 목록수
     */
    public int deleteVocMgmtIF(VocMgmtSearchVO searchVO);

    /**
     * VOC ACTIVE I/F 등록한다.
     * @param saveVO - 등록할 정보가 담긴 VocActiveVO
     * @return 등록된 목록수
     */
    public int insertVocActiveIF(VocActiveVO saveVO) throws Exception;

}