package chn.bhmc.dms.par.ism.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssuePartsAvlbService;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;

/**
 * 부품예약 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 18.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("issuePartsAvlbService")
public class IssuePartsAvlbServiceImpl extends HService implements IssuePartsAvlbService {

    /**
     * 현재고 서비스
     */
    @Resource(name="stockInOutService")
    StockInOutService stockInOutService;

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsAvlbService#multiIssueReqDetailPartsAvlbes(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiIssueReqDetailPartsAvlbes(BaseSaveVO<IssueReqDetailVO> obj) throws Exception {

        for(IssueReqDetailVO issueReqDetailVO : obj.getUpdateList()){
            StockInOutVO stockInOutVOByKey = stockInOutService.selectStockInOutByKey(LoginUtil.getDlrCd(),LoginUtil.getPltCd(), issueReqDetailVO.getGiStrgeCd(), issueReqDetailVO.getItemCd());
            StockInOutVO stockInOutVO = new StockInOutVO();
            stockInOutVO.setDlrCd(LoginUtil.getDlrCd());
            stockInOutVO.setPltCd(LoginUtil.getPltCd());
            stockInOutVO.setStrgeCd(stockInOutVOByKey.getStrgeCd());
            stockInOutVO.setItemCd(stockInOutVOByKey.getItemCd());
            // 예약수량 가용수량 이동.
            stockInOutVO.setAvlbStockQty(stockInOutVOByKey.getAvlbStockQty() + stockInOutVOByKey.getResvStockQty());
            // 예약수량 0
            stockInOutVO.setResvStockQty(0);
            stockInOutVO.setUpdtUsrId(LoginUtil.getUserId());
            stockInOutService.updateStockInOut(stockInOutVO);
        }
    }


}
