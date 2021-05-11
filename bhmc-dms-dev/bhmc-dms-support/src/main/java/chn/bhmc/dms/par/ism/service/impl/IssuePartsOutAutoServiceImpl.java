package chn.bhmc.dms.par.ism.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssuePartsOutAutoService;
import chn.bhmc.dms.par.ism.service.IssuePartsOutService;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.service.dao.IssuePartsOutAutoDAO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutSaveVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.par.ism.vo.ReceiveEtcItemTrdSupportVO;
import chn.bhmc.dms.par.ism.vo.ReceiveEtcVerThdSupportSearchVO;

/**
 * 부품자동출고 구현 클래스
 *
 * @author In Bo Shim
 * @since 2017. 8. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2017. 8. 15.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("issuePartsOutAutoService")
public class IssuePartsOutAutoServiceImpl extends HService implements IssuePartsOutAutoService {

    Logger logger = LoggerFactory.getLogger(IssuePartsOutAutoServiceImpl.class);

    /**
     * 부품자동출고 헤더 DAO
     */
    @Resource(name="issuePartsOutAutoDAO")
    private IssuePartsOutAutoDAO issuePartsOutAutoDAO;

    /**
     * 부품출고 서비스
     */
    @Resource(name="issuePartsOutService")
    IssuePartsOutService issuePartsOutService;

    /**
     * 부품요청 서비스
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    /**
     * 부품요청상세 서비스
     */
    @Resource(name="issueReqDetailService")
    IssueReqDetailService issueReqDetailService;

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutAutoService#updateReceiveEtcVerSupportThd(chn.bhmc.dms.par.ism.vo.ReceiveEtcItemTrdSupportVO)
     */
    @Override
    public int updateReceiveEtcVerSupportThd(ReceiveEtcItemTrdSupportVO receiveEtcItemTrdSupportVO) throws Exception {

        return issuePartsOutAutoDAO.updateReceiveEtcVerSupportThd(receiveEtcItemTrdSupportVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutAutoService#selectReceiveEtcVerSupportThdesByCondition(chn.bhmc.dms.par.ism.vo.ReceiveEtcVerThdSupportSearchVO)
     */
    @Override
    public List<ReceiveEtcItemTrdSupportVO> selectReceiveEtcVerSupportThdesByCondition(
            ReceiveEtcVerThdSupportSearchVO searchVO) throws Exception {

        return issuePartsOutAutoDAO.selectReceiveEtcVerSupportThdesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutAutoService#selectReceiveEtcVerSupportThdesByConditionCnt(chn.bhmc.dms.par.ism.vo.ReceiveEtcVerThdSupportSearchVO)
     */
    @Override
    public int selectReceiveEtcVerSupportThdesByConditionCnt(ReceiveEtcVerThdSupportSearchVO searchVO) throws Exception {

        return issuePartsOutAutoDAO.selectReceiveEtcVerSupportThdesByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutAutoService#selectReceiveEtcVerSupportThdesRoDocNoByCondition(chn.bhmc.dms.par.ism.vo.ReceiveEtcVerThdSupportSearchVO)
     */
    @Override
    public List<ReceiveEtcItemTrdSupportVO> selectReceiveEtcVerSupportThdesRoDocNoByCondition(
            ReceiveEtcVerThdSupportSearchVO searchVO) throws Exception {

        //기초재고입고 V3 정비수령 정보 조회.
        ReceiveEtcVerThdSupportSearchVO searchVO01 = new ReceiveEtcVerThdSupportSearchVO();
        searchVO01.setsDlrCd(LoginUtil.getDlrCd());
        searchVO01.setsApplyGiYn("N");
        //기초재고V3 정비수령 RO번호 조회.
        //List<ReceiveEtcItemTrdSupportVO> roDocList = issuePartsOutAutoDAO.selectReceiveEtcVerSupportThdesRoDocNoByCondition(searchVO01);

        return issuePartsOutAutoDAO.selectReceiveEtcVerSupportThdesRoDocNoByCondition(searchVO01);
    }



    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutAutoService#insertIssuePartsOutAutoRow(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO, chn.bhmc.dms.par.ism.vo.ReceiveEtcItemTrdSupportVO)
     */
    @Override
    public IssuePartsOutSaveVO insertIssuePartsOutAutoRow(IssueReqSearchVO searchVO,
            ReceiveEtcItemTrdSupportVO roInfoVO01) throws Exception {

        IssuePartsOutSaveVO issuePartsOutReqSaveVO = new IssuePartsOutSaveVO();

        ReceiveEtcVerThdSupportSearchVO searchVO02 = new ReceiveEtcVerThdSupportSearchVO();
        searchVO02.setsDlrCd(LoginUtil.getDlrCd());
        searchVO02.setsRoDocNo(roInfoVO01.getRoDocNo());

        //기초재고V3 정비수령 미출고 리스트 조회.
        List<ReceiveEtcItemTrdSupportVO> roItemlist = issuePartsOutAutoDAO.selectReceiveEtcVerSupportThdesPartitionByCondition(searchVO02);

        //정비수령 출고 리스트 데이타 변환.
        boolean headerYn = false;
        //출고헤더정보
        IssuePartsOutVO issuePartsOutVO = new IssuePartsOutVO();
        IssueReqVO issueReqVO = null;

        try{
            issueReqVO = issueReqService.selectIssueReqByKey(roInfoVO01.getDlrCd(), null, roInfoVO01.getRoDocNo(), "RO");
        }catch(Exception ex){
            logger.error("PT_0501T AND SE_0300T is not Exist roDocNo : "+roInfoVO01.getRoDocNo());
        }

        if(issueReqVO != null){

            issuePartsOutVO.setGiDocNo("");
            //출고상태코드 요청(01) ==> 완료(02)변환.
            issuePartsOutVO.setGiDocStatCd("02");
            issuePartsOutVO.setGiDocTp("02");
            issuePartsOutVO.setCancYn("N");
            issuePartsOutVO.setParReqDocNo(issueReqVO.getParReqDocNo());
            issuePartsOutVO.setParGiTp(issueReqVO.getParGiTp());
            issuePartsOutVO.setRoDocNo(issueReqVO.getRoDocNo());
            issuePartsOutVO.setRoTp(issueReqVO.getRoTp());
            issuePartsOutVO.setSerPrsnId(issueReqVO.getSerPrsnId());
            issuePartsOutVO.setCustCd(issueReqVO.getCustCd());
            issuePartsOutVO.setCustNm(issueReqVO.getCustNm());
            issuePartsOutVO.setVinNo(issueReqVO.getVinNo());
            issuePartsOutVO.setCarNo(issueReqVO.getCarNo());

            headerYn = true;
        }

        //출고상세정보
        List<IssueReqDetailVO> issueReqDetailVOList = new ArrayList<IssueReqDetailVO>();

        for(ReceiveEtcItemTrdSupportVO roItemInfoVO01 : roItemlist){
            IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
            issueReqSearchVO.setsDlrCd(roItemInfoVO01.getDlrCd());
            issueReqSearchVO.setsParReqDocNo(roItemInfoVO01.getParReqDocNo());
            issueReqSearchVO.setsRoDocNo(roItemInfoVO01.getRoDocNo());
            issueReqSearchVO.setsRoLineNo(roItemInfoVO01.getRoLineNo());
            issueReqSearchVO.setsItemCd(roItemInfoVO01.getItemCd());
            issueReqSearchVO.setsReqStrgeCd(roItemInfoVO01.getStrgeCd());
            issueReqSearchVO.setsParReqStatCd("01");//부품요청상태 : 01(등록)

            //기초재고입고 V3 정비수령 상태 처리.
            issuePartsOutAutoDAO.updateReceiveEtcVerSupportThd(roItemInfoVO01);

            try{
                //동일부품으로 인한 리스트를 조회.
                List<IssueReqDetailVO> issueReqDetailVODbList = issuePartsOutAutoDAO.selectReceiveEtcVerSupportThdesIssueReqDetailByCondition(issueReqSearchVO);

                for(IssueReqDetailVO issueReqDetailVO : issueReqDetailVODbList){
                    //출고상태코드 요청(01) ==> 완료(02)변환.
                    issueReqDetailVO.setParReqStatCd("02");
                    //요청/예약/완료수량 설정.
                    issueReqDetailVO.setReqQty(roItemInfoVO01.getGiScheQty());
                    issueReqDetailVO.setResvQty(roItemInfoVO01.getGiScheQty());
                    issueReqDetailVO.setEndQty(roItemInfoVO01.getGiScheQty());
                    //반품수량 설정.
                    issueReqDetailVO.setReturnPartsQty(0.0);
                    //수령인 설정.
                    issueReqDetailVO.setReceiveId(searchVO.getsReceiveId());
                    //부품요청상세 리스트 추가.
                    issueReqDetailVOList.add(issueReqDetailVO);
                }

            }catch(Exception ex){
                logger.error("PT_0502T is error raised : roDocNo : "+roInfoVO01.getRoDocNo());
            }
        }

        if(headerYn && issueReqDetailVOList.size() > 0){
            IssuePartsOutSaveVO issuePartsOutSaveVO = new IssuePartsOutSaveVO();
            issuePartsOutSaveVO.setIssuePartsOutVO(issuePartsOutVO);
            issuePartsOutSaveVO.setIssueReqDetailVO(issueReqDetailVOList);

            try{
                //정비수령 출고 처리.
                issuePartsOutReqSaveVO = issuePartsOutService.insertIssuePartsOut(issuePartsOutSaveVO);

            }catch(Exception ex){
                logger.error("PT_0511T AND PT_0512T is error raised roDocNo : "+roInfoVO01.getRoDocNo());

            }
        }

        return issuePartsOutReqSaveVO;
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssuePartsOutAutoService#insertIssuePartsOutAuto(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public IssuePartsOutSaveVO insertIssuePartsOutAuto(IssueReqSearchVO searchVO) throws Exception {

        IssuePartsOutSaveVO issuePartsOutReqSaveVO = new IssuePartsOutSaveVO();
        //기초재고입고 V3 정비수령 정보 조회.
        ReceiveEtcVerThdSupportSearchVO searchVO01 = new ReceiveEtcVerThdSupportSearchVO();
        searchVO01.setsDlrCd(LoginUtil.getDlrCd());
        searchVO01.setsApplyGiYn("N");
        //기초재고V3 정비수령 RO번호 조회.
        List<ReceiveEtcItemTrdSupportVO> roDocList = issuePartsOutAutoDAO.selectReceiveEtcVerSupportThdesRoDocNoByCondition(searchVO01);

        for(ReceiveEtcItemTrdSupportVO roInfoVO01 : roDocList){

            ReceiveEtcVerThdSupportSearchVO searchVO02 = new ReceiveEtcVerThdSupportSearchVO();
            searchVO02.setsDlrCd(LoginUtil.getDlrCd());
            searchVO02.setsRoDocNo(roInfoVO01.getRoDocNo());
            searchVO02.setsApplyGiYn("N");

            //기초재고V3 정비수령 미출고 리스트 조회.
            List<ReceiveEtcItemTrdSupportVO> roItemlist = issuePartsOutAutoDAO.selectReceiveEtcVerSupportThdesPartitionByCondition(searchVO02);

            //정비수령 출고 리스트 데이타 변환.
            boolean headerYn = false;
            //출고헤더정보
            IssuePartsOutVO issuePartsOutVO = new IssuePartsOutVO();
            IssueReqVO issueReqVO = null;

            try{
                issueReqVO = issueReqService.selectIssueReqByKey(roInfoVO01.getDlrCd(), null, roInfoVO01.getRoDocNo(), "RO");
            }catch(Exception ex){
                logger.error("PT_0501T AND SE_0300T is not Exist roDocNo : "+roInfoVO01.getRoDocNo());
            }

            if(issueReqVO != null){

                issuePartsOutVO.setGiDocNo("");
                //출고상태코드 요청(01) ==> 완료(02)변환.
                issuePartsOutVO.setGiDocStatCd("02");
                issuePartsOutVO.setGiDocTp("02");
                issuePartsOutVO.setCancYn("N");
                issuePartsOutVO.setParReqDocNo(issueReqVO.getParReqDocNo());
                issuePartsOutVO.setParGiTp(issueReqVO.getParGiTp());
                issuePartsOutVO.setRoDocNo(issueReqVO.getRoDocNo());
                issuePartsOutVO.setRoTp(issueReqVO.getRoTp());
                issuePartsOutVO.setSerPrsnId(issueReqVO.getSerPrsnId());
                issuePartsOutVO.setCustCd(issueReqVO.getCustCd());
                issuePartsOutVO.setCustNm(issueReqVO.getCustNm());
                issuePartsOutVO.setVinNo(issueReqVO.getVinNo());
                issuePartsOutVO.setCarNo(issueReqVO.getCarNo());

                headerYn = true;
            }

            //출고상세정보
            List<IssueReqDetailVO> issueReqDetailVOList = new ArrayList<IssueReqDetailVO>();

            for(ReceiveEtcItemTrdSupportVO roItemInfoVO01 : roItemlist){
                IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
                issueReqSearchVO.setsDlrCd(roItemInfoVO01.getDlrCd());
                issueReqSearchVO.setsParReqDocNo(roItemInfoVO01.getParReqDocNo());
                issueReqSearchVO.setsRoDocNo(roItemInfoVO01.getRoDocNo());
                issueReqSearchVO.setsRoLineNo(roItemInfoVO01.getRoLineNo());
                issueReqSearchVO.setsItemCd(roItemInfoVO01.getItemCd());

                IssueReqDetailVO issueReqDetailVO = null;

                try{
                    issueReqDetailVO = issuePartsOutAutoDAO.selectReceiveEtcVerSupportThdesIssueReqDetailByKey(issueReqSearchVO);

                    if(issueReqDetailVO != null){
                        //출고상태코드 요청(01) ==> 완료(02)변환.
                        issueReqDetailVO.setParReqStatCd("02");
                        //요청/예약/완료수량 설정.
                        issueReqDetailVO.setReqQty(roItemInfoVO01.getGiScheQty());
                        issueReqDetailVO.setResvQty(roItemInfoVO01.getGiScheQty());
                        issueReqDetailVO.setEndQty(roItemInfoVO01.getGiScheQty());
                        //반품수량 설정.
                        issueReqDetailVO.setReturnPartsQty(0.0);
                        //수령인 설정.
                        issueReqDetailVO.setReceiveId(searchVO.getsReceiveId());

                        issueReqDetailVOList.add(issueReqDetailVO);
                    }

                }catch(Exception ex){
                    logger.error("PT_0502T is error raised : roDocNo : "+roInfoVO01.getRoDocNo());
                }
            }

            if(headerYn && issueReqDetailVOList.size() > 0){
                IssuePartsOutSaveVO issuePartsOutSaveVO = new IssuePartsOutSaveVO();
                issuePartsOutSaveVO.setIssuePartsOutVO(issuePartsOutVO);
                issuePartsOutSaveVO.setIssueReqDetailVO(issueReqDetailVOList);

                try{
                    //정비수령 출고 처리.
                    issuePartsOutReqSaveVO = issuePartsOutService.insertIssuePartsOut(issuePartsOutSaveVO);

                    //기초재고입고 V3 정비수령 상태 처리.
                    for(ReceiveEtcItemTrdSupportVO roItemInfoVO02 : roItemlist){
                        issuePartsOutAutoDAO.updateReceiveEtcVerSupportThd(roItemInfoVO02);
                    }
                }catch(Exception ex){
                    logger.error("PT_0511T AND PT_0512T is error raised roDocNo : "+roInfoVO01.getRoDocNo());

                }
            }
        }

        return issuePartsOutReqSaveVO;
    }


}