package chn.bhmc.dms.par.pcm.service;

import java.util.List;

import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemTrdVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcVerThdSearchVO;


/**
 * 기초재고입고(진행중 정비수령) 서비스
 *
 * @author In Bo Shim
 * @since 2017. 08. 08.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2017. 08. 08.     In Bo Shim      최초 생성
 * </pre>
 */

public interface ReceiveEtcVerThdService {

    /**
     *기초재고입고(진행중 정비수령) 부품마스터정보를 등록한다.
     * @param list - 등록할 정보가 담긴 ReceiveEtcItemTrdVO List
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 처리된 ReceiveEtcVO
     */
    public void insertReceiveEtcVerThdItemMaster(ReceiveEtcVO receiveEtcVO) throws Exception;

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

    /**
     *기초재고입고(진행중 정비수령) 정보를 등록한다.
     * @param list - 등록할 정보가 담긴 ReceiveEtcItemTrdVO List
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 처리된 ReceiveEtcVO
     */
    public ReceiveEtcVO insertReceiveEtcVerThd(ReceiveEtcVO receiveEtcVO) throws Exception;

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
     * 조회 조건에 해당하는기초재고입고 V3 프로시져 호출
     * @param retReceiveEtcVO - 등록할 정보가 담긴 retReceiveEtcVO
     * @return
     */
    public void executeReceiveEtcInitProcedure(ReceiveEtcVO retReceiveEtcVO) throws Exception;


}
