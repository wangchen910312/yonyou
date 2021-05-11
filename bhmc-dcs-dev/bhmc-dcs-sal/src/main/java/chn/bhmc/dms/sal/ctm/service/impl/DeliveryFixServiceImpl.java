package chn.bhmc.dms.sal.ctm.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cnt.service.ContractService;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.ctm.service.DeliveryFixService;
import chn.bhmc.dms.sal.ctm.service.dao.DeliveryFixDAO;
import chn.bhmc.dms.sal.ctm.vo.DeliveryAskSaveVO;
import chn.bhmc.dms.sal.ctm.vo.DeliveryAskSearchVO;
import chn.bhmc.dms.sal.ctm.vo.DeliveryAskVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeliveryFixServiceImpl
 * @Description : 출고확정
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.10      Kim Jin Suk        최초 생성
 * </pre>
 */

@Service("deliveryFixService")
public class DeliveryFixServiceImpl extends HService implements DeliveryFixService {

    /**
     * 출고요청 DAO 선언
     */
    @Resource(name="deliveryFixDAO")
    DeliveryFixDAO deliveryFixDAO;


    @Resource(name="deliveryFixService")
    DeliveryFixService deliveryFixService;

    @Resource(name="contractService")
    ContractService contractService;

    /**
     * 조회 조건에 해당하는 출고요청 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeliveryAskSearchVO
     * @return 조회 목록
     */
    @Override
    public int selectDeliveryFixsByConditionCnt(DeliveryAskSearchVO searchVO) throws Exception{
        return deliveryFixDAO.selectDeliveryFixsByConditionCnt(searchVO);
    }
    @Override
    public List<DeliveryAskVO> selectDeliveryFixsByCondition(DeliveryAskSearchVO searchVO) throws Exception{
        return deliveryFixDAO.selectDeliveryFixsByCondition(searchVO);
    }


    /**
     * 출고확정 처리
     */
    @Override
    public int confirmFixDelivery(DeliveryAskSaveVO saveVO) throws Exception {
        saveVO.setRegUsrId( LoginUtil.getUserId() );
        saveVO.setUpdtUsrId( LoginUtil.getUserId() );
        saveVO.setGiStatCd("02");           // 출고확정
        saveVO.setGiReqDt(new Date());
        saveVO.setContractStatCd("41");     // 출고확정

        ContractSearchVO searchVO = new ContractSearchVO();
        searchVO.setsDlrCd(saveVO.getDlrCd());
        searchVO.setsContractNo(saveVO.getContractNo());
        String contState = contractService.selectContractStatCd(searchVO);      // 계약상태 조회

        if("40".equals(contState)){
            // 출고요청 : SA_0207T (출고정보에 등록)
            deliveryFixService.inertFixDelivery(saveVO);

            // 출고요청 : SA_0201T (계약정보에 상태 변경)
            deliveryFixService.updateFixDeliveryState(saveVO);
        }else{
            // msg : 해당 내역은 출고요청 상태가 아닙니다.
            throw processException("global.info.stateNotMsg", new String[]{messageSource.getMessage("global.lbl.releaseReq", null, LocaleContextHolder.getLocale())});
        }

        return 1;
    }

    /**
     * 출고확정 : SA_0207T
     */
    @Override
    public int inertFixDelivery(DeliveryAskSaveVO saveVO) throws Exception {
        return deliveryFixDAO.inertFixDelivery(saveVO);
    }

    /**
     * 출고확정 : SA_0201T (계약정보에 상태 변경)
     */
    @Override
    public int updateFixDeliveryState(DeliveryAskSaveVO saveVO) throws Exception {
        return deliveryFixDAO.updateFixDeliveryState(saveVO);
    }

    /**
     * 출고확정취소 처리
     */
    @Override
    public int confirmFixDeliveryCancel(DeliveryAskSaveVO saveVO) throws Exception {
        saveVO.setRegUsrId( LoginUtil.getUserId() );
        saveVO.setUpdtUsrId( LoginUtil.getUserId() );
        saveVO.setGiStatCd("04");   // 출고취소
        saveVO.setGiReqDt(null);
        saveVO.setContractStatCd("40");     // 출고요청

        ContractSearchVO searchVO = new ContractSearchVO();
        searchVO.setsDlrCd(saveVO.getDlrCd());
        searchVO.setsContractNo(saveVO.getContractNo());
        String contState = contractService.selectContractStatCd(searchVO);      // 계약상태 조회

        if("41".equals(contState)){
            // 출고요청 : SA_0207T (출고정보에 등록)
            deliveryFixService.inertFixDelivery(saveVO);

            // 출고요청 : SA_0201T (계약정보에 상태 변경)
            deliveryFixService.updateFixDeliveryState(saveVO);
        }else{
            // msg : 해당 내역은 확정 상태가 아닙니다.
            throw processException("global.info.stateNotMsg", new String[]{messageSource.getMessage("global.lbl.releaseComf", null, LocaleContextHolder.getLocale())});
        }

        return 1;
    }


}
