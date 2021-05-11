package chn.bhmc.dms.par.pcm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.pcm.service.PurcRqstService;
import chn.bhmc.dms.par.pcm.service.dao.PurcRqstDAO;
import chn.bhmc.dms.par.pcm.vo.PurcRqstSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcRqstVO;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
import chn.bhmc.dms.par.stm.service.GrGiScheduleService;
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.vo.GrGiScheduleVO;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;

/**
 * 구매요청 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 29.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("purcRqstService")
public class PurcRqstServiceImpl extends HService implements PurcRqstService {

    /*
     * 구매요청 DAO
    */
    @Resource(name="purcRqstDAO")
    private PurcRqstDAO purcRqstDAO;

    /*
     * 구매요청 키젠 생성 서비스.
    */
    @Resource(name="purcReqNoIdgenService")
    TableIdGenService purcReqNoIdgenService;

    /*
     * 구매요청시 입출고예정 필수 체크 서비스
    */
    @Resource(name="grGiScheduleService")
    GrGiScheduleService grGiScheduleService;

    /*
     * 업체정보 서비스.
    */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

    /*
     * 재고관리 서비스.
    */
    @Resource(name="stockInOutService")
    StockInOutService stockInOutService;

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcRqstService#insertPurcRqst(chn.bhmc.dms.par.pcm.vo.PurcRqstVO)
     */
    @Override
    public int insertPurcRqst(PurcRqstVO purcRgstVO) throws Exception {
        purcRgstVO.setDlrCd(LoginUtil.getDlrCd());
        purcRgstVO.setPltCd(LoginUtil.getPltCd());
        purcRgstVO.setRegUsrId(LoginUtil.getUserId());
        purcRgstVO.setUpdtUsrId(LoginUtil.getUserId());
        return purcRqstDAO.insertPurcRqst(purcRgstVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcRqstService#updatePurcRqst(chn.bhmc.dms.par.pcm.vo.PurcRqstVO)
     */
    @Override
    public int updatePurcRqst(PurcRqstVO purcRgstVO) throws Exception {
        purcRgstVO.setDlrCd(LoginUtil.getDlrCd());
        purcRgstVO.setPltCd(LoginUtil.getPltCd());
        purcRgstVO.setUpdtUsrId(LoginUtil.getUserId());
        return purcRqstDAO.updatePurcRqst(purcRgstVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcRqstService#deletePurcRqst(chn.bhmc.dms.par.pcm.vo.PurcRqstVO)
     */
    @Override
    public int deletePurcRqst(PurcRqstVO purcRgstVO) throws Exception {
        return purcRqstDAO.deletePurcRqst(purcRgstVO);
    }


    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcRqstService#multiIssueReqDetailPartsRoes(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiIssueReqDetailPartsRoes(BaseSaveVO<IssueReqDetailVO> obj) throws Exception {

        for(IssueReqDetailVO issueReqDetailVO : obj.getUpdateList()){

            String[] lblList = new String[2];
            // 구매요청수량 체크.
            if(issueReqDetailVO.getResvQty() <= 0 ) // 구매요청수량  <= 0
            {
                lblList[0] = messageSource.getMessage("par.lbl.purcReqQty", null, LocaleContextHolder.getLocale());    // 구매요청수량
                lblList[1] = String.valueOf("0");     // 구매요청수량 value
                // 구매요청수량은  보다 커야 합니다.
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }

            /*
             * 구매요청 처리.
             * */

            // 구매요청 VO 생성.
            PurcRqstVO purcRqstVO = new PurcRqstVO();

            purcRqstVO.setDlrCd(LoginUtil.getDlrCd());                          // 딜러코드
            purcRqstVO.setPltCd(LoginUtil.getPltCd());                          // 플랜트코드

            // 구매요청번호 체크.
            if(!StringUtils.isEmpty(issueReqDetailVO.getPurcReqNo())){
                purcRqstVO.setPurcReqNo(issueReqDetailVO.getPurcReqNo());
                purcRqstVO.setPurcReqLineNo(issueReqDetailVO.getRoLineNo());
            }

            //부품예약 : 01, 정비수령 : 02, 부품판매 : 03
            if("SP".equals(issueReqDetailVO.getParGiTp())){//부품예약
                purcRqstVO.setPurcReqTp("01");
            }else if("RO".equals(issueReqDetailVO.getParGiTp())){//RO
                purcRqstVO.setPurcReqTp("02");
            }

            purcRqstVO.setPurcReqStatCd(issueReqDetailVO.getParReqStatCd());    //구매요청상태코드
            purcRqstVO.setRefDocNo(issueReqDetailVO.getRoDocNo());              //참조문서번호
            purcRqstVO.setRefDocLineNo(issueReqDetailVO.getRoLineNo());         //참조문서라인번호
            purcRqstVO.setPltCd(issueReqDetailVO.getPltCd());                   //센터코드
            purcRqstVO.setStrgeCd(issueReqDetailVO.getReqStrgeCd());            //요청창고
            purcRqstVO.setItemCd(issueReqDetailVO.getItemCd());                 //품목코드
            purcRqstVO.setPurcReqQty(issueReqDetailVO.getResvQty());            //구매요청수량
            purcRqstVO.setPurcReqUnitCd(issueReqDetailVO.getUnitCd());          //구매요청단위코드
            purcRqstVO.setPurcReqDt(issueReqDetailVO.getPurcReqDt());           //구매요청일자
            purcRqstVO.setDelYn("N");                                           //삭제여부
            purcRqstVO.setRegUsrId(LoginUtil.getUserId());                      //등록자아이디
            purcRqstVO.setUpdtUsrId(LoginUtil.getUserId());                     //수정자아이디

            //구매요청 검색 VO 생성.
            PurcRqstSearchVO searchVO = new PurcRqstSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());                           //딜러코드
            searchVO.setsPltCd(LoginUtil.getPltCd());                           //플랜트코드
            searchVO.setsRefDocNo(purcRqstVO.getRefDocNo());                    //참조문서번호
            searchVO.setsStrgeCd(purcRqstVO.getStrgeCd());                      //창고번호
            searchVO.setsItemCd(purcRqstVO.getItemCd());                        //부품번호

            //가용 재고조회.
            StockInOutVO stockInOutVO = stockInOutService.selectStockInOutByKey(LoginUtil.getDlrCd(), LoginUtil.getPltCd(), issueReqDetailVO.getReqStrgeCd(), issueReqDetailVO.getItemCd());
            /*StockInOutVO stockInOutVO = new StockInOutVO();
            StockInOutSearchVO stockInOutSearchVO = new StockInOutSearchVO();
            stockInOutSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            stockInOutSearchVO.setsStrgeCd(issueReqDetailVO.getReqStrgeCd());
            stockInOutSearchVO.setsItemCd(issueReqDetailVO.getItemCd());
            List<StockInOutVO> stockInOutVOList = stockInOutService.selectStockInOutItemsByCondition(stockInOutSearchVO);

            if(stockInOutVOList.size() > 0){
                stockInOutVO = stockInOutVOList.get(0);
            }
*/
            if(purcRqstDAO.selectPurcRqstesByConditionCnt(searchVO) > 0){

                //부품재고가 없거나  없을 시에만 구매요청 진행.
                if(stockInOutVO != null){
                    if(stockInOutVO.getAvlbStockQty() < issueReqDetailVO.getEndQty() || stockInOutVO.getAvlbStockQty() <= 0){

                        PurcRqstVO purcRqstDbVO = purcRqstDAO.selectPurcRqstByKey(LoginUtil.getDlrCd(), null, purcRqstVO.getRefDocNo(), purcRqstVO.getStrgeCd(), purcRqstVO.getItemCd());
                        purcRqstVO.setPurcReqNo(purcRqstDbVO.getPurcReqNo());
                        purcRqstVO.setPurcReqLineNo(purcRqstDbVO.getPurcReqLineNo());

                        purcRqstDAO.updateIssueReqDetailPurcRqst(purcRqstVO); // 수정

                        //입출고예정정보 처리.
                        GrGiScheduleVO purcOrdGrGiScheduleVO = new GrGiScheduleVO();
                        purcOrdGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                        purcOrdGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                        purcOrdGrGiScheduleVO.setStrgeCd(issueReqDetailVO.getReqStrgeCd());
                        purcOrdGrGiScheduleVO.setItemCd(issueReqDetailVO.getItemCd());
                        purcOrdGrGiScheduleVO.setGrGiDocNo(issueReqDetailVO.getParReqDocNo());
                        purcOrdGrGiScheduleVO.setGrGiDocLineNo(issueReqDetailVO.getParReqDocLineNo());
                        purcOrdGrGiScheduleVO.setGrGiTp("R");
                        purcOrdGrGiScheduleVO.setProcQty(issueReqDetailVO.getResvQty());
                        purcOrdGrGiScheduleVO.setGrGiQty(issueReqDetailVO.getResvQty());
                        VenderMasterVO bhmcVenderVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());
                        purcOrdGrGiScheduleVO.setBpCd(bhmcVenderVO.getBpCd());
                        purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                        grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);
                    }
                }
            }
            else{
                //부품재고가 없거나  없을 시에만 구매요청 진행.
                if(stockInOutVO != null){
                    if(stockInOutVO.getAvlbStockQty() < issueReqDetailVO.getEndQty() || stockInOutVO.getAvlbStockQty() <= 0){

                        synchronized (purcReqNoIdgenService) {
                            //구매요청 키 가져오기.
                            PurcReqNoIdGenStrategy purcReqNoIdGenStrategy = (PurcReqNoIdGenStrategy)purcReqNoIdgenService.getStrategy();
                            purcReqNoIdGenStrategy.setPrefix("PR");

                            String purcReqNo = purcReqNoIdgenService.getNextStringId();

                            purcRqstVO.setPurcReqNo(purcReqNo); // 구매요청번호
                            purcRqstVO.setPurcReqLineNo(1);     // 구매요청라인번호
                        }

                        purcRqstDAO.insertPurcRqst(purcRqstVO);//추가

                        //입출고예정정보 처리.
                        GrGiScheduleVO purcOrdGrGiScheduleVO = new GrGiScheduleVO();
                        purcOrdGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                        purcOrdGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                        purcOrdGrGiScheduleVO.setStrgeCd(issueReqDetailVO.getReqStrgeCd());
                        purcOrdGrGiScheduleVO.setItemCd(issueReqDetailVO.getItemCd());
                        purcOrdGrGiScheduleVO.setGrGiDocNo(issueReqDetailVO.getParReqDocNo());
                        purcOrdGrGiScheduleVO.setGrGiDocLineNo(issueReqDetailVO.getParReqDocLineNo());
                        purcOrdGrGiScheduleVO.setGrGiTp("R");
                        purcOrdGrGiScheduleVO.setProcQty(issueReqDetailVO.getResvQty());
                        purcOrdGrGiScheduleVO.setGrGiQty(issueReqDetailVO.getResvQty());
                        VenderMasterVO bhmcVenderVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());
                        purcOrdGrGiScheduleVO.setBpCd(bhmcVenderVO.getBpCd());
                        purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                        grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);
                    }
                }
            }

        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcRqstService#selectPurcRqstByKey(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public PurcRqstVO selectPurcRqstByKey(String dlrCd, String purcReqNo, String refDocNo, String strgeCd, String itemCd)
            throws Exception {
        return purcRqstDAO.selectPurcRqstByKey(dlrCd, purcReqNo, refDocNo, strgeCd, itemCd);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcRqstService#selectPurcRqstesByCondition(chn.bhmc.dms.par.pcm.vo.PurcRqstSearchVO)
     */
    @Override
    public List<PurcRqstVO> selectPurcRqstesByCondition(PurcRqstSearchVO searchVO) throws Exception {
        return purcRqstDAO.selectPurcRqstesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcRqstService#selectPurcRqstesByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcRqstSearchVO)
     */
    @Override
    public int selectPurcRqstesByConditionCnt(PurcRqstSearchVO searchVO) throws Exception {
        return purcRqstDAO.selectPurcRqstesByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcRqstService#selectPurcRqstesPopByCondition(chn.bhmc.dms.par.pcm.vo.PurcRqstSearchVO)
     */
    @Override
    public List<PurcRqstVO> selectPurcReqsPopByCondition(PurcRqstSearchVO searchVO) throws Exception {
        return purcRqstDAO.selectPurcReqsPopByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcRqstService#selectPurcRqstesPopByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcRqstSearchVO)
     */
    @Override
    public int selectPurcReqsPopByConditionCnt(PurcRqstSearchVO searchVO) throws Exception {
        return purcRqstDAO.selectPurcReqsPopByConditionCnt(searchVO);
    }


    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcRqstService#updatePurcRqstCnfm(chn.bhmc.dms.par.pcm.vo.PurcRqstVO)
     */
    @Override
    public int updatePurcRqstCnfm(PurcRqstVO purcRqstVO) throws Exception {
        return purcRqstDAO.updatePurcRqstCnfm(purcRqstVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcRqstService#updatePurcRqstByReceiveCnfm(chn.bhmc.dms.par.pcm.vo.PurcRqstVO)
     */
    @Override
    public int updatePurcRqstByReceiveCnfm(PurcRqstSearchVO purcRqstSearchVO) throws Exception {

        return purcRqstDAO.updatePurcRqstByReceiveCnfm(purcRqstSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcRqstService#selectPurcReqItemsByConditionForSmsCnt(chn.bhmc.dms.par.pcm.vo.PurcRqstSearchVO)
     */
    @Override
    public int selectPurcReqItemsByConditionForSmsCnt(PurcRqstSearchVO searchVO) throws Exception {

        return purcRqstDAO.selectPurcReqItemsByConditionForSmsCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcRqstService#selectPurcReqItemsByConditionForSms(chn.bhmc.dms.par.pcm.vo.PurcRqstSearchVO)
     */
    @Override
    public List<PurcRqstVO> selectPurcReqUsersByConditionForSms(PurcRqstSearchVO searchVO) throws Exception {

        return purcRqstDAO.selectPurcReqUsersByConditionForSms(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcRqstService#updatePurcRqstCnfmByPurcOrd(java.util.List)
     */
    @Override
    public boolean updatePurcRqstCnfmByPurcOrd(List<PurcRqstVO> list) throws Exception {

        //[구매요청]입출고예정정보
        GrGiScheduleVO purcReqGrGiScheduleVO = new GrGiScheduleVO();

        for(int i = 0; i < list.size(); i++){
            purcReqGrGiScheduleVO = new GrGiScheduleVO();

            purcReqGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
            purcReqGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
            purcReqGrGiScheduleVO.setStrgeCd(list.get(i).getGrStrgeCd());
            purcReqGrGiScheduleVO.setItemCd(list.get(i).getItemCd());
            purcReqGrGiScheduleVO.setGrGiDocNo(list.get(i).getPurcReqNo());
            purcReqGrGiScheduleVO.setGrGiDocLineNo(list.get(i).getPurcReqLineNo());
            purcReqGrGiScheduleVO.setGrGiTp("R");
            purcReqGrGiScheduleVO.setProcQty(list.get(i).getPurcReqQty() * -1);
            purcReqGrGiScheduleVO.setGrGiQty(list.get(i).getPurcReqQty());
            purcReqGrGiScheduleVO.setBpCd(list.get(i).getBpCd());
            purcReqGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

            list.get(i).setRegUsrId(LoginUtil.getUserId());
            list.get(i).setDlrCd(LoginUtil.getDlrCd());
            list.get(i).setPurcReqStatCd("02");

            purcRqstDAO.updatePurcRqstCnfm(list.get(i));
            grGiScheduleService.createGrGiSchedule(purcReqGrGiScheduleVO);

        }

        return true;
    }


}
