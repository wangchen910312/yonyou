package chn.bhmc.dms.sal.mst.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.mst.service.PositionsDiscountService;
import chn.bhmc.dms.sal.mst.service.dao.PositionsDiscountDAO;
import chn.bhmc.dms.sal.mst.vo.PositionsDiscountAmtVO;
import chn.bhmc.dms.sal.mst.vo.PositionsDiscountSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : positionsDiscountImpl.java
 * @Description : 직책별 할인금액 관리 Impl
 * @author Bong
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.       Bong                최초 생성
 * </pre>
 */

@Service("positionsDiscountService")
public class PositionsDiscountServiceImpl extends HService implements PositionsDiscountService{

    @Resource(name="positionsDiscountDAO")
    PositionsDiscountDAO positionsDiscountDAO;

    @Override
    public List<PositionsDiscountAmtVO> selectPositionsDiscountAmtCondition(PositionsDiscountSearchVO searchVO) throws Exception {
        return positionsDiscountDAO.selectPositionsDiscountAmtCondition(searchVO);
    }

    @Override
    public int selectPositionsDiscountAmtConditionCnt(PositionsDiscountSearchVO searchVO)  throws Exception {
        return positionsDiscountDAO.selectPositionsDiscountAmtConditionCnt(searchVO);
    }

    @Override
    public void multiPositionsDiscountAmt(BaseSaveVO<PositionsDiscountAmtVO> obj) throws Exception {

        PositionsDiscountSearchVO searchVO;
        for(PositionsDiscountAmtVO saveVO : obj.getInsertList()){
            searchVO = new PositionsDiscountSearchVO();

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsCarlineCd(saveVO.getCarlineCd());
            searchVO.setsModelCd(saveVO.getModelCd());
            searchVO.setsOcnCd(saveVO.getOcnCd());
            searchVO.setsStartDt(saveVO.getStartDt());
            searchVO.setsEndDt(saveVO.getEndDt());

            if( positionsDiscountDAO.selectPositionsDiscountAmtConditionCnt(searchVO) > 0 ){
                // 적용일은(는) 중복될 수 없습니다.
                throw processException("global.info.duplicateCheck"
                                      , new String[]{messageSource.getMessage("sal.lbl.applyDate", null, LocaleContextHolder.getLocale()) });
            }

            saveVO.setDlrCd(LoginUtil.getDlrCd());
            saveVO.setRegUsrId(LoginUtil.getUserId());
            saveVO.setUpdtUsrId(LoginUtil.getUserId());
            positionsDiscountDAO.insertPositionsDiscountAmt(saveVO);
       }

        for(PositionsDiscountAmtVO saveVO : obj.getUpdateList()){
            searchVO = new PositionsDiscountSearchVO();

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsCarlineCd(saveVO.getCarlineCd());
            searchVO.setsModelCd(saveVO.getModelCd());
            searchVO.setsOcnCd(saveVO.getOcnCd());
            searchVO.setsStartDt(saveVO.getStartDt());
            searchVO.setsEndDt(saveVO.getEndDt());

            if( positionsDiscountDAO.selectPositionsDiscountAmtConditionCnt(searchVO) > 1 ){
                // 적용일은(는) 중복될 수 없습니다.
                throw processException("global.info.duplicateCheck"
                                      , new String[]{messageSource.getMessage("sal.lbl.applyDate", null, LocaleContextHolder.getLocale()) });
            }

            saveVO.setUpdtUsrId(LoginUtil.getUserId());
            positionsDiscountDAO.updatePositionsDiscountAmt(saveVO);
       }
    }

}
