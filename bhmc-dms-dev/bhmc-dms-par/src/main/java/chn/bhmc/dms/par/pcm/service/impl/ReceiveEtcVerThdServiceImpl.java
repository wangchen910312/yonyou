package chn.bhmc.dms.par.pcm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pcm.service.ReceiveEtcService;
import chn.bhmc.dms.par.pcm.service.ReceiveEtcVerThdService;
import chn.bhmc.dms.par.pcm.service.dao.ReceiveEtcVerThdDAO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemTrdVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcVerThdSearchVO;
import chn.bhmc.dms.par.pmm.service.ItemMasterService;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;

/**
 * 기초재고입고(진행중 정비수령) 구현 클래스
 *
 * @author In Bo Shim
 * @since 2017. 8. 8.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2017. 8. 8.     In Bo Shim      최초 생성
 * </pre>
 */

@Service("receiveEtcVerThdService")
public class ReceiveEtcVerThdServiceImpl extends HService implements ReceiveEtcVerThdService{

    @Resource(name="receiveEtcVerThdDAO")
    private ReceiveEtcVerThdDAO receiveEtcVerThdDAO;

    /**
     * 기타입고 서비스
     */
    @Resource(name="receiveEtcService")
    ReceiveEtcService receiveEtcService;

    /**
     * 부품마스터 서비스
     */
    @Resource(name="itemMasterService")
    ItemMasterService itemMasterService;

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcVerThdService#insertReceiveEtcVerThd(java.util.List, chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public ReceiveEtcVO insertReceiveEtcVerThd(ReceiveEtcVO receiveEtcVO)
            throws Exception {

        ReceiveEtcVerThdSearchVO searchVO = new ReceiveEtcVerThdSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsApplyYn("N");
        searchVO.setsGrGiScheQtyZeroYn("Y");//입출고수량0이상
        List<ReceiveEtcItemTrdVO> receiveEtcItemTrdVOList = receiveEtcVerThdDAO.selectReceiveEtcVerThdesByCondition(searchVO);

        receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        receiveEtcVO.setUpdtUsrId(LoginUtil.getUserId());
        receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
        receiveEtcVO.setPltCd(LoginUtil.getPltCd());
        receiveEtcVO.setRegDt(new Date());
        receiveEtcVO.setUpdtDt(new Date());

        ReceiveEtcVO retReceiveEtcVO = new ReceiveEtcVO();
        //ReceiveEtcVO retCnfmReceiveEtcVO = new ReceiveEtcVO();

        if(receiveEtcItemTrdVOList.size() > 0){

            //TODO : ReceiveEtcItemTrdVO 리스트를 기타입고 부품 리스트로 변환.
            List<ReceiveEtcItemVO> etcItemList = new ArrayList<ReceiveEtcItemVO>();

            for(ReceiveEtcItemTrdVO receiveEtcItemTrdVO01 : receiveEtcItemTrdVOList){
                ReceiveEtcItemVO receiveEtcItemVO = new ReceiveEtcItemVO();

                receiveEtcItemVO.setItemCd(receiveEtcItemTrdVO01.getItemCd());
                receiveEtcItemVO.setItemNm(receiveEtcItemTrdVO01.getItemCd());
                receiveEtcItemVO.setDlrCd(receiveEtcItemTrdVO01.getDlrCd());
                receiveEtcItemVO.setQty(receiveEtcItemTrdVO01.getGiScheQty());//출고예정수량
                receiveEtcItemVO.setStrgeCd(receiveEtcItemTrdVO01.getStrgeCd());//창고
                receiveEtcItemVO.setPrc(receiveEtcItemTrdVO01.getGiAmt());//최신입고가(단가)
                receiveEtcItemVO.setAmt(receiveEtcItemTrdVO01.getStockAmt());//재고금액
                receiveEtcItemVO.setUnitCd("EA");
                etcItemList.add(receiveEtcItemVO);

                //기초재고입고(진행중 정비수령) 상태 수정 처리.
                receiveEtcVerThdDAO.updateReceiveEtcVerThd(receiveEtcItemTrdVO01);

            }

            //기타입고 생성.
            retReceiveEtcVO = receiveEtcService.createReceiveEtcReg(etcItemList, receiveEtcVO);

        }else{
            retReceiveEtcVO.setResultYn(false);
        }

        return retReceiveEtcVO;
    }


    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcVerThdService#executeReceiveEtcInitProcedure(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public void executeReceiveEtcInitProcedure(ReceiveEtcVO retReceiveEtcVO) throws Exception {

        retReceiveEtcVO.setEtcGrDocTp("S");//기초재고입고 V3 구분자 : S
        receiveEtcService.executeReceiveEtcInitProcedure(retReceiveEtcVO);

    }



    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcVerThdService#insertReceiveEtcVerThdItemMaster(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public void insertReceiveEtcVerThdItemMaster(ReceiveEtcVO receiveEtcVO) throws Exception {

        ReceiveEtcVerThdSearchVO searchVO = new ReceiveEtcVerThdSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsApplyYn("N");
        searchVO.setsGrGiScheQtyZeroYn("Y");//입출고수량0이상
        List<ReceiveEtcItemTrdVO> receiveEtcItemTrdVOList = receiveEtcVerThdDAO.selectReceiveEtcVerThdesItemMasterByCondition(searchVO);

        receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        receiveEtcVO.setUpdtUsrId(LoginUtil.getUserId());
        receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
        receiveEtcVO.setPltCd(LoginUtil.getPltCd());
        receiveEtcVO.setRegDt(new Date());
        receiveEtcVO.setUpdtDt(new Date());

        String strgeCd = "WHP1";
        String dlrCd = LoginUtil.getDlrCd();

        if(receiveEtcItemTrdVOList.size() > 0){

            for(ReceiveEtcItemTrdVO receiveEtcItemTrdVO01 : receiveEtcItemTrdVOList){
                //부품정보확인.
                ItemMasterSearchVO itemMasterSearchVO = new ItemMasterSearchVO();
                itemMasterSearchVO.setsDlrCd(dlrCd);
                itemMasterSearchVO.setsItemCdOnly(receiveEtcItemTrdVO01.getItemCd());

                if(itemMasterService.selectItemMastersByConditionCnt(itemMasterSearchVO) == 0){
                    //부품마스터 추가.
                    ItemMasterVO itemMasterVO = new ItemMasterVO();
                    itemMasterVO.setDlrCd(dlrCd);
                    itemMasterVO.setItemCd(receiveEtcItemTrdVO01.getItemCd());
                    itemMasterVO.setItemNm(receiveEtcItemTrdVO01.getItemCd());
                    itemMasterVO.setItemDstinCd("02");
                    itemMasterVO.setSpyrCd("02");

                    itemMasterVO.setGrStrgeCd(strgeCd);
                    itemMasterVO.setGiStrgeCd(strgeCd);
                    itemMasterVO.setEndYn("N");
                    itemMasterVO.setStdrdStockCalcYn("N");
                    itemMasterVO.setPurcCqtyCalcYn("N");
                    itemMasterVO.setImpTestTp("N");
                    itemMasterVO.setNonMovingFlg("N");
                    itemMasterVO.setLocalItemIfYn("N");
                    itemMasterVO.setPrndYn("N");
                    itemMasterVO.setDgrItemYn("N");
                    itemMasterVO.setPaintYn("N");
                    itemMasterVO.setMjrErrYn("N");
                    itemMasterVO.setMjrUseYn("N");
                    itemMasterVO.setRegUsrId(LoginUtil.getUserId());
                    itemMasterService.insertItemMaster(itemMasterVO);
                }
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcVerThdService#selectReceiveEtcVerThdesItemMasterByCondition(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVerThdSearchVO)
     */
    @Override
    public List<ReceiveEtcItemTrdVO> selectReceiveEtcVerThdesItemMasterByCondition(ReceiveEtcVerThdSearchVO searchVO)
            throws Exception {
        return receiveEtcVerThdDAO.selectReceiveEtcVerThdesItemMasterByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcVerThdService#selectReceiveEtcVerThdesItemMasterByConditionCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVerThdSearchVO)
     */
    @Override
    public int selectReceiveEtcVerThdesItemMasterByConditionCnt(ReceiveEtcVerThdSearchVO searchVO) throws Exception {
        return receiveEtcVerThdDAO.selectReceiveEtcVerThdesItemMasterByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcVerThdService#updateReceiveEtcVerThd(java.util.List)
     */
    @Override
    public int updateReceiveEtcVerThd(ReceiveEtcItemTrdVO receiveEtcItemTrdVO) throws Exception {
        return receiveEtcVerThdDAO.updateReceiveEtcVerThd(receiveEtcItemTrdVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcVerThdService#selectReceiveEtcVerThdesByCondition(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVerThdSearchVO)
     */
    @Override
    public List<ReceiveEtcItemTrdVO> selectReceiveEtcVerThdesByCondition(ReceiveEtcVerThdSearchVO searchVO)
            throws Exception {
        return receiveEtcVerThdDAO.selectReceiveEtcVerThdesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcVerThdService#selectReceiveEtcVerThdesByConditionCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVerThdSearchVO)
     */
    @Override
    public int selectReceiveEtcVerThdesByConditionCnt(ReceiveEtcVerThdSearchVO searchVO) throws Exception {
        return receiveEtcVerThdDAO.selectReceiveEtcVerThdesByConditionCnt(searchVO);
    }




}
