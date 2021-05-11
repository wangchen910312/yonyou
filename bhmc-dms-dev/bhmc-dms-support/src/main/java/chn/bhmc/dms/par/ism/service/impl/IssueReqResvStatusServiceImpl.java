package chn.bhmc.dms.par.ism.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.ism.vo.IssueReqTechManVO;

import chn.bhmc.dms.par.ism.service.IssueReqTechManService;

import chn.bhmc.dms.par.ism.vo.IssueReqTechManSearchVO;

import chn.bhmc.dms.core.util.DateUtil;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.ism.service.IssueReqResvStatusService;
import chn.bhmc.dms.par.ism.service.dao.IssueReqResvStatusDAO;
import chn.bhmc.dms.par.ism.vo.IssueReqResvStatusVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;

/**
 * 부품예약현황 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 8. 12.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 8. 12.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("issueReqResvStatusService")
public class IssueReqResvStatusServiceImpl extends HService implements IssueReqResvStatusService , JxlsSupport {

    /**
     * 부품예약상태 DAO
     */
    @Resource(name="issueReqResvStatusDAO")
    private IssueReqResvStatusDAO issueReqResvStatusDAO;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * SA 서비스
     */
    @Resource(name="issueReqTechManService")
    IssueReqTechManService issueReqTechManService;

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqResvStatusService#selectIssueReqResvStatusByCondition(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqResvStatusVO> selectIssueReqResvStatusByCondition(IssueReqSearchVO searchVO) throws Exception {
        return issueReqResvStatusDAO.selectIssueReqResvStatusByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqResvStatusService#selectIssueReqResvStatusByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public int selectIssueReqResvStatusByConditionCnt(IssueReqSearchVO searchVO) throws Exception {
        return issueReqResvStatusDAO.selectIssueReqResvStatusByConditionCnt(searchVO);
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
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        // 공통코드 : 위탁서 유형(RO)
        List<CommonCodeVO> parGiTpList = new ArrayList<CommonCodeVO>();
        CommonCodeVO commonCodeRoVO = commonCodeService.selectCommonCodeByKey("PAR301", "RO");
        if(commonCodeRoVO != null){
            parGiTpList.add(commonCodeRoVO);
        }
        // 공통코드 : 위탁서 유형(IN) : 내부운용
        CommonCodeVO commonCodeInVO = commonCodeService.selectCommonCodeByKey("PAR301", "IN");
        if(commonCodeInVO != null){
            parGiTpList.add(commonCodeInVO);
        }
        // 공통코드 : 위탁서 유형(BR) : 정비차용
        CommonCodeVO commonCodeBrVO = commonCodeService.selectCommonCodeByKey("PAR301", "BR");
        if(commonCodeBrVO != null){
            parGiTpList.add(commonCodeBrVO);
        }

        // 공통코드 : 부품출고요청상태
        List<CommonCodeVO> partsParReqStatCdList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", null, langCd);
        //RO상태
        List<CommonCodeVO> roStatusCdList = commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd);
        //브랜드(부품품종)
        List<CommonCodeVO> brandCdList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd);
        //SA 리스트.
        IssueReqTechManSearchVO issueReqTechManSearchVO = new IssueReqTechManSearchVO();
        issueReqTechManSearchVO.setsDlrCd(LoginUtil.getDlrCd());

        List<IssueReqTechManVO> issueReqTechManVOList = issueReqTechManService.selectTechManFnMasterByCondition(issueReqTechManSearchVO);


        List<IssueReqResvStatusVO> list = selectIssueReqResvStatusByCondition(searchVO);

        //공통코드 또는 코드 명칭  변환 처리.
        for(IssueReqResvStatusVO issueReqResvStatusVO : list){
            //parGiTp
            for(CommonCodeVO parGiTpVO : parGiTpList){
                if(parGiTpVO.getCmmCd().equals(issueReqResvStatusVO.getParGiTp())){

                    if(issueReqResvStatusVO.getBorrowDocNo() == null){
                        issueReqResvStatusVO.setParGiTp("["+issueReqResvStatusVO.getParGiTp()+"]"+parGiTpVO.getCmmCdNm());
                    }else{
                        issueReqResvStatusVO.setParGiTp("[BR]"+parGiTpVO.getCmmCdNm());
                    }

                    break;
                }
            }
            //roStatCd
            for(CommonCodeVO roStatusCdVO : roStatusCdList){
                if(roStatusCdVO.getCmmCd().equals(issueReqResvStatusVO.getRoStatCd())){
                    issueReqResvStatusVO.setRoStatCd("["+issueReqResvStatusVO.getRoStatCd()+"]"+roStatusCdVO.getCmmCdNm());
                    break;
                }
            }
            //parReqStatCd
            for(CommonCodeVO partsParReqStatCdVO : partsParReqStatCdList){
                if(partsParReqStatCdVO.getCmmCd().equals(issueReqResvStatusVO.getParReqStatCd())){
                    issueReqResvStatusVO.setParReqStatCd("["+issueReqResvStatusVO.getParReqStatCd()+"]"+partsParReqStatCdVO.getCmmCdNm());
                    break;
                }
            }
            //brandCd
            for(CommonCodeVO brandCdVO : brandCdList){
                if(brandCdVO.getCmmCd().equals(issueReqResvStatusVO.getBrandCd())){
                    issueReqResvStatusVO.setBrandCd(brandCdVO.getCmmCdNm());
                    break;
                }
            }
            //receiveId
            for(IssueReqTechManVO issueReqTechManVO : issueReqTechManVOList){
                if(issueReqTechManVO.getTecId().equals(issueReqResvStatusVO.getReceiveId())){
                    issueReqResvStatusVO.setReceiveId(issueReqTechManVO.getTecNm());
                    break;
                }
            }

            String regDtString = DateUtil.convertToString(issueReqResvStatusVO.getRegDt(), dateFormat+" HH:mm");
            issueReqResvStatusVO.setRegDtString(regDtString);
        }

        context.putVar("items", list);
    }

}
