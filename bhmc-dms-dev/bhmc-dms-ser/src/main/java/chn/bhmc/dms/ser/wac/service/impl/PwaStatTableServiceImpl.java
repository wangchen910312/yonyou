package chn.bhmc.dms.ser.wac.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.wac.service.PwaStatTableService;
import chn.bhmc.dms.ser.wac.service.dao.PwaStatTableDAO;
import chn.bhmc.dms.ser.wac.vo.PwaStatTableSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaStatTableVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaStatTableServiceImpl.java
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
@Service("pwaStatTableService")
public class PwaStatTableServiceImpl extends HService implements PwaStatTableService{

    @Resource(name="pwaStatTableDAO")
    PwaStatTableDAO pwaStatTableDAO;


    /**
    *
    * PWA 통계표 목록수를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return PWA 통계표 목록수 데이터
    * @throws Exception
    */
    public int selectPwaStatTableByConditionCnt(PwaStatTableSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return pwaStatTableDAO.selectPwaStatTableByConditionCnt(searchVO);
    }

    /**
    *
    * PWA 통계표를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return PWA 통계표 목록 데이터
    * @throws Exception
    */
    public List<PwaStatTableVO> selectPwaStatTableByCondition(PwaStatTableSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return pwaStatTableDAO.selectPwaStatTableByCondition(searchVO);
    }
}