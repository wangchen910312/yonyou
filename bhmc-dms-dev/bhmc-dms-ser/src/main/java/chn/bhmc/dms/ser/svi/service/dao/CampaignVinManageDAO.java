package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.CampaignDetailVO;
import chn.bhmc.dms.ser.svi.vo.CampaignMasterVO;
import chn.bhmc.dms.ser.svi.vo.CampaignSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignVinManageDAO.java
 * @Description : 캠페인 빈 정보 DAO
 * @author Kwon Ki Hyun
 * @since 2016. 2. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 22.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Mapper("campaignVinManageDAO")
public interface CampaignVinManageDAO {

    /**
     * 캠페인 빈 정보 목록 데이터 개수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 빈 정보 목록 데이터 갯수
     */
    public int selectCampaignVinInfosCnt(CampaignSearchVO searchVO)throws Exception;

    /**
     * 캠페인 빈 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 빈 정보 목록 데이터
     */
    public List<CampaignDetailVO> selectCampaignVinInfos(CampaignSearchVO searchVO)throws Exception;

    /**
     * 캠페인 공임 정보 목록 데이터 갯수 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 공임 정보 목록 데이터갯수
     */
    public int selectCampaignLbrInfosCnt(CampaignSearchVO searchVO)throws Exception;

    /**
     * 캠페인 공임 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 공임 정보 목록 데이터
     */
    public List<CampaignDetailVO> selectCampaignLbrInfos(CampaignSearchVO searchVO) throws Exception;

    /**
     * 캠페인 부품 정보 목록 데이터 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 부품 정보 목록 데이터
     */
    public int selectCampaignItemsCnt(CampaignSearchVO searchVO)throws Exception;

    /**
     * 캠페인 부품 정보 목록 데이터 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 부품 정보 목록 데이터 갯수
     */
    public List<CampaignDetailVO> selectCampaignItems(CampaignSearchVO searchVO) throws Exception;

    /**
     * VIN에 해당하는 캠페인 정보 목록 갯수 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return VIN 에 해당하는 캠페인 정보 갯수
     */
    public int selectCampaignForVinInfosCnt(CampaignSearchVO searchVO) throws Exception;

    /**
     * VIN에 해당하는 캠페인 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return  VIN에 해당하는 캠페인 정보
     */
    public List<CampaignMasterVO> selectCampaignForVinInfos(CampaignSearchVO searchVO)throws Exception;

    /**
     * 캠페인 공임 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 공임 정보
     */
    public List<CampaignDetailVO> selectCampaignLbrInfoPopup(CampaignSearchVO searchVO) throws Exception;

    /**
     * 딜러 캠페인 공임 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 공임 정보
     */
    public List<CampaignDetailVO> selectCampaignDlrLbrInfoPopup(CampaignSearchVO searchVO) throws Exception;

    /**
     * 캠페인 부품 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 부품 정보
     */
    public List<CampaignDetailVO> selectCampaignPartInfoPopup(CampaignSearchVO searchVO)throws Exception;

    /**
     * 딜러 캠페인 부품 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 부품 정보
     */
    public List<CampaignDetailVO> selectCampaignDlrPartInfoPopup(CampaignSearchVO searchVO)throws Exception;

    /**
     *
     * 캠페인 사용 정보 등록
     *
     * @param campaignDetailVO
     * @throws Exception
     */
    public void insertUsedCamapaignInfo(CampaignSearchVO campaignSearchVO) throws Exception;

    /**
     *
     * 캠페인 사용 정보 삭제
     *
     * @param campaignDetailVO
     * @throws Exception
     */
    public void deleteUsedCamapaignInfo(CampaignDetailVO campaignDetailVO) throws Exception;

    /**
     *
     * 캠페인 사용 정보 등록 여부
     *
     * @param campaignDetailVO
     * @throws Exception
     */
    public int selectCampaignUsedInfosCnt(CampaignSearchVO campaignSearchVO) throws Exception;

    /**
     * 면비보양 캠페인 데이터 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 면비보양 캠페인 데이터 갯수
     */
    public int selectFreeRoCnt(CampaignSearchVO searchVO)throws Exception;

    /**
     * 캠페인 처음면비보양 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 처음면비보양 캠페인 데이터 갯수
     */
    public int selectFreeRoYnCnt(CampaignSearchVO searchVO)throws Exception;


}
