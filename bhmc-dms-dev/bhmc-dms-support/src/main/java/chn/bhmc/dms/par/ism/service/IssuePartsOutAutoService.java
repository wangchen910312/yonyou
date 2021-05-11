package chn.bhmc.dms.par.ism.service;

import java.util.List;

import chn.bhmc.dms.par.ism.vo.IssuePartsOutSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;

import chn.bhmc.dms.par.ism.vo.ReceiveEtcItemTrdSupportVO;
import chn.bhmc.dms.par.ism.vo.ReceiveEtcVerThdSupportSearchVO;


/**
 * 기초재고출고(정비수령)서비스
 *
 * @author In Bo Shim
 * @since 2017. 8. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2017. 8. 15.     In Bo Shim      최초 생성
 * </pre>
 */

public interface IssuePartsOutAutoService {

    /**
     * 정비수령 자동출고 처리.
     * @return 등록된 IssuePartsOutSaveVO
     */
    public IssuePartsOutSaveVO insertIssuePartsOutAuto(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 정비수령 자동출고 처리 단일.
     * @return 등록된 IssuePartsOutSaveVO
     */
    public IssuePartsOutSaveVO insertIssuePartsOutAutoRow(IssueReqSearchVO searchVO, ReceiveEtcItemTrdSupportVO roInfoVO01) throws Exception;

    /**
     *기초재고입고(진행중 정비수령)정보를 수정한다.
     * @param receiveEtcItemTrdVO - 등록할 정보가 담긴 ReceiveEtcItemTrdVO
     * @return 등록된 목록수
     */
    public int updateReceiveEtcVerSupportThd(ReceiveEtcItemTrdSupportVO receiveEtcItemTrdSupportVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기초재고입고(진행중 정비수령)정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcVerThdSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemTrdSupportVO> selectReceiveEtcVerSupportThdesByCondition(ReceiveEtcVerThdSupportSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기초재고입고(진행중 정비수령) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcVerThdSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcVerSupportThdesByConditionCnt(ReceiveEtcVerThdSupportSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기초재고입고(진행중 정비수령)RO번호 그룹 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcVerThdSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemTrdSupportVO> selectReceiveEtcVerSupportThdesRoDocNoByCondition(ReceiveEtcVerThdSupportSearchVO searchVO) throws Exception;

}
