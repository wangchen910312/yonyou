package chn.bhmc.dms.sal.prm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.prm.service.PromotionService;
import chn.bhmc.dms.sal.prm.service.dao.PromotionDAO;
import chn.bhmc.dms.sal.prm.vo.PromotionSaveVO;
import chn.bhmc.dms.sal.prm.vo.PromotionSearchVO;
import chn.bhmc.dms.sal.prm.vo.PromotionVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PromotionServieceImpl.java
 * @Description : 프로모션 관리
 * @author
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.     Kim yewon              최초 생성
 * </pre>
 */

@Service("promotionService")
public class PromotionServiceImpl extends HService implements PromotionService {

    /**
     * 차종 DAO 선언
     */
    @Resource(name="promotionDAO")
    PromotionDAO promotionDAO;



    /**
     * 조회 조건에 해당하는 프로모션 정보를 조회한다.
     */
    @Override
    public List<PromotionVO> selectPromotionByCondition(PromotionSearchVO searchVO) throws Exception {
        List<PromotionVO> list = promotionDAO.selectPromotionByCondition(searchVO);

        return list;
    }

    /**
     * 조회 조건에 해당하는 프로모션 총 갯수를 조회한다.
     */
    @Override
    public int selectPromotionByConditionCnt(PromotionSearchVO searchVO) throws Exception {
        int a = promotionDAO.selectPromotionByConditionCnt(searchVO);

        return a;
    }


    /**
     * 조회 조건에 해당하는 프로모션 대상 고객 정보를 조회한다.
     */
    @Override
    public List<PromotionVO> selectPromotionCustByCondition(PromotionSearchVO searchVO) throws Exception {
        List<PromotionVO> list = promotionDAO.selectPromotionCustByCondition(searchVO);

        return list;
    }


    /**
     * 조회 조건에 해당하는 대상차종 정보를 조회한다.
     */
    @Override
    public List<PromotionVO> selectPromotionTargetModelByCondition(PromotionSearchVO searchVO) throws Exception {
        List<PromotionVO> list = promotionDAO.selectPromotionTargetModelByCondition(searchVO);

        return list;
    }


    /**
     * 프로모션 승인요청.
     */
    @Override
    public boolean approvalReqPromotion(PromotionVO vo) throws Exception {
        return promotionDAO.approvalReqPromotion(vo);
    }


    /**
     * 프로모션 승인.
     */
    @Override
    public boolean promotionApproval(PromotionVO vo) throws Exception {
        return promotionDAO.promotionApproval(vo);
    }


    /**
     * 프로모션 삭제.
     */
    @Override
    public boolean deletePromotion(PromotionVO vo) throws Exception {
        return promotionDAO.deletePromotion(vo);
    }


    /**
     * 프로모션 수정.
     */
    @Override
    public void updateSavePromotion(PromotionSaveVO vo) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();


        // 프로모션 상세 정보
        if(vo.getPromotionVO().getApplyTp().equals("F")){
            vo.getPromotionVO().setPromotionAmt(vo.getPromotionVO().getPromotionAmt1());
        }else {
            vo.getPromotionVO().setPromotionAmt(vo.getPromotionVO().getPromotionAmt2());
        }


        if(vo.getPromotionVO().getPromotionCd() == null ){
            vo.getPromotionVO().setDlrCd(dlrCd);
            promotionDAO.insertPromotion(vo.getPromotionVO());
        }else {
            vo.getPromotionVO().setDlrCd(dlrCd);
            vo.getPromotionVO().setUpdtUsrId(userId);
            promotionDAO.updatePromotion(vo.getPromotionVO());


            String contractTpArrayList = vo.getContractTp();
            vo.setPromotionCd(vo.getPromotionVO().getPromotionCd());
            vo.setDlrCd(vo.getPromotionVO().getDlrCd());
            if(!contractTpArrayList.equals("")){
                String [] contractTpItem = contractTpArrayList.split(",");
                if (contractTpItem.length > 0) {
                    promotionDAO.deleteContractTp(vo);
                    for(int i = 0 ; i < contractTpItem.length ; i++){
                        vo.setContractTp(contractTpItem[i]);
                        vo.setRegUsrId(userId);
                        promotionDAO.createContractTp(vo);
                    }
                }
            }
        }

        updateSavePromotion(vo.getCustVO(),vo.getPromotionVO(),"C");
        updateSavePromotion(vo.getModelVO(),vo.getPromotionVO(),"M");

        PromotionSearchVO modelSearchVO = new PromotionSearchVO();
        modelSearchVO.setsDlrCd(dlrCd);
        modelSearchVO.setsPromotionCd(vo.getPromotionVO().getPromotionCd());
        if(promotionDAO.selectPromotionTargetModelByConditionCnt(modelSearchVO) < 1){
            // {차관}는 1개 이상 되어야 합니다.
            throw processException("global.info.isUpChk", new String[]{messageSource.getMessage("global.lbl.model", null, LocaleContextHolder.getLocale()), "1"});
        }
    }


    /**
     * 프로모션 등록.
     */
    @Override
    public void insertSavePromotion(PromotionSaveVO vo) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();


        // 프로모션 상세 정보
        if(vo.getPromotionVO().getApplyTp().equals("F")){
            vo.getPromotionVO().setPromotionAmt(vo.getPromotionVO().getPromotionAmt1());
        }else {
            vo.getPromotionVO().setPromotionAmt(vo.getPromotionVO().getPromotionAmt2());
        }

        vo.getPromotionVO().setDlrCd(dlrCd);
        vo.getPromotionVO().setRegUsrId(userId);
        promotionDAO.insertPromotion(vo.getPromotionVO());

        String promotionCd = promotionDAO.selectPromotionCd(vo.getPromotionVO().getDlrCd());


        String contractTpArrayList = vo.getContractTp();
        vo.setPromotionCd(promotionCd);
        vo.setDlrCd(vo.getPromotionVO().getDlrCd());
        if(!contractTpArrayList.equals("")){
            String [] contractTpItem = contractTpArrayList.split(",");
            if (contractTpItem.length > 0) {
                promotionDAO.deleteContractTp(vo);
                for(int i = 0 ; i < contractTpItem.length ; i++){
                    vo.setContractTp(contractTpItem[i]);
                    vo.setRegUsrId(userId);
                    promotionDAO.createContractTp(vo);
                }
            }
        }

        //대상고객
        vo.getPromotionVO().setPromotionCd(promotionCd);
        updateSavePromotion(vo.getCustVO(),vo.getPromotionVO(),"C");
        //대상모델
        updateSavePromotion(vo.getModelVO(),vo.getPromotionVO(),"M");

        PromotionSearchVO modelSearchVO = new PromotionSearchVO();
        modelSearchVO.setsDlrCd(dlrCd);
        modelSearchVO.setsPromotionCd(promotionCd);
        if(promotionDAO.selectPromotionTargetModelByConditionCnt(modelSearchVO) < 1){
            // {차관}는 1개 이상 되어야 합니다.
            throw processException("global.info.isUpChk", new String[]{messageSource.getMessage("global.lbl.model", null, LocaleContextHolder.getLocale()), "1"});
        }
    }


    public void updateSavePromotion(BaseSaveVO<PromotionVO> obj,PromotionVO promotionVO,String gb) throws Exception {

        String userId = LoginUtil.getUserId();

        if(gb.equals("C")){

            for(PromotionVO vo : obj.getDeleteList()){
                vo.setDlrCd(promotionVO.getDlrCd());
                vo.setPromotionCd(promotionVO.getPromotionCd());
                promotionDAO.deleteCust(vo);
            }

            for(PromotionVO vo : obj.getInsertList()){
                vo.setDlrCd(promotionVO.getDlrCd());
                vo.setPromotionCd(promotionVO.getPromotionCd());
                vo.setRegUsrId(userId);
                promotionDAO.insertCust(vo);
            }


        }else if(gb.equals("M")){

            for(PromotionVO vo : obj.getDeleteList()){
                vo.setDlrCd(promotionVO.getDlrCd());
                vo.setPromotionCd(promotionVO.getPromotionCd());
                promotionDAO.deleteModel(vo);
            }

            for(PromotionVO vo : obj.getInsertList()){
                vo.setDlrCd(promotionVO.getDlrCd());
                vo.setPromotionCd(promotionVO.getPromotionCd());
                vo.setRegUsrId(userId);

                //PromotionSearchVO modelSearchVO = new PromotionSearchVO();
                //modelSearchVO.setsDlrCd(promotionVO.getDlrCd());
                //modelSearchVO.setsPromotionCd(promotionVO.getPromotionCd());
                //modelSearchVO.setsModelCd(vo.getModelCd());
                //if(promotionDAO.selectPromotionTargetModelByConditionCnt(modelSearchVO) < 1){
                    promotionDAO.insertModel(vo);
                //}
            }

        }

    }


    /**
     * {@inheritDoc}
     */
    @Override
    public PromotionVO selectPromotionCustByKey(String dlrCd, String promotionCd, String custCd) throws Exception {
        return promotionDAO.selectPromotionCustByKey(dlrCd, promotionCd, custCd);
    }


    @Override
    public void insertPromotionCustUpload(List<PromotionVO> list, String dlrCd, String promotionCd) throws Exception {

        String userId = LoginUtil.getUserId();

        for(PromotionVO promotionVO : list){
            promotionVO.setRegUsrId(userId);

            PromotionVO obj = selectPromotionCustByKey(dlrCd, promotionCd, promotionVO.getCustCd());
            promotionVO.setPromotionCd(promotionCd);
            promotionVO.setDlrCd(dlrCd);
            if(obj == null) {
                insertPromotionCust(promotionVO);
            }
        }
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int insertPromotionCust(PromotionVO promotionVO) throws Exception {

        PromotionVO obj = selectPromotionCustByKey(promotionVO.getDlrCd(), promotionVO.getPromotionCd(), promotionVO.getCustCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }


        return promotionDAO.insertPromotionCust(promotionVO);
    }


}
