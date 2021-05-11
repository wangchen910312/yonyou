package chn.bhmc.dms.ser.ro.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.service.ServiceLaborService;
import chn.bhmc.dms.ser.cmm.service.ServicePartService;
import chn.bhmc.dms.ser.cmm.vo.CustDemandVO;
import chn.bhmc.dms.ser.cmm.vo.EtcIssueVO;
import chn.bhmc.dms.ser.cmm.vo.ServiceCmmVO;
import chn.bhmc.dms.ser.cmm.vo.TrobleDescVO;
import chn.bhmc.dms.ser.rev.service.ReservationReceiptService;
import chn.bhmc.dms.ser.ro.service.PreRepairOrderService;
import chn.bhmc.dms.ser.ro.service.dao.PreRepairOrderDAO;
import chn.bhmc.dms.ser.ro.vo.PreRepairOrderSaveVO;
import chn.bhmc.dms.ser.ro.vo.PreRepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.PreRepairOrderVO;
import chn.bhmc.dms.ser.svi.service.BayCalendarService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderServiceImpl.java
 * @Description : RO ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("preRepairOrderService")
public class PreRepairOrderServiceImpl extends HService implements PreRepairOrderService {

    /**
     * 예약접수 DAO
     */
    @Resource(name="preRepairOrderDAO")
    PreRepairOrderDAO repairOrderDAO;

    /**
     * 부품공통 Service
     */
    @Resource(name="servicePartService")
    ServicePartService servicePartService;

    /**
     * 공임공통 Service
     */
    @Resource(name="serviceLaborService")
    ServiceLaborService serviceLaborService;

    /**
     * 예약접수 Service
     */
    @Resource(name="reservationReceiptService")
    ReservationReceiptService reservationReceiptService;

    /**
     * Bay캘린더 Service
     */
    @Resource(name="bayCalendarService")
    BayCalendarService bayCalendarService;


    @Resource(name="preRoDocNoIdGenService")
    TableIdGenService preRoDocNoIdGenService;


    /**
     * 고객요구사항 및 고장설명
     */
    @Autowired
    ServiceCommonService serviceCommonService;


    /*
     * {@inheritDoc}
     */
    @Override
    public int selectPreRepairOrderByConditionCnt(PreRepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return repairOrderDAO.selectPreRepairOrderByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<PreRepairOrderVO> selectPreRepairOrderByCondition(PreRepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        List<PreRepairOrderVO> resvList = repairOrderDAO.selectPreRepairOrderByCondition(searchVO);

        return resvList;
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectPreRepairOrderListByConditionCnt(PreRepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return repairOrderDAO.selectPreRepairOrderListByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<PreRepairOrderVO> selectPreRepairOrderListByCondition(PreRepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        List<PreRepairOrderVO> resvList = repairOrderDAO.selectPreRepairOrderListByCondition(searchVO);

        return resvList;
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public String multiPreRepairOrder(PreRepairOrderSaveVO preRepairOrderSaveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        PreRepairOrderVO preRoVO = preRepairOrderSaveVO.getPreRepairOrderVO();
        String preRoDocNo = preRoVO.getPreRoDocNo();

        if(!StringUtil.isEmpty(preRoDocNo)) {
            preRoVO.setUpdtUsrId(userId);
            preRoVO.setDlrCd(dlrCd);
            repairOrderDAO.updatePreRepairOrder(preRoVO);
        } else {

            /**
             * RO번호(키생성)
             */
            preRoDocNo = preRoDocNoIdGenService.getNextStringId();

            preRoVO.setRegUsrId(userId);
            preRoVO.setPreRoDocNo(preRoDocNo);
            preRoVO.setDlrCd(dlrCd);
            repairOrderDAO.insertPreRepairOrder(preRoVO);
        }

        ServiceCmmVO serviceCmmVO = new ServiceCmmVO();
        serviceCmmVO.setPreFixId(preRoVO.getPreFixId());
        serviceCmmVO.setDocNo(preRoVO.getPreRoDocNo());

        // 부품 추가/수정/삭제
        servicePartService.multiServicePart(preRepairOrderSaveVO.getServicePartListVO(), serviceCmmVO);

        // 공임 추가/수정/삭제
        serviceLaborService.multiServiceLabor(preRepairOrderSaveVO.getServiceLaborListVO(), serviceCmmVO);

        List<CustDemandVO> custDemandList = preRepairOrderSaveVO.getCustDemandListVO();
        TrobleDescVO trobleDescVO = preRepairOrderSaveVO.getTrobleDescVO();
        List<EtcIssueVO> etcIssueList = preRepairOrderSaveVO.getEtcIssueListVO();

        //고객요구사항 추가/수정/삭제
        serviceCommonService.multiCustDemand(custDemandList, preRoDocNo, preRoVO.getPreFixId());
        //고장서술 추가/수정/삭제
        serviceCommonService.multiTrobleDesc(trobleDescVO, preRoDocNo);

        serviceCommonService.multiEtcIssue(etcIssueList, preRoDocNo, preRoVO.getPreFixId());

        return preRoDocNo;
    }

    /*
     * {@inheritDoc}
     */
    public PreRepairOrderVO selectPreRepairOrderByKey(PreRepairOrderSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return repairOrderDAO.selectPreRepairOrderByKey(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    public PreRepairOrderVO selectPreRepairOrderInfoByKey(PreRepairOrderSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return repairOrderDAO.selectPreRepairOrderInfoByKey(searchVO);
    }




    /*
     * {@inheritDoc}
     */
    @Override
    public String updatePreRepairOrder(PreRepairOrderVO repairOrderVO) throws Exception {
        repairOrderVO.setUpdtUsrId(LoginUtil.getUserId());
        repairOrderVO.setDlrCd(LoginUtil.getDlrCd());
        repairOrderDAO.updatePreRepairOrder(repairOrderVO);
        return repairOrderVO.getPreRoDocNo();
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public String selectPreRepairOrderCheckByKey(PreRepairOrderSearchVO repairOrderVO) throws Exception {

        return repairOrderDAO.selectPreRepairOrderCheckByKey(repairOrderVO);
    }



}