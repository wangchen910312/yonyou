package chn.bhmc.dms.par.pcm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pcm.service.PurcCostService;
import chn.bhmc.dms.par.pcm.service.PurcCostSgstService;
import chn.bhmc.dms.par.pcm.service.dao.PurcCostDAO;
import chn.bhmc.dms.par.pcm.vo.PurcCostSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcCostSgstSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcCostSgstVO;
import chn.bhmc.dms.par.pcm.vo.PurcCostVO;

/**
 * 구매소요량계산 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 3.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 3.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("purcCostService")
public class PurcCostServiceImpl extends HService implements PurcCostService {

    @Resource(name="purcCostDAO")
    private PurcCostDAO purcCostDAO;

    /**
     * 구매제시 서비스
     */
    @Resource(name="purcCostSgstService")
    PurcCostSgstService purcCostSgstService;

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcCostService#multiPurcCostes(chn.bhmc.dms.par.pcm.vo.PurcCostSearchVO)
     */
    @Override
    public void multiPurcCostes(PurcCostSearchVO searchVO) throws Exception {

        if(purcCostDAO.selectPurcCostesByConditionCnt(searchVO) > 0)
        {
            List<PurcCostVO> purcCostVOList = purcCostDAO.selectPurcCostesByCondition(searchVO);

            // 구매소요량 삭제(전체)
            PurcCostSgstVO purcCostSgstDelVO = new PurcCostSgstVO();
            purcCostSgstDelVO.setDlrCd(LoginUtil.getDlrCd());
            purcCostSgstDelVO.setPltCd(LoginUtil.getPltCd());

            purcCostSgstService.deletePurcCostSgst(purcCostSgstDelVO);

            for(PurcCostVO purcCostVO : purcCostVOList)
            {
                PurcCostSgstVO purcCostSgstVO = new PurcCostSgstVO();

                purcCostSgstVO.setDlrCd(LoginUtil.getDlrCd());                          // 딜러코드
                purcCostSgstVO.setPltCd(LoginUtil.getPltCd());                          // 플랜트(센터)코드
                purcCostSgstVO.setItemCd(purcCostVO.getItemCd());                       // 품목코드
                purcCostSgstVO.setStdDt(purcCostVO.getStdDt());                         // 기준일자
                purcCostSgstVO.setPurcSgstQty(purcCostVO.getPurcSgstQty());             // 구매제시소요량
                purcCostSgstVO.setUnitCd(purcCostVO.getUnitCd());                       // 재고단위코드
                purcCostSgstVO.setSftyStockQty(purcCostVO.getSftyStockQty());           // 안전재고수량
                purcCostSgstVO.setPsntStockQty(purcCostVO.getPsntStockQty());           // 현재고수량
                purcCostSgstVO.setGrScheQty(purcCostVO.getGrScheQty());                 // 입고예정수량
                purcCostSgstVO.setGiScheQty(purcCostVO.getGiScheQty());                 // 출고예정수량
                purcCostSgstVO.setMinPurcQty(purcCostVO.getMinPurcQty());               // 최소구매수량
                purcCostSgstVO.setTrsfQty(purcCostVO.getTrsfQty());                     // 운송수량
                purcCostSgstVO.setPurcOrdRegYn(purcCostVO.getPurcOrdRegYn());           // 구매오더등록여부
                purcCostSgstVO.setTargYn(purcCostVO.getTargYn());                       // 대상여부

                PurcCostSgstSearchVO purcCostSgstSearchVO = new PurcCostSgstSearchVO();
                purcCostSgstSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                purcCostSgstSearchVO.setsItemCd(purcCostVO.getItemCd());
                purcCostSgstSearchVO.setsPltCd(searchVO.getsPltCd());

                if(purcCostSgstService.selectPurcCostSgstesByConditionCnt(purcCostSgstSearchVO) > 0)
                {
                    purcCostSgstVO.setUpdtUsrId(LoginUtil.getUserId());                      // 수정자ID
                    // 수정
                    purcCostSgstService.updatePurcCostSgst(purcCostSgstVO);
                }
                else
                {
                    purcCostSgstVO.setRegUsrId(LoginUtil.getUserId());                      // 등록자ID

                    purcCostSgstService.insertPurcCostSgst(purcCostSgstVO);
                }
            }
        }
        else
        {
            String[] lblList = new String[2];
            // 구매소요량 구매제시 품목코드
            lblList[0] = messageSource.getMessage("par.lbl.purcSgstQty", null, LocaleContextHolder.getLocale())+" "+messageSource.getMessage("par.lbl.itemCdSgst", null, LocaleContextHolder.getLocale());
            // 구매소요량 구매제시 품목코드 존재하지 않습니다.
            throw processException("par.info.itemInserNotMsg", lblList);
        }
    }
}
