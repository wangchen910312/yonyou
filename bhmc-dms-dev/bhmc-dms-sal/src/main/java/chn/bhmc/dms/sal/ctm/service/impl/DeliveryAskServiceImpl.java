package chn.bhmc.dms.sal.ctm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cnt.service.ContractService;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.ctm.service.DeliveryAskService;
import chn.bhmc.dms.sal.ctm.service.dao.DeliveryAskDAO;
import chn.bhmc.dms.sal.ctm.vo.DeliveryAskSaveVO;
import chn.bhmc.dms.sal.ctm.vo.DeliveryAskSearchVO;
import chn.bhmc.dms.sal.ctm.vo.DeliveryAskVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AskHelpCarServiceImpl
 * @Description : 출고요청
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.02.23      Kim Jin Suk        최초 생성
 * </pre>
 */

@Service("deliveryAskService")
public class DeliveryAskServiceImpl extends HService implements DeliveryAskService {

    /**
     * 출고요청 DAO 선언
     */
    @Resource(name="deliveryAskDAO")
    DeliveryAskDAO deliveryAskDAO;


    @Resource(name="deliveryAskService")
    DeliveryAskService deliveryAskService;

    @Resource(name="contractService")
    ContractService contractService;

    /**
     * 조회 조건에 해당하는 출고요청 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeliveryAskSearchVO
     * @return 조회 목록
     */
    @Override
    public int selectDeliveryAsksByConditionCnt(DeliveryAskSearchVO searchVO) throws Exception{
        return deliveryAskDAO.selectDeliveryAsksByConditionCnt(searchVO);
    }
    @Override
    public List<DeliveryAskVO> selectDeliveryAsksByCondition(DeliveryAskSearchVO searchVO) throws Exception{
        return deliveryAskDAO.selectDeliveryAsksByCondition(searchVO);
    }


    /**
     * 출고요청 처리
     */
    @Override
    public int confirmAskDeliveryPopup(DeliveryAskSaveVO saveVO) throws Exception {
        saveVO.setRegUsrId( LoginUtil.getUserId() );
        saveVO.setUpdtUsrId( LoginUtil.getUserId() );
        saveVO.setGiStatCd("01");   // 출고등록
        saveVO.setContractStatCd("40");     // 출고요청

        ContractSearchVO searchVO = new ContractSearchVO();
        searchVO.setsDlrCd(saveVO.getDlrCd());
        searchVO.setsContractNo(saveVO.getContractNo());
        String contState = contractService.selectContractStatCd(searchVO);      // 계약상태 조회

        if("30".equals(contState)){
            // 출고요청 : SA_0207T (출고정보에 등록)
            deliveryAskService.inertAskDelivery(saveVO);

            // 출고요청 : SA_0201T (계약정보에 상태 변경)
            deliveryAskService.updateDeliveryState(saveVO);
        }else{
            // msg : 해당 내역은 배정상태가 아닙니다.
            throw processException("global.info.stateNotMsg", new String[]{messageSource.getMessage("global.lbl.assign", null, LocaleContextHolder.getLocale())});
        }

        return 1;
    }

    /**
     * 출고요청 : SA_0207T (출고정보에 등록)
     */
    @Override
    public int inertAskDelivery(DeliveryAskSaveVO saveVO) throws Exception {
        return deliveryAskDAO.inertAskDelivery(saveVO);
    }

    /**
     * 출고요청 : SA_0201T (계약정보에 상태 변경)
     */
    @Override
    public int updateDeliveryState(DeliveryAskSaveVO saveVO) throws Exception {
        return deliveryAskDAO.updateDeliveryState(saveVO);
    }



    /**
     * 출고요청취소 처리
     */
    @Override
    public int confirmAskDeliveryCancel(DeliveryAskSaveVO saveVO) throws Exception {
        saveVO.setRegUsrId( LoginUtil.getUserId() );
        saveVO.setUpdtUsrId( LoginUtil.getUserId() );
        saveVO.setGiStatCd("03");   // 출고취소
        saveVO.setGiReqDt(null);
        saveVO.setContractStatCd("30");     // 출고요청

        ContractSearchVO searchVO = new ContractSearchVO();
        searchVO.setsDlrCd(saveVO.getDlrCd());
        searchVO.setsContractNo(saveVO.getContractNo());
        String contState = contractService.selectContractStatCd(searchVO);      // 계약상태 조회

        if("40".equals(contState)){
            // 출고요청 : SA_0207T (출고정보에 등록)
            deliveryAskService.inertAskDelivery(saveVO);

            // 출고요청 : SA_0201T (계약정보에 상태 변경)
            deliveryAskService.updateDeliveryState(saveVO);
        }else{
            // msg : 해당 내역은 출고요청 상태가 아닙니다.
            throw processException("global.info.stateNotMsg", new String[]{messageSource.getMessage("global.lbl.releaseReq", null, LocaleContextHolder.getLocale())});
        }

        return 1;
    }


}
