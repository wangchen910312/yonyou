package chn.bhmc.dms.ser.cmm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.ser.cmm.service.ServicePartService;
import chn.bhmc.dms.ser.cmm.service.dao.ServicePartDAO;
import chn.bhmc.dms.ser.cmm.vo.ServiceCmmVO;
import chn.bhmc.dms.ser.cmm.vo.ServicePartVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServicePartServiceImpl.java
 * @Description : 공통 공임 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 8. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 23.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("servicePartService")
public class ServicePartServiceImpl extends HService implements ServicePartService {

    /**
     * RO접수 공임 DAO
     */
    @Resource(name="servicePartDAO")
    ServicePartDAO servicePartDAO;

    /**
     * 부품요청 Service
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    /**
     * 조회 조건에 해당하는 공임 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectServicePartsByConditionCnt(TabInfoSearchVO searchVO) throws Exception {
        if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return servicePartDAO.selectServicePartsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 공임을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServicePartVO> selectServicePartsByCondition(TabInfoSearchVO searchVO) throws Exception {
        if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return servicePartDAO.selectServicePartsByCondition(searchVO);
    }

    /**
     * 공임을 등록/수정/삭제한다.
     * @param servicePartSaveVO - 공임정보를 포함하는 ServicePartVO
     * @return
     */
    public void multiServicePart(List<ServicePartVO> servicePartSaveVO, ServiceCmmVO serviceCmmVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        String preFixId = serviceCmmVO.getPreFixId();

        ServicePartVO partVO = new ServicePartVO();
        partVO.setPreFixId(preFixId);
        partVO.setDocNo(serviceCmmVO.getDocNo());
        partVO.setDlrCd(dlrCd);
        servicePartDAO.deleteServicePart(partVO);

        int lineNo = 1;

        for(ServicePartVO servicePartVO : servicePartSaveVO){
            servicePartVO.setRegUsrId(userId);
            servicePartVO.setDlrCd(dlrCd);
            servicePartVO.setPreFixId(preFixId);
            servicePartVO.setDocNo(serviceCmmVO.getDocNo());
            servicePartVO.setLineNo(lineNo++);
            servicePartDAO.insertServicePart(servicePartVO);

        }
    }

    /**
     * 공임을 등록/수정/삭제한다(부품 요청 인터페이스용).
     * @param servicePartSaveVO - 공임정보를 포함하는 ServicePartVO
     * @return
     */
    public void multiServicePart(List<ServicePartVO> servicePartSaveVO, ServiceCmmVO serviceCmmVO, boolean partIfYn) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        String preFixId = serviceCmmVO.getPreFixId();

        ServicePartVO partVO = new ServicePartVO();
        partVO.setPreFixId(preFixId);
        partVO.setDocNo(serviceCmmVO.getDocNo());
        partVO.setDlrCd(dlrCd);
        servicePartDAO.deleteServicePart(partVO);

        IssueReqSaveVO issueReqSaveVO = new IssueReqSaveVO();
        List<IssueReqDetailVO> issueReqDetailVOList = new ArrayList<IssueReqDetailVO>();
        IssueReqVO issueReqVO = new IssueReqVO();
        IssueReqDetailVO issueReqDetailVO = new IssueReqDetailVO();

        issueReqVO.setDlrCd(dlrCd);
        issueReqVO.setPltCd(LoginUtil.getPltCd());
        issueReqVO.setRoDocNo(serviceCmmVO.getDocNo());
        issueReqVO.setParGiTp(serviceCmmVO.getPartReqType());
        issueReqVO.setParReqStatCd("01");
        issueReqVO.setCancYn("N");
        issueReqVO.setCustCd(serviceCmmVO.getDriverId());
        issueReqVO.setCustNm(serviceCmmVO.getDriverNm());
        issueReqVO.setVinNo(serviceCmmVO.getVinNo());
        issueReqVO.setCarNo(serviceCmmVO.getCarRegNo());
        issueReqVO.setCarlineCd("");
        issueReqVO.setSerPrsnId(serviceCmmVO.getSaId());
        issueReqVO.setResvDocNo(serviceCmmVO.getResvDocNo());
        issueReqVO.setReadyStatCd("01");

        int lineNo = 1;

        for(ServicePartVO servicePartVO : servicePartSaveVO){
            servicePartVO.setRegUsrId(userId);
            servicePartVO.setDlrCd(dlrCd);
            servicePartVO.setPreFixId(preFixId);
            servicePartVO.setDocNo(serviceCmmVO.getDocNo());
            servicePartVO.setLineNo(lineNo++);
            servicePartDAO.insertServicePart(servicePartVO);

            // 부품요청
            issueReqDetailVO.setDlrCd(dlrCd);
            issueReqDetailVO.setPltCd(LoginUtil.getPltCd());
            issueReqDetailVO.setItemCd(servicePartVO.getItemCd());
            issueReqDetailVO.setItemNm(servicePartVO.getItemNm());
            issueReqDetailVO.setResvDocNo(serviceCmmVO.getResvDocNo());
            issueReqDetailVO.setRoDocNo(serviceCmmVO.getDocNo());
            issueReqDetailVO.setParReqDocLineNo(lineNo);
            issueReqDetailVO.setRoLineNo(servicePartVO.getLineNo());
            issueReqDetailVO.setReqQty(servicePartVO.getItemQty());
            issueReqDetailVO.setReqStrgeCd(servicePartVO.getGrStrgeCd());
            issueReqDetailVO.setGrStrgeCd(servicePartVO.getGrStrgeCd());
            issueReqDetailVO.setGiStrgeCd(servicePartVO.getGiStrgeCd());
            issueReqDetailVO.setCancYn("N");
            issueReqDetailVO.setParReqStatCd("01");
            issueReqDetailVO.setParGiTp(serviceCmmVO.getPartReqType());
            issueReqDetailVO.setReadyStatCd("01");
            issueReqDetailVO.setUnitCd(servicePartVO.getCalcUnitCd());

            issueReqDetailVOList.add(issueReqDetailVO);
        }

        issueReqSaveVO.setIssueReqVO(issueReqVO);
        issueReqSaveVO.setIssueReqDetailVO(issueReqDetailVOList);
        issueReqSaveVO = issueReqService.insertIssueReq(issueReqSaveVO);

    }

    public void deleteServicePart(ServicePartVO servicePartVO) throws Exception {
        if( StringUtil.nullConvert(servicePartVO.getDlrCd()).equals("")){
            servicePartVO.setDlrCd(LoginUtil.getDlrCd());
        }
        servicePartDAO.deleteServicePart(servicePartVO);
    }

    /*
     * @see chn.bhmc.dms.ser.ro.service.ServicePartService#insertServicePart(chn.bhmc.dms.ser.ro.vo.ServicePartVO)
     */
    @Override
    public void insertServicePart(ServicePartVO servicePartVO) throws Exception {

        if( StringUtil.nullConvert(servicePartVO.getDlrCd()).equals("")){
            servicePartVO.setDlrCd(LoginUtil.getDlrCd());
        }
        servicePartDAO.insertServicePart(servicePartVO);
    }

    /*
     * @see chn.bhmc.dms.ser.ro.service.ServicePartService#updateServicePart(chn.bhmc.dms.ser.ro.vo.ServicePartVO)
     */
    @Override
    public void updateServicePart(ServicePartVO servicePartVO) throws Exception {

        if( StringUtil.nullConvert(servicePartVO.getDlrCd()).equals("")){
            servicePartVO.setDlrCd(LoginUtil.getDlrCd());
        }
        servicePartDAO.updateServicePart(servicePartVO);
    }

    /**
     * 조회 조건에 해당하는 부품 히스토리 을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServicePartVO> selectServicePartsHistByCondition(TabInfoSearchVO searchVO) throws Exception {
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return servicePartDAO.selectServicePartsByCondition(searchVO);
    }

}