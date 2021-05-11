package chn.bhmc.dms.par.dlm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.dlm.service.EndingStockService;
import chn.bhmc.dms.par.dlm.service.dao.EndingStockDAO;
import chn.bhmc.dms.par.dlm.vo.EndingStockVO;


/**
 * 수불유형 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Ju Won Lee      최초 생성
 * </pre>
 */
@Service("endingStockService")
public class EndingStockServiceImpl extends HService implements EndingStockService {

    @Resource(name="endingStockDAO")
    private EndingStockDAO endingStockDAO;


    /*
     * @see chn.bhmc.dms.par.dlm.service.EndingStockService#selectEndingStockByKey(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public EndingStockVO selectEndingStockByKey(String dlrCd, String pltCd, String strgeCd, String itemCd) {
        return endingStockDAO.selectEndingStockByKey(dlrCd, pltCd, strgeCd, itemCd);
    }

}
