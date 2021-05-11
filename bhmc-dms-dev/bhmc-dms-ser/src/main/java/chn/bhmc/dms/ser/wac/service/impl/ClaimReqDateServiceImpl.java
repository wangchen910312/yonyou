package chn.bhmc.dms.ser.wac.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.wac.service.ClaimReqDateService;
import chn.bhmc.dms.ser.wac.service.dao.ClaimReqDateDAO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqDateSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqDateVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimRequestServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("claimReqDateService")
public class ClaimReqDateServiceImpl extends HService implements ClaimReqDateService{

    @Resource(name="claimReqDateDAO")
    ClaimReqDateDAO claimReqDateDAO;


    /**
    *
    * 일자별로 클레임요청 현황 목록수를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 목록수 데이터
    * @throws Exception
    */
    public int selectClaimReqDateMastersByConditionCnt(ClaimReqDateSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return claimReqDateDAO.selectClaimReqDateMastersByConditionCnt(searchVO);
    }

    /**
    *
    * 일자별로 클레임요청 현황을 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 목록 데이터
    * @throws Exception
    */
    public List<ClaimReqDateVO> selectClaimReqDateMastersByCondition(ClaimReqDateSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return claimReqDateDAO.selectClaimReqDateMastersByCondition(searchVO);
    }

    /**
    *
    * 일자별로 클레임요청 상세현황 목록수를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 목록수 데이터
    * @throws Exception
    */
    public int selectClaimReqDateDetailsByConditionCnt(ClaimReqDateSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return claimReqDateDAO.selectClaimReqDateDetailsByConditionCnt(searchVO);
    }

    /**
    *
    * 일자별로 클레임요청 상세현황을 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 목록 데이터
    * @throws Exception
    */
    public List<ClaimReqDateVO> selectClaimReqDateDetailsByCondition(ClaimReqDateSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return claimReqDateDAO.selectClaimReqDateDetailsByCondition(searchVO);
    }
}