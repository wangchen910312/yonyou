package chn.bhmc.dms.crm.cmm.service;

import java.util.List;
import java.util.Map;

import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSaveVO;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractVO;

/**
 * 고객추출 관리 서비스
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

public interface CrmTargExtractService {

    /**
     * 조회 조건에 해당하는 고객추출 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectCrmTargExtractMastersByConditionCnt(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 고객추출 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<CrmTargExtractVO> selectCrmTargExtractMastersByCondition(CrmTargExtractSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 고객추출 상세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectCrmTargExtractDetailsByConditionCnt(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 고객추출 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<CrmTargExtractVO> selectCrmTargExtractDetailsByCondition(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 고객추출 상세 페이지에 키 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<CrmTargExtractVO> selectCrmTargExtractDetailKeys(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 고객추출 상세 페이지에 값 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<CrmTargExtractVO> selectCrmTargExtractDetails(CrmTargExtractSearchVO searchVO) throws Exception;

    public String selectNextExtrTermNo() throws Exception;



    /**
     * 추출조건을 추가/저장/삭제 한다.(메인조건 저장)
     * @param SaveVO
     */
    public CrmTargExtractVO multiTargExtracts(CrmTargExtractSaveVO SaveVO) throws Exception;

    /**
     * 추출조건을 추가/저장/삭제 한다.(상세조건 저장)
     * @param SaveVO
     */
    public void multiTargExtractExs(CrmTargExtractSaveVO SaveVO, String gsCustExtrTermNo, String gsNew) throws Exception;

    /**
     * 추출조건을 삭제한다.
     * @param visitCustomerVO - CrmTargExtractVO
     */
    public void deleteTargExtract(CrmTargExtractVO deleteVO) throws Exception;

    /**
     * 도시코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return 조회 목록
     */
    public List<CrmTargExtractVO> selectCityListByCondition(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 지역코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return 조회 목록
     */
    public List<CrmTargExtractVO> selectDistListByCondition(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 대상자를 추출한다.
     * @param visitCustomerVO - CrmTargExtractVO
     * @return 삭제된 목록수
     */
    public CrmTargExtractVO selectTargetExtractSaveExcel(CrmTargExtractVO saveVO) throws Exception;

    /**
     * 엑셀로 저장하기 위한 대상자 고객 수량을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractVO
     * @return 조회 목록
     */
    public int selectTargExtractsByConditionCnt(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 엑셀로 저장하기 위한 대상자 고객을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractVO
     * @return 조회 목록
     */
    public List<CrmTargExtractVO> selectTargExtractsByCondition(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 대상자추출조건 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return 조회 목록
     * @throws Exception
     */
    public List<CrmTargExtractVO> selectTargExtractListByCondition(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 캠페인 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return 조회 목록
     * @throws Exception
     */
    public List<CrmTargExtractVO> selectCampaignListByCondition(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 대상자 추출 TEMP테이블(CR_1003T, CR_1004T)을 삭제한다.
     * @param searchVO - CrmTargExtractSearchVO
     */
    public void deleteTempList(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 고객추출조건 비교를 위한 조건 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return 조회 목록
     */
    public Map<String, Object> selectCrmTargExtractDetailDupByCondition(CrmTargExtractSaveVO searchVO) throws Exception;

    /**
     * 고객추출조건 사용 카운트
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return 조회 목록
     */
    public int selectCrmTargExtractDeleteByConditionCnt(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 고객추출마스터를 업데이트 한다.
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractVO
     * @return 조회 목록
     */
    public int updateCrmTargExtractMaster(CrmTargExtractVO crmTargExtractVO) throws Exception;

    /**
     * 만족도 조사 - 정비 대상자를 추출한다.
     * @param CrmTargExtractVO - saveVO
     * @return 프로시저 결과
     */
    public CrmTargExtractVO selectTargetExtractSaveFromService(CrmTargExtractVO saveVO);

}