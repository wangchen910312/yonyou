package chn.bhmc.dms.mob.api.sales.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.sales.dao.SalesStockMntDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesStockMntService;
import chn.bhmc.dms.mob.api.sales.vo.StockMntSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.StockMntVO;


/**
 *
 * @ClassName   : StockMntServiceImpl
 * @Description : 재고관리
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.11.24          최초 생성
 * </pre>
 */

@Service("SalesStockMntService")
public class SalesStockMntServiceImpl extends HService implements SalesStockMntService{

    /**
     * 재고상태관리 DAO 선언
     */
    @Resource(name="SalesStockMntDAO")
    SalesStockMntDAO SalesStockMntDAO;

    
    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return
     */
    @Override
    public int selectStockMntsByConditionCnt(StockMntSearchVO searchVO) throws Exception{
        return SalesStockMntDAO.selectStockMntsByConditionCnt(searchVO);
    }
    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return 조회 목록
     */
    @Override
    public List<StockMntVO> selectStockMntsByCondition(StockMntSearchVO searchVO) throws Exception{
        return SalesStockMntDAO.selectStockMntsByCondition(searchVO);
    }
    
    /**
     * 모바일 APP 그룹 재고관리 목록 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public int selectAppStockMntGroupsByConditionCnt(StockMntSearchVO searchVO) throws Exception{
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return SalesStockMntDAO.selectAppStockMntGroupsByConditionCnt(searchVO);
    }
    
    @Override
    public List<StockMntVO> selectAppStockMntGroupsByCondition(StockMntSearchVO searchVO) throws Exception{
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return SalesStockMntDAO.selectAppStockMntGroupsByCondition(searchVO);
    }

    
    
}
