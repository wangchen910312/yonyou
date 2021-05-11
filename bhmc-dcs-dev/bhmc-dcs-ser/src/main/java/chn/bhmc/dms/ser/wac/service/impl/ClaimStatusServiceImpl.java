package chn.bhmc.dms.ser.wac.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.ser.wac.service.ClaimStatusService;
import chn.bhmc.dms.ser.wac.service.dao.ClaimStatusDAO;
import chn.bhmc.dms.ser.wac.vo.ClaimStatusSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimStatusVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CClaimStatusServiceImpl.java
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
@Service("claimStatusService")
public class ClaimStatusServiceImpl extends HService implements ClaimStatusService{

    @Resource(name="claimStatusDAO")
    ClaimStatusDAO claimStatusDAO;


    /**
    *
    * 일자별로 클레임요청 현황 목록수를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 목록수 데이터
    * @throws Exception
    */
    public int selectClaimStatusByConditionCnt(ClaimStatusSearchVO searchVO) throws Exception {

        return claimStatusDAO.selectClaimStatusByConditionCnt(searchVO);
    }

    /**
    *
    * 일자별로 클레임요청 현황을 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 목록 데이터
    * @throws Exception
    */
    public List<ClaimStatusVO> selectClaimStatusByCondition(ClaimStatusSearchVO searchVO) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return claimStatusDAO.selectClaimStatusByCondition(searchVO);
    }
}