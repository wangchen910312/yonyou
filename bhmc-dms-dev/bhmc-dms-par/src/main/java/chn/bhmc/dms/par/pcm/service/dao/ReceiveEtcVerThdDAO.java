package chn.bhmc.dms.par.pcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemTrdVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcVerThdSearchVO;

/**
 * 기초재고입고 (정비수령) 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2017. 8. 8.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2017. 8. 8.     In Bo Shim     최초 생성
 * </pre>
 */
@Mapper("receiveEtcVerThdDAO")
public interface ReceiveEtcVerThdDAO {

    /**
     *기초재고입고(진행중 정비수령)정보를 수정한다.
     * @param receiveEtcItemTrdVO - 등록할 정보가 담긴 ReceiveEtcItemTrdVO
     * @return 등록된 목록수
     */
    public int updateReceiveEtcVerThd(ReceiveEtcItemTrdVO receiveEtcItemTrdVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기초재고입고(진행중 정비수령)정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcVerThdSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemTrdVO> selectReceiveEtcVerThdesByCondition(ReceiveEtcVerThdSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는기초재고입고(진행중 정비수령) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcVerThdSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcVerThdesByConditionCnt(ReceiveEtcVerThdSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기초재고입고(진행중 정비수령)부품마스터 없는 부품정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcVerThdSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemTrdVO> selectReceiveEtcVerThdesItemMasterByCondition(ReceiveEtcVerThdSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는기초재고입고(진행중 정비수령) 부품마스터 없는 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcVerThdSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcVerThdesItemMasterByConditionCnt(ReceiveEtcVerThdSearchVO searchVO) throws Exception;

}
