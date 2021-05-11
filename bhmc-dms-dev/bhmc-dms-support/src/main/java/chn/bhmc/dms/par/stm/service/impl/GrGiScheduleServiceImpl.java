package chn.bhmc.dms.par.stm.service.impl;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.stm.service.GrGiScheduleService;
import chn.bhmc.dms.par.stm.service.dao.GrGiScheduleDAO;
import chn.bhmc.dms.par.stm.service.dao.StockInOutDAO;
import chn.bhmc.dms.par.stm.vo.GrGiScheduleVO;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;



/**
 * 입출고 예정정보 구현 클래스
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
@Service("grGiScheduleService")
public class GrGiScheduleServiceImpl extends HService implements GrGiScheduleService {

    @Resource(name="grGiScheduleDAO")
    private GrGiScheduleDAO grGiScheduleDAO;

    @Resource(name="stockInOutDAO")
    private StockInOutDAO stockInOutDAO;

    /*
     * @see chn.bhmc.dms.par.stm.service.GrGiScheduleService#createGrGiSchedule(java.util.List)\
     *
     * [GrGiScheduleVO]
     * DLR_CD            : 딜러코드(세션정보)
     * PLT_CD            : 센터코드(세션정보)
     * STRGE_CD          : 창고코드
     * ITEM_CD           : 부품번호
     * GR_GI_DOC_NO      : 호출하는 업무의 업무 번호(예: 구매오더 시 구매오더 번호, R/O발행 시 R/O번호)
     * GR_GI_DOC_LINE_NO : 위 업무번호의 라인번호
     * SEQ               : 해당 함수에서 생성 함(Empty 데이터 보내면 됨)
     * GR_GI_TP          : 업무 유형에 따라 입고 예정정보일 경우("R"), 출고 예정 정보일 경우("I")  *취소도 마찬가지임
     *                     {입고예정정보발생}: 구매요청, 구매오더, Invoice생성
     *                     {출고예정정보발생}: 예약, 서비스RO, S/O(완성차) 등
     * PROC_QTY          : 처리 수량(구매오더~INVOICE를 제외하고 모두 '0' 혹은 GR_GI_QTY와 같음)
     *                     최초 생성 시에는 '0' 다음 프로세스 진행 시 '+' 수량 진행 취소 시 '-'수량
     * GR_GI_QTY         : 업무 발생 최초 수량(변경안됨)
     *                     변경발생 사유는 오직 관리화면에서 기존 등록 수량을 변경할 경우에만 발생
     * GR_GI_SCHE_DT     : 입력안함. 생성 시 오늘 날자로 셋팅함.
     * BP_CD or CUST_CD  : 거래처 혹은 공급처 있는 경우 입력. 없어도 됨. null허용
     *
     * 수정내용: 현업이 입출고 발생 전 예정수량은 재고에 반영 안되야한다고 요청함.(17년 5월 25일)
     * 하여. 재고가 없는 입출고 예정건은 빈재고정보를 생성하지도 않고 업데이트하지도 않음!.
     */
    @Override
    public int createGrGiSchedule(GrGiScheduleVO grGiScheduleVO) throws Exception {
        try{
            int    seqNo       = 1;
            int    resultCnt   = 0;
       //     int    insertCnt   = 0;
            StockInOutVO stockInOutVO       = new StockInOutVO(); //현재고 정보 조회 데이터를 담기 위해 사용되는 변수
       //     StockInOutVO stockInOutInsertVO = new StockInOutVO(); //현재고 정보가 없는 경우 기본값 Insert하기 위해 사용되는 변수

            /*********************************************
            // * 입출고 예정정보 Validation 체크
            / *********************************************/
            if( (grGiScheduleVO.getDlrCd() == null) || (grGiScheduleVO.getDlrCd().isEmpty())){
                //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if( (grGiScheduleVO.getPltCd() == null) || (grGiScheduleVO.getPltCd().isEmpty())){
                //센터정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            if( (grGiScheduleVO.getStrgeCd() == null) || (grGiScheduleVO.getStrgeCd().isEmpty())){
                //창고 정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.strgeCd", null, LocaleContextHolder.getLocale())});
            }

            if( (grGiScheduleVO.getItemCd() == null) || (grGiScheduleVO.getItemCd().isEmpty())){
                //품목정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
            }

            if( (grGiScheduleVO.getGrGiDocNo() == null) || (grGiScheduleVO.getGrGiDocNo().isEmpty())){
                //입출고 문서정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.grGiDocNo", null, LocaleContextHolder.getLocale())});
            }

            if(grGiScheduleVO.getGrGiDocLineNo() < 1){
                //입출고 문서정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.grGiDocNo", null, LocaleContextHolder.getLocale())});
            }

            if( (grGiScheduleVO.getGrGiTp() == null) || (grGiScheduleVO.getGrGiTp().isEmpty())){
                //입출고 유형정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.grGiTp", null, LocaleContextHolder.getLocale())});
            }

            if(grGiScheduleVO.getGrGiQty() <= 0){
                //입출고수량정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.grGiQty", null, LocaleContextHolder.getLocale())});
            }

            if(grGiScheduleVO.getProcQty() == 0 || grGiScheduleVO.getProcQty().isNaN()){
                //처리수량정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.procQty", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
            // * 입출고 예정정보 Validation 체크 종료
            /*********************************************/

            /*********************************************
            // * 입출고 예정정보 Next SEQ 셋팅
            /*********************************************/

            // 입출고 예정정보 Next SEQ 번호를 가져온다.
            seqNo =  grGiScheduleDAO.selectGrGiDocMaxLineNo(grGiScheduleVO);

            // Next SEQ 번호를 셋팅한다.
            grGiScheduleVO.setSeq(seqNo);

            /*********************************************
            // * 입출고 예정정보 Next SEQ 셋팅 종료
            /*********************************************/

            /*********************************************
            // * 입출고 예정정보 생성
            /*********************************************/
            resultCnt = grGiScheduleDAO.insertGrGiSchedule(grGiScheduleVO);

            if(resultCnt < 1){
                throw processException("global.info.failedMsg", new String[]{messageSource.getMessage("par.lbl.create", null, LocaleContextHolder.getLocale())});
            }
            /*********************************************
            // * 입출고 예정정보 생성 종료
            /*********************************************/

            /*********************************************
            // * 입출고 예정정보 생성에 따른 재고 정보 수정
            /*********************************************/

            //입출고 예정정보를 통해 수정할 재고 정보를 조회한다.
            stockInOutVO  = stockInOutDAO.selectStockInOutByKey(grGiScheduleVO.getDlrCd(), grGiScheduleVO.getPltCd(), grGiScheduleVO.getStrgeCd(), grGiScheduleVO.getItemCd());

            //존재하는 재고정보인 경우
            if(stockInOutVO != null){
            //현재고 정보가 존재하지 않을 경우[기초재고 정보가 0인 신규 재고 정보를 생성한다.]
                //입출고 유형에 따라 재고 정보를 수정한다.
                if(grGiScheduleVO.getGrGiTp().equals("R")){
                    resultCnt = stockInOutDAO.updateStockInOutByGrSchedule(grGiScheduleVO);

                }else if(grGiScheduleVO.getGrGiTp().equals("I")){
                    resultCnt = stockInOutDAO.updateStockInOutByGiSchedule(grGiScheduleVO);

                }else{
                    //return 0; //입출고 유형정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.grGiTp", null, LocaleContextHolder.getLocale())});
                }

                if(resultCnt < 1){
                    throw processException("global.info.failedMsg", new String[]{messageSource.getMessage("par.lbl.create", null, LocaleContextHolder.getLocale())});
                }
            }else{
                /*
                stockInOutInsertVO.setDlrCd(grGiScheduleVO.getDlrCd());
                stockInOutInsertVO.setPltCd(grGiScheduleVO.getPltCd());
                stockInOutInsertVO.setStrgeCd(grGiScheduleVO.getStrgeCd());
                stockInOutInsertVO.setItemCd(grGiScheduleVO.getItemCd());
                stockInOutInsertVO.setAvlbStockQty(0);
                stockInOutInsertVO.setClamStockQty(0);
                stockInOutInsertVO.setGiScheQty(0);
                stockInOutInsertVO.setGrScheQty(0);
                stockInOutInsertVO.setResvStockQty(0);
                stockInOutInsertVO.setRegUsrId(LoginUtil.getUserId());

                insertCnt = stockInOutDAO.insertStockInOut(stockInOutInsertVO);

                //등록된 건이 없거나 생각보다 많이 등록된 경우
                if(insertCnt != 1 ){
                   //return 0; //현재고의 정보가 제대로 등록되지 않았습니다.
                   throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.currStock", null, LocaleContextHolder.getLocale())});
                }

                stockInOutVO = stockInOutInsertVO;
                 */

                resultCnt = 1;
            }


            /*********************************************
            // * 입출고 예정정보 생성에 따른 재고 정보 수정 종료
            /*********************************************/


            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.GrGiScheduleService#selectGrGiDocOrgQty(chn.bhmc.dms.par.stm.vo.GrGiScheduleVO)
     */
    @Override
    public double selectGrGiDocOrgQty(GrGiScheduleVO grGiScheduleVO) throws Exception {

        return grGiScheduleDAO.selectGrGiDocOrgQty(grGiScheduleVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.GrGiScheduleService#selectBefGrGiDocInfo(chn.bhmc.dms.par.stm.vo.GrGiScheduleVO)
     */
    @Override
    public GrGiScheduleVO selectBefGrGiDocInfo(GrGiScheduleVO grGiScheduleVO) throws Exception {

        return grGiScheduleDAO.selectBefGrGiDocInfo(grGiScheduleVO);
    }

}
