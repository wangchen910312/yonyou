package chn.bhmc.dms.sal.uva.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.uva.service.UsedCarPriceManagementService;
import chn.bhmc.dms.sal.uva.service.dao.UsedCarPriceManagementDAO;
import chn.bhmc.dms.sal.uva.vo.UsedCarPriceManagementSaveVO;
import chn.bhmc.dms.sal.uva.vo.UsedCarPriceManagementSearchVO;
import chn.bhmc.dms.sal.uva.vo.UsedCarPriceManagementVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarPriceManagementImpl.java
 * @Description : 중고차 가격관리 Impl
 * @author Bong
 * @since 2016. 5. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 24.       Bong                최초 생성
 * </pre>
 */

@Service("usedCarPriceManagementService")
public class UsedCarPriceManagementImpl extends HService implements UsedCarPriceManagementService{

    @Resource(name="usedCarPriceManagementDAO")
    UsedCarPriceManagementDAO usedCarPriceManagementDAO;

    @Override
    public List<UsedCarPriceManagementVO> selectUsedCarPriceManagementCondition(UsedCarPriceManagementSearchVO searchVO) throws Exception {
        return usedCarPriceManagementDAO.selectUsedCarPriceManagementCondition(searchVO);
    }

    @Override
    public int selectUsedCarPriceManagementConditionCnt(UsedCarPriceManagementSearchVO searchVO)  throws Exception {
        return usedCarPriceManagementDAO.selectUsedCarPriceManagementConditionCnt(searchVO);
    }

    @Override
    public void multiUsedCarPriceManagement(UsedCarPriceManagementSaveVO obj) throws Exception {

        UsedCarPriceManagementSearchVO searchVO;
        for(UsedCarPriceManagementVO saveVO : obj.getInsertList()){
            searchVO = new UsedCarPriceManagementSearchVO();

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsStartDt(saveVO.getStartDt());
            searchVO.setsVinNo(saveVO.getVinNo());
            searchVO.setsEndDt(saveVO.getEndDt());
            searchVO.setsUseYn(saveVO.getUseYn());

            if( usedCarPriceManagementDAO.selectUsedCarPriceManagementConditionCnt(searchVO) > 0 ){
                // 적용일은(는) 중복될 수 없습니다.
                throw processException("global.info.duplicateCheck"
                                      , new String[]{messageSource.getMessage("sal.lbl.applyDate", null, LocaleContextHolder.getLocale()) });
            }

            saveVO.setDlrCd(LoginUtil.getDlrCd());
            saveVO.setRegUsrId(LoginUtil.getUserId());
            saveVO.setUpdtUsrId(LoginUtil.getUserId());
            usedCarPriceManagementDAO.insertUsedCarPriceManagement(saveVO);
        }

        for(UsedCarPriceManagementVO saveVO : obj.getUpdateList()){
            searchVO = new UsedCarPriceManagementSearchVO();

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsStartDt(saveVO.getStartDt());
            searchVO.setsEndDt(saveVO.getEndDt());
            searchVO.setsVinNo(saveVO.getVinNo());
            searchVO.setsUseYn(saveVO.getUseYn());

            if( usedCarPriceManagementDAO.selectUsedCarPriceManagementConditionCnt(searchVO) > 1 ){
                // 적용일은(는) 중복될 수 없습니다.
                throw processException("global.info.duplicateCheck"
                                      , new String[]{messageSource.getMessage("sal.lbl.applyDate", null, LocaleContextHolder.getLocale()) });
            }

            saveVO.setUpdtUsrId(LoginUtil.getUserId());
            usedCarPriceManagementDAO.updateUsedCarPriceManagement(saveVO);
        }
    }

}
