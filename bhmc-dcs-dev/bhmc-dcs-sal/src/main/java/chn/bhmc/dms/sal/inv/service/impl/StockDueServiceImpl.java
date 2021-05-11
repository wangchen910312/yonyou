package chn.bhmc.dms.sal.inv.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.inv.service.StockDueService;
import chn.bhmc.dms.sal.inv.service.dao.StockDueDAO;
import chn.bhmc.dms.sal.inv.vo.StockDueSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockDueVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockStateServiceServiceImpl
 * @Description : 재고실사
 * @author Jin Suk Kim
 * @since 2016. 08. 04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.08.04.     Jin Suk Kim        최초 생성
 * </pre>
 */

@Service("stockDueService")
public class StockDueServiceImpl extends HService implements StockDueService {

    /**
     * 재고실사 DAO 선언
     */
    @Resource(name="stockDueDAO")
    StockDueDAO stockDueDAO;

    /**
     * 재고실사 자료 생성
     */
    public int CreateStockDueInfo(StockDueVO saveVO) throws Exception{

        if(stockDueDAO.selectStockDueInfoCnt(saveVO) == 0){
            saveVO.setRegUsrId(LoginUtil.getUserId());
            stockDueDAO.insertStockDueInfo(saveVO);
        }else{
            // msg : 재고실사 정보는 하루에 1번씩만 생성이 가능합니다.
            throw processException("sal.info.StockDueCreateInfo");
        }
        return 1;
    }

    /**
     * 재고실사 헤더 갯수 조회
     */
    public int selectStockDueListsByConditionCnt(StockDueSearchVO searchVO) throws Exception{
        return stockDueDAO.selectStockDueListsByConditionCnt(searchVO);
    }

    /**
     * 재고실사 헤더 조회
     */
    public List<StockDueVO> selectStockDueListsByCondition(StockDueSearchVO searchVO) throws Exception{
        return stockDueDAO.selectStockDueListsByCondition(searchVO);
    }

    /**
     * 재고실사 내역 갯수 조회
     */
    public int selectStockDueDetailListsByConditionCnt(StockDueSearchVO searchVO) throws Exception{
        return stockDueDAO.selectStockDueDetailListsByConditionCnt(searchVO);
    }

    /**
     * 재고실사 내역 조회
     */
    public List<StockDueVO> selectStockDueDetailListsByCondition(StockDueSearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return stockDueDAO.selectStockDueDetailListsByCondition(searchVO);
    }

    /**
     * 재고실사 내역 갯수 조회
     */
    public int multiStockDue(BaseSaveVO<StockDueVO> saveVO) throws Exception{

        for(StockDueVO sVO : saveVO.getUpdateList()){
            sVO.setRegUsrId(LoginUtil.getUserId() );
            sVO.setUpdtUsrId(LoginUtil.getUserId() );
            sVO.setDlrCd(LoginUtil.getDlrCd());
            stockDueDAO.updateStockDue(sVO);
        }
        return 1;
    }
}
