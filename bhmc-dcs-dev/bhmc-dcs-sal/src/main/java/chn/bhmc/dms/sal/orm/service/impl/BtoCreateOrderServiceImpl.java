package chn.bhmc.dms.sal.orm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.ctl.service.DeadlineCtrlMngService;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSearchVO;
import chn.bhmc.dms.sal.orm.service.BtoCreateOrderService;
import chn.bhmc.dms.sal.orm.service.dao.BtoCreateOrderDAO;
import chn.bhmc.dms.sal.orm.vo.BtoCarInfoSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoCarInfoVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderAmtPopupVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderEtcVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSaveVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderVO;

/**
 * @ClassName   : BtoCreateOrderServiceImpl
 * @Description : BTO 주문생성
 * @author Bong
 * @since 2016. 2. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.16           Bong                 최초 생성
 * </pre>
 */

@Service("btoCreateOrderService")
public class BtoCreateOrderServiceImpl extends HService implements BtoCreateOrderService {

    /**
     * BTO주문생성 DAO 선언
     */
    @Resource(name="btoCreateOrderDAO")
    BtoCreateOrderDAO btoCreateOrderDAO;

    /**
     * 마감시간 체크
     */
    @Resource(name="deadlineCtrlMngService")
    DeadlineCtrlMngService deadlineCtrlMngService;

    /**
     * 주차 및 메모 정보를 조회한다.
     */
    @Override
    public List<BtoCreateOrderEtcVO> selectWeekRemark(BtoCreateOrderSearchVO searchVO) throws Exception {
        return btoCreateOrderDAO.selectWeekRemark(searchVO);
    };
    /**
     * 납기예시일를 조회한다.
     */
    @Override
    public List<BtoCreateOrderEtcVO> selectPfpExamDt(BtoCreateOrderSearchVO searchVO) throws Exception {
        return btoCreateOrderDAO.selectPfpExamDt(searchVO);
    };
    /**
     * 참고수량  정보를 조회한다.
     */
    @Override
    public List<BtoCreateOrderEtcVO> selectRefOrdQty(BtoCreateOrderSearchVO searchVO) throws Exception {
        searchVO.setsDeptCd(LoginUtil.getDlrCd());
        return btoCreateOrderDAO.selectRefOrdQty(searchVO);
    };
    /**
     * 오더등급  정보를 조회한다.
     */
    @Override
    public List<BtoCreateOrderEtcVO> selectOrdGradeCd(BtoCreateOrderSearchVO searchVO) throws Exception {
        return btoCreateOrderDAO.selectOrdGradeCd(searchVO);
    };


    /**
     * 전략오더를 제외한 모든 오더 OCN 갯수조회
     */
    @Override
    public int selectBtoOcnListsByConditionCnt(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectBtoOcnListsByConditionCnt(searchVO);
    }

    /**
     * 전략오더를 제외한 모든 오더 OCN조회 (블락적용)
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<BtoCarInfoVO> selectBtoOcnListsByCondition(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectBtoOcnListsByCondition(searchVO);
    }

    /**
     * 전략오더 OCN 갯수조회
     */
    @Override
    public int selectStrOcnListsByConditionCnt(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectStrOcnListsByConditionCnt(searchVO);
    }

    /**
     * 전략오더 OCN 조회 (블락적용)
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<BtoCarInfoVO> selectStrOcnListsByCondition(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectStrOcnListsByCondition(searchVO);
    }

    /**
     * 블락 적용된 외장색 갯수조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public int selectBtoExtColorListsByConditionCnt(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectBtoExtColorListsByConditionCnt(searchVO);
    }

    /**
     * 블락 적용된 외장색 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<BtoCarInfoVO> selectBtoExtColorListsByCondition(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectBtoExtColorListsByCondition(searchVO);
    }

    /**
     * 블락 적용된 내장색 갯수조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public int selectBtoIntColorListsByConditionCnt(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectBtoIntColorListsByConditionCnt(searchVO);
    }

    /**
     * 블락 적용된 내장색 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<BtoCarInfoVO> selectBtoIntColorListsByCondition(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectBtoIntColorListsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<BtoCreateOrderVO> selectBtoCreateOrderByCondition(BtoCreateOrderSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return btoCreateOrderDAO.selectBtoCreateOrderByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectBtoCreateOrderByConditionCnt(BtoCreateOrderSearchVO searchVO)  throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return btoCreateOrderDAO.selectBtoCreateOrderByConditionCnt(searchVO);
    }

    /**
     * 주문 우선순위  정보를 조회한다.
     */
    @Override
    public List<BtoCreateOrderVO> selectOrdProrCd(BtoCreateOrderVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());

        return btoCreateOrderDAO.selectOrdProrCd(searchVO);
    }

    /**
     * BTO 주문을 삭제한다.(실제 데이터 업데이트)
     */
    @Override
    public void delBtoCreateOrder(BtoCreateOrderSaveVO saveVO) throws Exception {
        List<BtoCreateOrderVO> checkList = null;

        for(BtoCreateOrderVO vo : saveVO.getDeleteList()){

            if( vo.getOrdTp().equals("N1") ){
                if( "N".equals(btoCreateOrderDAO.selectChkCreateYn(vo)) ){
                    String strDelOrder = messageSource.getMessage("global.lbl.deleteOrder", null, LocaleContextHolder.getLocale());
                    throw processException("global.lbl.createOrder", new String[]{strDelOrder});
                }
            }

            if(  vo.getOrdNo() != null && !"".equals(vo.getOrdNo()) ){
                checkList = btoCreateOrderDAO.selectBtoCreateOrderValueSearch(vo);
                if( checkList != null && "N".equals(checkList.get(0).getIfresultRtn()) ){
                    // 미전송건은 삭제할 수 없습니다.  - ERP 미전송 여부
                    throw processException("sal.info.erpResultRtn");
                }
            }

            vo.setDlrCd(LoginUtil.getDlrCd());
            vo.setUpdtUsrId(LoginUtil.getUserId());

            btoCreateOrderDAO.updateBtoCreateOrderDelete(vo);

            //프로시저추가
            btoCreateOrderDAO.procPenaltyOrdReq(vo);
        }
    }

    /**
     * BTO 주문을 등록 및 수정한다.
     */
    @Override
    public void saveBtoCreateOrder(BtoCreateOrderSaveVO saveVO) throws Exception {


        for(BtoCreateOrderVO vo : saveVO.getInsertList()){

            // 전략오더 마감체크.
            if( vo.getOrdTp().equals("AS") ){
                DeadlineCtrlMngSearchVO deadLineVO = new DeadlineCtrlMngSearchVO();
                deadLineVO.setsCtrlGrpCd("A");                      // 오더
                deadLineVO.setsCtrlDlrCd(LoginUtil.getDlrCd());     // 딜러코드
                deadLineVO.setsCtrlTargCd("AS");                    // 전략오더
                if(deadlineCtrlMngService.selectDeadLineCheck(deadLineVO) > 0){
                    // [전략오더]는 마감되었습니다.
                    throw processException("sal.info.deadLineCheckMsg", new String[]{messageSource.getMessage("sal.menu.strageOrder", null, LocaleContextHolder.getLocale())});
                }
            }

            if( vo.getOrdTp().equals("N1") ){
                if( "N".equals(btoCreateOrderDAO.selectChkCreateYn(vo)) ){
                    String strCreateOrder = messageSource.getMessage("global.lbl.createOrder", null, LocaleContextHolder.getLocale());
                    throw processException("sal.err.chkOrdDtBtoCreateOrd", new String[]{strCreateOrder});
                }
            }

            if( vo.getCarlineCd().equals("C3") ){
                String strOcnCd = vo.getOcnCd();

                if( strOcnCd != "G105" && strOcnCd != "G106" && strOcnCd != "G107" && strOcnCd != "G108"
                 && strOcnCd != "H008" && strOcnCd != "H009" && strOcnCd != "D004" && strOcnCd != "D005" ){

                    if( strOcnCd != "H001"){
                        throw processException("sal.err.chkCarBtoCreateOrd");
                    }else{
                        if( !vo.getIntColorCd().equals("TRY") ){
                            throw processException("sal.err.chkCarBtoCreateOrd");
                        }
                    }
                }else{
                    if( !vo.getIntColorCd().equals("PB") ){
                        throw processException("sal.err.chkCarBtoCreateOrd");
                    }
                }
            }
            vo.setDlrCd(LoginUtil.getDlrCd());
            vo.setRegUsrId(LoginUtil.getUserId());
            vo.setUpdtUsrId(LoginUtil.getUserId());

            vo.setErpTargYn("Y");
            vo.setErpSendYn("N");

            btoCreateOrderDAO.insertBtoCreateOrder(vo);
            //btoCreateOrderDAO.insertBtoCreateOrderHis(vo);

            //프로시저추가
            btoCreateOrderDAO.procPenaltyOrdReq(vo);
        }

        for(BtoCreateOrderVO vo : saveVO.getUpdateList()){

            vo.setDlrCd(LoginUtil.getDlrCd());
            vo.setRegUsrId(LoginUtil.getUserId());
            vo.setUpdtUsrId(LoginUtil.getUserId());

            vo.setErpTargYn("N");
            vo.setErpSendYn("N");

            btoCreateOrderDAO.updateBtoCreateOrder(vo);
            //btoCreateOrderDAO.insertBtoCreateOrderHis(vo);

            //프로시저추가
            btoCreateOrderDAO.procPenaltyOrdReq(vo);
        }
    }


    /**
     * 주문 우선순위  정보를 조회한다.
     */
    @Override
    public List<BtoCreateOrderAmtPopupVO> selectBtoCreateOrderAmtPopup(BtoCreateOrderVO searchVO) throws Exception {

        return btoCreateOrderDAO.selectBtoCreateOrderAmtPopup(searchVO);
    }

    /**
     * 주문유형 : 전략오더 일경우 참고수량 조회
     */
    @Override
    public int selectASOrdRefOrdQtyChkSearch(BtoCreateOrderSearchVO searchVO) throws Exception{
        return btoCreateOrderDAO.selectASOrdRefOrdQtyChkSearch(searchVO);
    }
}
