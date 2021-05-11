package chn.bhmc.dms.mob.api.part.service.impl;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.part.dao.PartIssueReqDetailDAO;
import chn.bhmc.dms.mob.api.part.service.PartCommonCodeService;
import chn.bhmc.dms.mob.api.part.service.PartIssueReqDetailService;
import chn.bhmc.dms.mob.api.part.service.PartIssueReqTechManService;
import chn.bhmc.dms.mob.api.part.service.PartStorageService;
import chn.bhmc.dms.mob.api.part.service.PartSystemConfigInfoService;
import chn.bhmc.dms.mob.api.part.vo.CommonCodeVO;
import chn.bhmc.dms.mob.api.part.vo.IssueReqDetailVO;
import chn.bhmc.dms.mob.api.part.vo.IssueReqSearchVO;
import chn.bhmc.dms.mob.api.part.vo.IssueReqTechManSearchVO;
import chn.bhmc.dms.mob.api.part.vo.IssueReqTechManVO;
import chn.bhmc.dms.mob.api.part.vo.StorageSearchVO;
import chn.bhmc.dms.mob.api.part.vo.StorageVO;


/**
 * 구매요청 상세 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 15.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("PartIssueReqDetailService")
public class PartIssueReqDetailServiceImpl extends HService implements PartIssueReqDetailService , JxlsSupport {

    Logger logger = LoggerFactory.getLogger(PartIssueReqDetailServiceImpl.class);

    /**
     * 부품요청 상세 DAO
     */
    @Resource(name="PartIssueReqDetailDAO")
    private PartIssueReqDetailDAO PartIssueReqDetailDAO;

    /**
     * 공통코드 관리 서비스
     * over
     */
    @Resource(name="PartCommonCodeService")
    PartCommonCodeService PartCommonCodeService;

    /**
     *  시스템 설정정보
     * over
     */
    @Resource(name="PartSystemConfigInfoService")
    PartSystemConfigInfoService PartSystemConfigInfoService;

    /**
     * SA 서비스
     * over
     */
    @Resource(name="PartIssueReqTechManService")
    PartIssueReqTechManService PartIssueReqTechManService;

    /**
     * 창고 관리 서비스
     * over
     */
    @Resource(name="PartStorageService")
    PartStorageService PartStorageService;

    
    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailsByCondition(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqDetailVO> selectIssueReqDetailsByCondition(IssueReqSearchVO searchVO) throws Exception {
        return PartIssueReqDetailDAO.selectIssueReqDetailsByCondition(searchVO);
    }

  
    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailsByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public int selectIssueReqDetailsByConditionCnt(IssueReqSearchVO searchVO) throws Exception {
        return PartIssueReqDetailDAO.selectIssueReqDetailsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqDetailService#selectIssueReqDetailStatusByCondition(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqDetailVO> selectIssueReqDetailStatusByCondition(IssueReqSearchVO searchVO) throws Exception {
        return PartIssueReqDetailDAO.selectIssueReqDetailStatusByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        IssueReqSearchVO searchVO = new IssueReqSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        searchVO.setsParGiTp(params.get("sParGiTp").toString());
        searchVO.setsParReqStatCd(params.get("sParReqStatCd").toString());
        searchVO.setsRoDocNo(params.get("sRoDocNo").toString());
        searchVO.setsRoStatCd(params.get("sRoStatCd").toString());
        searchVO.setsGiDocNo(params.get("sGiDocNo").toString());
        searchVO.setsCustNm(params.get("sCustNm").toString());
        searchVO.setsSerPrsnId(params.get("sSerPrsnId").toString());
        searchVO.setsCarNo(params.get("sCarNo").toString());
        searchVO.setsVinNo(params.get("sVin").toString());
        searchVO.setsReceiveNm(params.get("sReceiveNm").toString());
        searchVO.setsItemCd(params.get("sItemCd").toString());

        if(!StringUtils.isBlank(params.get("sGiDocReqStartDt").toString())){
            String strGiDocReqStartDt = params.get("sGiDocReqStartDt").toString();
            Date sGiDocReqStartDt = Date.valueOf(strGiDocReqStartDt);
            searchVO.setsGiDocReqStartDt(sGiDocReqStartDt);
        }

        if(!StringUtils.isBlank(params.get("sGiDocReqEndDt").toString())){
            String strGiDocReqEndDt = params.get("sGiDocReqEndDt").toString();
            Date sGiDocReqEndDt = Date.valueOf(strGiDocReqEndDt);
            searchVO.setsGiDocReqEndDt(sGiDocReqEndDt);
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = PartSystemConfigInfoService.selectStrValueByKey("dateFormat");

        List<IssueReqDetailVO> list = selectIssueReqDetailStatusByCondition(searchVO);

        //RO유형
        List<CommonCodeVO> roTpCdList = PartCommonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd);

        // 공통코드 : 부품출고요청상태
        List<CommonCodeVO> partsParReqStatCdList = PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR302", null, langCd);

        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<StorageVO> strgeCdList = PartStorageService.selectStoragesByCondition(storageSearchVO);

        //SA 리스트.
        IssueReqTechManSearchVO issueReqTechManSearchVO = new IssueReqTechManSearchVO();
        issueReqTechManSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<IssueReqTechManVO> tecCdList = PartIssueReqTechManService.selectTechManFnMasterByCondition(issueReqTechManSearchVO);

        //공통코드 또는 코드 명칭  변환 처리.
        for(IssueReqDetailVO issueReqDetailVO : list){
            //roTp
            for(CommonCodeVO roTpVO : roTpCdList){
                if(roTpVO.getCmmCd().equals(issueReqDetailVO.getRoTp())){
                    issueReqDetailVO.setRoTp("["+issueReqDetailVO.getRoTp()+"]"+roTpVO.getCmmCdNm());
                    break;
                }
            }
            //parReqStatCd
            for(CommonCodeVO partsParReqStatCdVO : partsParReqStatCdList){
                if(partsParReqStatCdVO.getCmmCd().equals(issueReqDetailVO.getParReqStatCd())){
                    issueReqDetailVO.setParReqStatCd("["+issueReqDetailVO.getParReqStatCd()+"]"+partsParReqStatCdVO.getCmmCdNm());
                    break;
                }
            }

            //strgeCdList
            for(StorageVO storageVO : strgeCdList){
                if(storageVO.getStrgeCd().equals(issueReqDetailVO.getReqStrgeCd())){
                    issueReqDetailVO.setReqStrgeCd(storageVO.getStrgeNm());
                    break;
                }
            }

            //receiveId
            for(IssueReqTechManVO issueReqTechManVO : tecCdList){
                if(issueReqTechManVO.getTecId().equals(issueReqDetailVO.getReceiveId())){
                    issueReqDetailVO.setReceiveId(issueReqTechManVO.getTecNm());
                    break;
                }
            }

            String receiveDtString = "";
            String receiveTimeString = "";
            if(issueReqDetailVO.getReceiveDt() != null){
                receiveDtString = DateUtil.convertToString(issueReqDetailVO.getReceiveDt(), dateFormat);
                receiveTimeString = DateUtil.convertToString(issueReqDetailVO.getReceiveDt(), dateFormat + " HH:mm");
            }

            issueReqDetailVO.setReceiveDtString(receiveDtString);
            issueReqDetailVO.setReceiveTimeString(receiveTimeString);

        }

        context.putVar("items", list);
   }
}
