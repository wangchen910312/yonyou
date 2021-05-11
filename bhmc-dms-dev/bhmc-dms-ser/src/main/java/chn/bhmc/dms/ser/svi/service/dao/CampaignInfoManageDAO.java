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
 * @ClassName   : CampaignInfoManageDAO.java
 * @Description : 캠페인 관리 DAO
 * @author Kwon Ki Hyun
 * @since 2016. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 19.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Mapper("campaignInfoManageDAO")
public interface CampaignInfoManageDAO {

    /**
     * 캠페인 정보 목록 데이터 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 정보 목록 데이터 갯수
     */
    public int selectCampaignInfoManagesByConditionCnt(CampaignSearchVO searchVO)throws Exception;

    /**
     * 캠페인 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 정보 목록 데이터
     */
    public List<CampaignMasterVO> selectCampaignInfoManagesByCondition(CampaignSearchVO searchVO)throws Exception;

    /**
     * 캠페인 상세 정보 목록 데이터 갯수 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 상세 정보 목록 데이터 갯수를 조회한다.
     */ 
    public int selectCampaignInfosDetailByConditionCnt(CampaignSearchVO searchVO)throws Exception;

    /**
     * 캠페인 상세 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 상세 정보 목록 데이터를 조회한다.
     */
    public List<CampaignDetailVO> selectCampaignInfosDetailByCondition(CampaignSearchVO searchVO)throws Exception;

}
