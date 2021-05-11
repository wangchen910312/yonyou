package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.CommonCodeVO;
import chn.bhmc.dms.mob.api.crm.vo.VocActiveVO;
import chn.bhmc.dms.mob.api.crm.vo.VocMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.VocMgmtVO;

/**
 * VOC 관리 서비스
 *
 * @author hyoung jun an
 * @since 2016. 3. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyoung jun an            최초 생성
 * </pre>
 */

public interface CrmVocMgmtService {

    /**
     * SUB 유형 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return 조회 목록
     */
    public List<CommonCodeVO> selectVocTpSubCdListByCondition(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 성코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return 조회 목록
     */
    public List<CommonCodeVO> selectSungCdListByCondition(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 VOC활동 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignVO
     * @return
     */
    public int selectActivesByConditionCnt(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 VOC활동 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignVO
     * @return 조회 목록
     */
    public List<VocActiveVO> selectActivesByCondition(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * BHMC VOC 처리 정보를 수정한다.        [20161020 사용안함]
     * @param saveVO - 수정할 정보가 담긴 VocMgmtVO
     * @return 수정된 목록수
     */
//    public int updateBhmcVocProce(VocMgmtVO vocMgmtVO) throws Exception;




    /**
     * 조회 조건에 해당하는 VOC 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return-
     */
    public int selectVocMgmtsByConditionCnt(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 VOC 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return 조회 목록
     */
    public List<VocMgmtVO> selectVocMgmtsByCondition(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * VOC 상세 정보를 조회한다.
     * @param VocMgmtSearchVO - VOC_NO, DLR_CD
     * @return
     */
    public VocMgmtVO selectVocMgmtByKey(VocMgmtSearchVO searchVO) throws Exception;


}