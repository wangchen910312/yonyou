package chn.bhmc.dms.crm.crq.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtSearchVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtVO;

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

public interface VocMgmtService {

    /**
     * 조회 조건에 해당하는 VOC 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectVocMgmtsByConditionCnt(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 VOC 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return 조회 목록
     */
    public List<VocMgmtVO> selectVocMgmtsByCondition(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * VOC 정보를 등록한다.
     * @param saveVO - 등록할 정보가 담긴 VocMgmtVO
     * @return 등록된 목록수
     */
    public int insertVocMgmt(VocMgmtVO saveVO) throws Exception;

    /**
     * VOC 정보를 수정한다.
     * @param saveVO - 수정할 정보가 담긴 VocMgmtVO
     * @return 수정된 목록수
     */
    public int updateVocMgmt(VocMgmtVO saveVO) throws Exception;

    /**
     * 상태 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return 조회 목록
     */
    public List<VocMgmtVO> selectVocTpCdListByCondition(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 성코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return 조회 목록
     */
    public List<VocMgmtVO> selectSungCdListByCondition(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 도시코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return 조회 목록
     */
    public List<VocMgmtVO> selectCityCdListByCondition(VocMgmtSearchVO searchVO) throws Exception;

    public String selectNextVocNo() throws Exception;





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
    public List<VocMgmtVO> selectActivesByCondition(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * VOC활동 정보를 등록/수정 처리한다.
     * @param activeSaveVO
     */
    public void multiActives(BaseSaveVO<VocMgmtVO> activeSaveVO) throws Exception;

    /**
     * VOC활동 정보를 등록한다.
     * @param saveVO - 등록할 정보가 담긴 VocMgmtVO
     * @return 등록된 목록수
     */
    public int insertActive(VocMgmtVO saveVO) throws Exception;

    /**
     * VOC활동 정보를 수정한다.
     * @param saveVO - 수정할 정보가 담긴 VocMgmtVO
     * @return 수정된 목록수
     */
    public int updateActive(VocMgmtVO saveVO) throws Exception;
}