package chn.bhmc.dms.crm.cmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractVO;

/**
 * 고객추출에 관한 데이터처리 매퍼 클래스
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

@Mapper("crmTargExtractDAO")
public interface CrmTargExtractDAO {

    /**
     * 조회 조건에 해당하는 고객추출 마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return
     */
    public int selectCrmTargExtractMastersByConditionCnt(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 고객추출 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return 조회 목록
     */
    public List<CrmTargExtractVO> selectCrmTargExtractMastersByCondition(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 고객추출 마스터 정보를 등록한다.
     * @param marketingCampaignVO - 등록할 정보가 담긴 CrmTargExtractVO
     * @return 등록된 목록수
     */
    public int insertCrmTargExtractMaster(CrmTargExtractVO crmTargExtractVO) throws Exception;

    /**
     * 고객추출 마스터 정보를 수정한다.(기본정보 탭)
     * @param marketingCampaignVO - 수정할 정보가 담긴 CrmTargExtractVO
     * @return 수정된 목록수
     */
    public int updateCrmTargExtractMaster(CrmTargExtractVO crmTargExtractVO) throws Exception;

    /**
     * 고객추출 마스터 정보를 삭제한다.
     * @param marketingCampaignVO - 삭제할 정보가 담긴 CrmTargExtractVO
     * @return 삭제된 목록수
     */
    public int deleteCrmTargExtractMaster(CrmTargExtractVO crmTargExtractVO) throws Exception;





    /**
     * 조회 조건에 해당하는 고객추출 상세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return
     */
    public int selectCrmTargExtractDetailsByConditionCnt(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 고객추출 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return 조회 목록
     */
    public List<CrmTargExtractVO> selectCrmTargExtractDetailsByCondition(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 고객추출 상세 페이지에 키 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return 조회 목록
     */
    public List<CrmTargExtractVO> selectCrmTargExtractDetailKeys(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 고객추출 상세 페이지에 값 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return 조회 목록
     */
    public List<CrmTargExtractVO> selectCrmTargExtractDetails(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 고객추출조건 비교를 위한 조건 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return 조회 목록
     */
    public List<CrmTargExtractVO> selectCrmTargExtractDetailDupByCondition(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 고객추출상세조건 저장시 기존 조건이 존재하는지 체크한다.
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return
     */
    public int selectCrmTargExtractDetailSavesByConditionCnt(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 고객추출 상세 정보를 등록한다.
     * @param crmTargExtractVO - 등록할 정보가 담긴 CrmTargExtractVO
     * @return 등록된 목록수
     */
    public int insertCrmTargExtractDetail(CrmTargExtractVO crmTargExtractVO) throws Exception;

    /**
     * 고객추출 상세 정보를 수정한다.(기본정보 탭)
     * @param crmTargExtractVO - 수정할 정보가 담긴 CrmTargExtractVO
     * @return 수정된 목록수
     */
    public int updateCrmTargExtractDetail(CrmTargExtractVO crmTargExtractVO) throws Exception;

    /**
     * 고객추출 상세 정보를 삭제한다.
     * @param crmTargExtractVO - 삭제할 정보가 담긴 CrmTargExtractVO
     * @return 삭제된 목록수
     */
    public int deleteCrmTargExtractDetail(CrmTargExtractVO crmTargExtractVO) throws Exception;

    /**
     * 도시코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    public List<CrmTargExtractVO> selectCityListByCondition(CrmTargExtractSearchVO searchVO);

    /**
     * 지역코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    public List<CrmTargExtractVO> selectDistListByCondition(CrmTargExtractSearchVO searchVO);

    /**
     * 대상자를 추출한다.
     */
    public void selectTargetExtractSaveExcel(CrmTargExtractVO crmTargExtractVO);

    /**
     * TEMP01 대상자 정보를 삭제한다.
     * @param CrmTargExtractSearchVO - 삭제할 정보가 담긴 searchVO
     * @return 삭제된 목록수
     */
    public int deleteTemp01(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * TEMP02 대상자 정보를 삭제한다.
     * @param CrmTargExtractSearchVO - 삭제할 정보가 담긴 searchVO
     * @return 삭제된 목록수
     */
    public int deleteTemp02(CrmTargExtractSearchVO searchVO) throws Exception;

    /**
     * 엑셀 다운로드 할 대상자 수량를 조회한다.
     */
    public int selectTargExtractsByConditionCnt(CrmTargExtractSearchVO searchVO);

    /**
     * 엑셀 다운로드 할 대상자를 조회한다.
     */
    public List<CrmTargExtractVO> selectTargExtractsByCondition(CrmTargExtractSearchVO searchVO);

    /**
     * 대상자추출조건 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    public List<CrmTargExtractVO> selectTargExtractListByCondition(CrmTargExtractSearchVO searchVO);

    /**
     * 캠페인 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    public List<CrmTargExtractVO> selectCampaignListByCondition(CrmTargExtractSearchVO searchVO);


    /**
     * 고객추출 조건을 삭제시 다른업무에서 사용하고 있는지 확인한다.
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return
     */
    public int selectCrmTargExtractDeleteByConditionCnt(CrmTargExtractSearchVO searchVO) throws Exception;

}