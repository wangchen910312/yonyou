package chn.bhmc.dms.ser.res.service.impl;

import java.util.Calendar;
import java.util.Date;
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
import chn.bhmc.dms.ser.res.service.RescueService;
import chn.bhmc.dms.ser.res.service.dao.RescueDAO;
import chn.bhmc.dms.ser.res.vo.RescueSaveVO;
import chn.bhmc.dms.ser.res.vo.RescueSearchVO;
import chn.bhmc.dms.ser.res.vo.RescueVO;
import chn.bhmc.dms.ser.svi.service.BayCalendarService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ResuceServiceImpl.java
 * @Description : 구원서비스 ServiceImpl
 * @author YIN XUEYUAN
 * @since 2016. 6. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 19.   YIN XUEYUAN     최초 생성
 * </pre>
 */

@Service("rescueService")
public class ResuceServiceImpl extends HService implements RescueService {

    /**
     * 구원서비스 DAO
     */
    @Resource(name="rescueDAO")
    RescueDAO rescueDAO;

    /**
     * Bay캘린더 Service
     */
    @Resource(name="bayCalendarService")
    BayCalendarService bayCalendarService;

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

    @Resource(name="rescueDocNoIdGenService")
    TableIdGenService rescueDocNoIdGenService;


    /**
     * 고객요구사항 및 고장설명
     */
    @Autowired
    ServiceCommonService serviceCommonService;


    /*
     * {@inheritDoc}
     */
    @Override
    public int selectRescueByConditionCnt(RescueSearchVO searchVO) throws Exception {

        if(StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return rescueDAO.selectRescueByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<RescueVO> selectRescueByCondition(RescueSearchVO searchVO) throws Exception {

        if(StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        List<RescueVO> rescList = rescueDAO.selectRescueByCondition(searchVO);

        return rescList;
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectRescueListByConditionCnt(RescueSearchVO searchVO) throws Exception {

        if(StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return rescueDAO.selectRescueListByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<RescueVO> selectRescueListByCondition(RescueSearchVO searchVO) throws Exception {

        if(StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        List<RescueVO> rescList = rescueDAO.selectRescueListByCondition(searchVO);

        return rescList;
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public String multiRescue(RescueSaveVO rescueSaveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        RescueVO resVO = rescueSaveVO.getRescueVO();
        String rescDocNo = resVO.getRescDocNo();
        Date rescReqDt = resVO.getRescReqDt();
        Date expcRescStartDt = resVO.getExpcRescStartDt();

        if(!StringUtil.isEmpty(rescDocNo)) {
            resVO.setUpdtUsrId(userId);
            rescueDAO.updateRescue(resVO);
        } else {

            rescDocNo = rescueDocNoIdGenService.getNextStringId();
            resVO.setRescDocNo(rescDocNo);

            // 서비스 예약종료일자가 null일 경우 시작일자+30분
            if(expcRescStartDt == null) {
                Calendar cal = Calendar.getInstance();
                cal.setTime(rescReqDt);
                cal.add(Calendar.MINUTE, 30);
                rescueSaveVO.getRescueVO().setExpcRescStartDt(cal.getTime());
            }

            insertRescue(resVO);
            //rescueDAO.insertRescue(rescueSaveVO.getRescueVO());
        }

        ServiceCmmVO serviceCmmVO = new ServiceCmmVO();
        serviceCmmVO.setPreFixId(resVO.getPreFixId());
        serviceCmmVO.setDocNo(resVO.getRescDocNo());

        // 부품 추가/수정/삭제
        servicePartService.multiServicePart(rescueSaveVO.getServicePartListVO(), serviceCmmVO);

        // 공임 추가/수정/삭제
        serviceLaborService.multiServiceLabor(rescueSaveVO.getServiceLaborListVO(), serviceCmmVO);

        List<CustDemandVO> custDemandList = rescueSaveVO.getCustDemandListVO();
        TrobleDescVO trobleDescVO = rescueSaveVO.getTrobleDescVO();
        List<EtcIssueVO> etcIssueList = rescueSaveVO.getEtcIssueListVO();

        //고객요구사항 추가/수정/삭제
        serviceCommonService.multiCustDemand(custDemandList, rescDocNo, "RES");
        //고장서술 추가/수정/삭제
        serviceCommonService.multiTrobleDesc(trobleDescVO, rescDocNo);
        //기타사항 추가/수정/삭제
        serviceCommonService.multiEtcIssue(etcIssueList, rescDocNo, "RES");

        return rescDocNo;
    }

    public void updateRescue(RescueVO rescueVO) throws Exception {
        RescueSearchVO svo = new RescueSearchVO();
        svo.setsRescDocNo(rescueVO.getRescDocNo());
        svo.setsDlrCd(rescueVO.getDlrCd());

        List<RescueVO> vo = rescueDAO.selectRescueByCondition(svo);
        vo.get(0).setRescStatCd(rescueVO.getRescStatCd());
        vo.get(0).setCancReasonCd(rescueVO.getCancReasonCd());
        vo.get(0).setCancReasonCont(rescueVO.getCancReasonCont());
        String userId = LoginUtil.getUserId();
        vo.get(0).setUpdtUsrId(userId);
        rescueDAO.updateRescue(vo.get(0));
    }


    /*
     * {@inheritDoc}
     */
    @Override
    public String insertRescue(RescueVO rescueVO) throws Exception {

        /**
         * 예약번호(키생성)
        */
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        rescueVO.setRegUsrId(userId);
        rescueVO.setDlrCd(dlrCd);

        rescueDAO.insertRescue(rescueVO);

        return rescueVO.getRescDocNo();
    }

    /*
     * {@inheritDoc}
     */
    public RescueVO selectRescueByKey(RescueSearchVO searchVO) throws Exception {
        return rescueDAO.selectRescueByKey(searchVO);
    }
}