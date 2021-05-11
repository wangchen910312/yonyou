package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.ser.svi.vo.CampaignDetailVO;
import chn.bhmc.dms.ser.svi.vo.CampaignMasterVO;
import chn.bhmc.dms.ser.svi.vo.CampaignSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignVinManageService.java
 * @Description : 캠페인 빈 정보 서비스
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

public interface CampaignVinManageService {

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
    public int selectCampaignItemsCnt(CampaignSearchVO searchVO) throws Exception;

    /**
     * 캠페인 부품 정보 목록 데이터 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 부품 정보 목록 데이터 갯수
     */
    public List<CampaignDetailVO> selectCampaignItems(CampaignSearchVO searchVO)throws Exception;


    /**
     * VIN에 해당하는 캠페인 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return VIN 에 해당하는 캠페인 정보
     */
    public List<CampaignMasterVO> selectCampaignForVinInfos(CampaignSearchVO searchVO) throws Exception;

    /**
     * 캠페인 공임 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return VIN 에 해당하는 캠페인 공임 정보
     */
    public List<CampaignDetailVO> selectCampaignLbrInfoPopup(CampaignSearchVO searchVO)throws Exception;

    /**
     * 캠페인 부품 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 부품 정보
     */
    public List<CampaignDetailVO> selectCampaignPartInfoPopup(CampaignSearchVO searchVO) throws Exception;

    
}
