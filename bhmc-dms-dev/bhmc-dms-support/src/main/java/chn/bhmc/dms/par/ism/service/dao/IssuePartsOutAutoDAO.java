package chn.bhmc.dms.par.ism.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.ReceiveEtcItemTrdSupportVO;
import chn.bhmc.dms.par.ism.vo.ReceiveEtcVerThdSupportSearchVO;

/**
 * 부품자동출고 데이타 매퍼 클래스
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

@Mapper("issuePartsOutAutoDAO")
public interface IssuePartsOutAutoDAO {

    /**
     *기초재고입고(진행중 정비수령)정보를 수정한다.
     * @param receiveEtcItemTrdVO - 등록할 정보가 담긴 ReceiveEtcItemTrdVO
     * @return 등록된 목록수
     */
    public int updateReceiveEtcVerSupportThd(ReceiveEtcItemTrdSupportVO receiveEtcItemTrdVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기초재고입고(진행중 정비수령)정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcVerThdSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemTrdSupportVO> selectReceiveEtcVerSupportThdesByCondition(ReceiveEtcVerThdSupportSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기초재고입고(진행중 정비수령)RO번호 그룹 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcVerThdSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemTrdSupportVO> selectReceiveEtcVerSupportThdesRoDocNoByCondition(ReceiveEtcVerThdSupportSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기초재고입고(진행중 정비수령) 부품요청번호,RO번호,부품 라인별 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcVerThdSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemTrdSupportVO> selectReceiveEtcVerSupportThdesPartitionByCondition(ReceiveEtcVerThdSupportSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는기초재고입고(진행중 정비수령) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcVerThdSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcVerSupportThdesByConditionCnt(ReceiveEtcVerThdSupportSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는기초재고입고(진행중 정비수령) 부품요청상세 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public IssueReqDetailVO selectReceiveEtcVerSupportThdesIssueReqDetailByKey(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는기초재고입고(진행중 정비수령) 부품요청상세 부품 정보 리스트를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public List<IssueReqDetailVO> selectReceiveEtcVerSupportThdesIssueReqDetailByCondition(IssueReqSearchVO searchVO) throws Exception;

}
