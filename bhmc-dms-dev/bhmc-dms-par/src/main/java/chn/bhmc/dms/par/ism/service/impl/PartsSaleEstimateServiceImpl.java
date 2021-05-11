package chn.bhmc.dms.par.ism.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.PartsSaleEstimateService;
import chn.bhmc.dms.par.ism.service.dao.PartsSaleEstimateDAO;
import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateItemVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateSearchVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 부품판매견적 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 2. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 23.     Ju Won Lee      최초 생성
 * </pre>
 */
@Service("partsSaleEstimateService")
public class PartsSaleEstimateServiceImpl extends HService implements PartsSaleEstimateService {

    @Resource(name="partsSaleEstimateDAO")
    private PartsSaleEstimateDAO partsSaleEstimateDAO;

    @Resource(name="estimateDocNoIdgenService")
    EgovIdGnrService estimateDocNoIdgenService;


    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleEstimateService#createPartsSaleEstimate(java.util.List, chn.bhmc.dms.par.ism.vo.PartsSaleEstimateVO)
     */
    @Override
    public PartsSaleEstimateVO createPartsSaleEstimate(List<PartsSaleEstimateItemVO> list, PartsSaleEstimateVO partsSaleEstimateVO)
            throws Exception {

        try{
            int    estimateDocLineNo = 1;
            int    resultCnt       = 0;


            //구매제시정보

            // 1. 부품판매오더 번호를 생성한다.
            String partsSaleEstimateNo =  selectNextEstimateDocNo();
            partsSaleEstimateVO.setEstimateDocNo(partsSaleEstimateNo);

            // 2. 부품판매 상태를 설정한다.
            partsSaleEstimateVO.setStatCd("01"); //"01" 등록상태.
            partsSaleEstimateVO.setDlrCd(LoginUtil.getDlrCd());
            partsSaleEstimateVO.setRegUsrId(LoginUtil.getUserId());

            if( (partsSaleEstimateVO.getCustTp() == null) || (partsSaleEstimateVO.getCustTp().isEmpty())){
                //고객유형정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.custTp", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleEstimateVO.getSaleTp() == null) || (partsSaleEstimateVO.getSaleTp().isEmpty())){
                //판매유형정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.saleType", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleEstimateVO.getCustNm() == null) || (partsSaleEstimateVO.getCustNm().isEmpty())){
                //고객정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.custNm", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleEstimateVO.getSalePrsnId() == null) || (partsSaleEstimateVO.getSalePrsnId().isEmpty())){
                //담당자정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.prsNm", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleEstimateVO.getDcBefTotAmt() == null) || (partsSaleEstimateVO.getDcBefTotAmt() < 0)){
                //할인전 총액이 0보다 작거나 같을 수 없습니다.
                throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.totAmtBefDc", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleEstimateVO.getDcAmt() == null) || (partsSaleEstimateVO.getDcAmt() < 0)){
                //할인금액이 0보다 작을 수 없습니다.
                throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("sal.lbl.dcAmt", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleEstimateVO.getTotAmt() == null) || (partsSaleEstimateVO.getTotAmt() < 0)){
                //총금액이 0보다 작을 수 없습니다.
                throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("par.lbl.totAmt", null, LocaleContextHolder.getLocale())});
            }


            // 3. 부품판매 헤더를 생성한다.
            resultCnt = partsSaleEstimateDAO.insertPartsSaleEstimate(partsSaleEstimateVO);

            if(resultCnt < 1){
                //부품판매 생성 실패.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.estimateDocNo", null, LocaleContextHolder.getLocale())});
            }

            // 4. 부품판매 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){

                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setEstimateDocNo(partsSaleEstimateNo);
                list.get(i).setEstimateDocLineNo(estimateDocLineNo);
                list.get(i).setItemStatCd("01");

                if(list.get(i).getEstimateQty() == null || list.get(i).getEstimateQty() <= 0){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(list.get(i).getPrc() == null || list.get(i).getPrc() < 0){
                  //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }

                /*  부품 상태 아직 사용안함(정의안됨)
                if( (list.get(i).getItemStatCd() == null) || (list.get(i).getItemStatCd().isEmpty())){
                    //부품상태정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemStatCd", null, LocaleContextHolder.getLocale())});
                }*/

                if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                    //부품정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getGiStrgeCd() == null) || (list.get(i).getGiStrgeCd().isEmpty())){
                    //출고창고정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale())});
                }

                /*
                if( (list.get(i).getGiLocCd() == null) || (list.get(i).getGiLocCd().isEmpty())){
                    //출고로케이션정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.locationCd", null, LocaleContextHolder.getLocale())});
                }
                */

                if( list.get(i).getDcRate() < 0 ){
                    //할인율 0보다 작을 수 없습니다.
                    throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("par.lbl.dcRate", null, LocaleContextHolder.getLocale())});
                }



                resultCnt = partsSaleEstimateDAO.insertPartsSaleEstimateItem(list.get(i));


                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }

                estimateDocLineNo = estimateDocLineNo + 1;
            }


            return partsSaleEstimateVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleEstimateService#multiPartsSaleEstimate(chn.bhmc.dms.core.datatype.BaseSaveVO, chn.bhmc.dms.par.ism.vo.PartsSaleEstimateVO)
     */
    @Override
    public void multiPartsSaleEstimates(BaseSaveVO<PartsSaleEstimateItemVO> obj, PartsSaleEstimateVO partsSaleEstimateVO)
            throws Exception {


        try{
            int    resultCnt       = 0;
            int    estimateDocLineNo   = 1;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            estimateDocLineNo = partsSaleEstimateDAO.selectPartsSaleEstimateMaxLineNo(partsSaleEstimateVO);

            partsSaleEstimateVO.setDlrCd(LoginUtil.getDlrCd());
            partsSaleEstimateVO.setRegUsrId(LoginUtil.getUserId());
            partsSaleEstimateVO.setStatCd("01");

            chkPartsSaleEstimateUpdateSomebody(partsSaleEstimateVO);

            for(PartsSaleEstimateItemVO itemVO : obj.getInsertList()){
                if(itemVO.getEstimateQty() <= 0){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(itemVO.getPrc() < 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }

                if(itemVO.getAmt() < 0){
                    //금액 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.amt", null, LocaleContextHolder.getLocale())});
                }



                itemVO.setEstimateDocNo(partsSaleEstimateVO.getEstimateDocNo());
                itemVO.setEstimateDocLineNo(estimateDocLineNo);
                itemVO.setItemStatCd("01"); //"01" 등록상태
                itemVO.setRegUsrId(userId);
                itemVO.setDlrCd(dlrCd);


                resultCnt = partsSaleEstimateDAO.insertPartsSaleEstimateItem(itemVO);


                if(resultCnt < 1){
                    //부품 생성 실패.[itemVO.getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{itemVO.getItemCd()});
                }

                estimateDocLineNo = estimateDocLineNo + 1;
            }

            for(PartsSaleEstimateItemVO itemVO : obj.getUpdateList()){

                if(itemVO.getEstimateQty() <= 0){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(itemVO.getPrc() < 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }

                if(itemVO.getAmt() < 0){
                    //금액 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.amt", null, LocaleContextHolder.getLocale())});
                }

                itemVO.setDlrCd(dlrCd);
                itemVO.setUpdtUsrId(userId);

                resultCnt = partsSaleEstimateDAO.updatePartsSaleEstimateItem(itemVO);


                if(resultCnt < 1){
                    //부품 수정 실패
                    throw processException(" global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                }
            }

            for(PartsSaleEstimateItemVO itemVO : obj.getDeleteList()){
                itemVO.setUpdtUsrId(userId);
                itemVO.setDlrCd(dlrCd);


                resultCnt = partsSaleEstimateDAO.deletePartsSaleEstimateItem(itemVO);


                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{itemVO.getItemCd()});

                }
            }

            // 부품판매 헤더를 수정한다.
            resultCnt = partsSaleEstimateDAO.updatePartsSaleEstimate(partsSaleEstimateVO);

            if(resultCnt < 1){
                //부품판매 생성 실패.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.estimateDocNo", null, LocaleContextHolder.getLocale())});
            }





        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }


    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleEstimateService#selectPartsSaleEstimateByKey(chn.bhmc.dms.par.ism.vo.PartsSaleEstimateSearchVO)
     */
    @Override
    public PartsSaleEstimateVO selectPartsSaleEstimateByKey(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO) throws Exception {

        return partsSaleEstimateDAO.selectPartsSaleEstimateByKey(partsSaleEstimateSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleEstimateService#selectPartsSaleEstimateItemByKey(chn.bhmc.dms.par.ism.vo.PartsSaleEstimateSearchVO)
     */
    @Override
    public List<PartsSaleEstimateItemVO> selectPartsSaleEstimateItemByKey(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO)
            throws Exception {

        return partsSaleEstimateDAO.selectPartsSaleEstimateItemByKey(partsSaleEstimateSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleEstimateService#cancelPartsSaleEstimate(chn.bhmc.dms.par.ism.vo.PartsSaleEstimateVO)
     */
    @Override
    public int cancelPartsSaleEstimate(PartsSaleEstimateVO partsSaleEstimateVO) throws Exception {

        int    resultCnt       = 0;

        // 1. 부품판매 상태를 설정한다.
        partsSaleEstimateVO.setStatCd("03"); //"03" 취소상태.
        partsSaleEstimateVO.setDlrCd(LoginUtil.getDlrCd());
        partsSaleEstimateVO.setRegUsrId(LoginUtil.getUserId());

        chkPartsSaleEstimateUpdateSomebody(partsSaleEstimateVO);

        resultCnt = partsSaleEstimateDAO.modifyPartsSaleEstimateStat(partsSaleEstimateVO);

        if(resultCnt < 1){
            //부품판매 삭제 실패.
            throw processException("global.err.delFailedParam", new String[]{messageSource.getMessage("par.lbl.estimateDocNo", null, LocaleContextHolder.getLocale())});
        }

        return resultCnt;
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleEstimateService#selectPartsSaleEstimateList(chn.bhmc.dms.par.ism.vo.PartsSaleEstimateSearchVO)
     */
    @Override
    public List<PartsSaleEstimateVO> selectPartsSaleEstimateList(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO) throws Exception {

        return partsSaleEstimateDAO.selectPartsSaleEstimateList(partsSaleEstimateSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleEstimateService#selectPartsSaleEstimateListCnt(chn.bhmc.dms.par.ism.vo.PartsSaleEstimateSearchVO)
     */
    @Override
    public int selectPartsSaleEstimateListCnt(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO) throws Exception {

        return partsSaleEstimateDAO.selectPartsSaleEstimateListCnt(partsSaleEstimateSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleEstimateService#selectPartsSaleEstimateItemList(chn.bhmc.dms.par.ism.vo.PartsSaleEstimateSearchVO)
     */
    @Override
    public List<PartsSaleEstimateItemVO> selectPartsSaleEstimateItemList(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO) throws Exception {

        return partsSaleEstimateDAO.selectPartsSaleEstimateItemList(partsSaleEstimateSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleEstimateService#selectPartsSaleEstimateItemListCnt(chn.bhmc.dms.par.ism.vo.PartsSaleEstimateSearchVO)
     */
    @Override
    public int selectPartsSaleEstimateItemListCnt(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO) throws Exception {

        return partsSaleEstimateDAO.selectPartsSaleEstimateItemListCnt(partsSaleEstimateSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleEstimateService#selectEstimatesByCondition(chn.bhmc.dms.par.ism.vo.PartsSaleEstimateSearchVO)
     */
    @Override
    public List<PartsSaleEstimateVO> selectEstimatesByCondition(PartsSaleEstimateSearchVO searchVO) throws Exception {

        return partsSaleEstimateDAO.selectEstimatesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleEstimateService#selectEstimatesByConditionCnt(chn.bhmc.dms.par.ism.vo.PartsSaleEstimateSearchVO)
     */
    @Override
    public int selectEstimatesByConditionCnt(PartsSaleEstimateSearchVO searchVO) throws Exception {

        return partsSaleEstimateDAO.selectEstimatesByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectNextEstimateDocNo()
     */
    @Override
    public String selectNextEstimateDocNo() throws Exception {
        try {
            return estimateDocNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.estimateDocNo", null, LocaleContextHolder.getLocale())});
        }
    }

    public void chkPartsSaleEstimateUpdateSomebody(PartsSaleEstimateVO partsSaleEstimateVO) throws Exception {

        String updtDtStrNow;
        String[] lblList = new String[3];

        try {
            updtDtStrNow = partsSaleEstimateDAO.selectPartsSaleEstimateUpdtDtByKey(partsSaleEstimateVO);

            if(!updtDtStrNow.equals(partsSaleEstimateVO.getUpdtDtStr())){
                lblList[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                lblList[1] = messageSource.getMessage("par.lbl.estimateDocNo", null, LocaleContextHolder.getLocale());
                lblList[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                throw processException("global.info.reTryInfo", lblList);
            }

        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.estimateDocNo", null, LocaleContextHolder.getLocale())});
        }
    }
}
