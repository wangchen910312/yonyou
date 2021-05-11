package chn.bhmc.dms.bat.sal.inv.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.sal.inv.service.StockMntPreMonthDelService;
import chn.bhmc.dms.bat.sal.inv.service.dao.StockMntPreMonthDelDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockMntPreMonthDelServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 6. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 6.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Service("stockMntPreMonthDelService")
public class StockMntPreMonthDelServiceImpl extends HService implements StockMntPreMonthDelService {


    @Resource(name="stockMntPreMonthDelDAO")
    StockMntPreMonthDelDAO stockMntPreMonthDelDAO;

    /**
    *
    * 이전 전략 출고 신청 , 거절건 삭제
    *
    * @param day
    * @return
    * @throws Exception
    */
    @Override
    public int updateStockMntPreMonthDel(int day) throws Exception {
    	day = (day !=0 ) ? day : 1;
        stockMntPreMonthDelDAO.updateStockMntPreMonthDel(day);
        //修改相应车辆的都是删除才能将车辆终端标识str_yn修改为'N'。
        stockMntPreMonthDelDAO.updateStrYnByVinno(day);
        return 1;
    }

}
