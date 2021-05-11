package chn.bhmc.dms.sal.fim.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.cnt.service.ContractMntService;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.fim.service.FincInfoMngService;
import chn.bhmc.dms.sal.fim.service.dao.FincInfoMngDAO;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngIFVO;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngSearchVO;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngVO;

/**
 * <pre>
 * 금융정보관리 서비스
 * </pre>
 *
 * @ClassName   : FincInfoMngServiceImpl
 * @Description : 금융정보관리
 * @author
 * @since 2016. 6. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 09.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Service("fincInfoMngService")
public class FincInfoMngServiceImpl extends HService implements FincInfoMngService, JxlsSupport{

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 계약관리 서비스
     */
    @Resource(name="contractMntService")
    private ContractMntService contractMntService;

    
    /**
     * 금융 DAO 선언
     */
    @Resource(name="fincInfoMngDAO")
    FincInfoMngDAO fincInfoMngDAO;

    /**
     * 금융 소매판매 주문번호 생성 id gen
     */
    @Resource(name="salFincMngNoIdgenService")
    TableIdGenService salFincMngNoIdgenService;

    /**
     * 금융서비스 - 계약번호로 금융번호를 조회한다.
     */
    public List<FincInfoMngVO> selectFincNoSearch(FincInfoMngVO searchVO) throws Exception{
        return fincInfoMngDAO.selectFincNoSearch(searchVO);
    }

    /**
     * 금융서비스를 저장한다.
     */
    public int insertFincMng(FincInfoMngVO saveVO) throws Exception{

        /**
         * 금융서비스 (키생성)
         * FI + 년 + 14자리seq
         */
        String fincNo = salFincMngNoIdgenService.getNextStringId();
        saveVO.setFincNo(fincNo);

        return fincInfoMngDAO.insertFincMng(saveVO);
    }

    /**
     * 금융서비스 내역을 수정한다.
     */
    public int updateFincMng(FincInfoMngVO saveVO) throws Exception{
        return fincInfoMngDAO.updateFincMng(saveVO);
    }

    /**
     * 금융서비스 내역을 삭제한다.
     */
    public int deleteFincMng(FincInfoMngVO saveVO) throws Exception{
        return fincInfoMngDAO.deleteFincMng(saveVO);
    }

    /**
     * 금융서비스 내역 갯수를 조회한다.
     */
    public int selectFincInfoMngsByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception{
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return fincInfoMngDAO.selectFincInfoMngsByConditionCnt(searchVO);
    }

    /**
     * 금융서비스 내역을 조회한다.
     */
    public List<FincInfoMngVO> selectFincInfoMngsByCondition(FincInfoMngSearchVO searchVO) throws Exception{
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return fincInfoMngDAO.selectFincInfoMngsByCondition(searchVO);
    }

    /**
     * 금융서비스 저장한다.
     */
    public String updateFincInfo(FincInfoMngVO saveVO) throws Exception{
        saveVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
        fincInfoMngDAO.updateFincInfo(saveVO);
        
        // 계약에 저장한다.
        if(StringUtils.isNotBlank(saveVO.getContractNo())){
            ContractReVO cntVO = new ContractReVO();
            cntVO.setContractNo(saveVO.getContractNo());
            cntVO.setDlrCd(saveVO.getDlrCd());
            cntVO.setFincReqDt(saveVO.getFincReqDt());
            cntVO.setFincEndDt(saveVO.getFincEndDt());
            cntVO.setFincLoadRate(saveVO.getFincLoanRate());
            cntVO.setFincReqAmt(saveVO.getFincReqAmt());
            cntVO.setFincRpayPrid(saveVO.getFincRpayPrid());
            cntVO.setFincFeeAmt(saveVO.getFincLoanFeeAmt());
            cntVO.setFincBurdAmt(saveVO.getFincBurdAmt());
            cntVO.setFincCmpCd(saveVO.getFincCmpCd());
            cntVO.setFincItemCd(saveVO.getFincItemCd());
            contractMntService.contractFincApply(cntVO);
        }
        return saveVO.getFincNo();
    }

    /**
     * 금융서비스 차량정보를 저장한다.
     */
    public String updateVehicleFincMng(FincInfoMngVO saveVO) throws Exception{
        saveVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
        if(StringUtils.isBlank(saveVO.getDlrCd())){
            saveVO.setDlrCd(LoginUtil.getDlrCd());   
        }
        
        fincInfoMngDAO.updateVehicleFincMng(saveVO);
        return saveVO.getFincNo();
    }
    
    /**
     * 금융견적 팝업 내역 갯수를 조회한다.
     */
    public int selectFincInfoPopupsByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception{
        return fincInfoMngDAO.selectFincInfoPopupsByConditionCnt(searchVO);
    }

    /**
     * 금융견적 팝업 내역을 조회한다.
     */
    public List<FincInfoMngIFVO> selectFincInfoPopupsByCondition(FincInfoMngSearchVO searchVO) throws Exception{
        return fincInfoMngDAO.selectFincInfoPopupsByCondition(searchVO);
    }

    /**
     * 엑셀다운로드
     **/
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        FincInfoMngSearchVO searchVO = new FincInfoMngSearchVO();
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        
        if (StringUtils.isNotEmpty((String)params.get("sStartFincReqDt"))) {
            searchVO.setsStartFincReqDt(DateUtil.convertToDate((String)params.get("sStartFincReqDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sEndFincReqDt"))) {
            searchVO.setsEndFincReqDt(DateUtil.convertToDate((String)params.get("sEndFincReqDt")));
        }
        
        List<FincInfoMngVO> list = selectFincInfoMngsByCondition(searchVO);

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        //금융신청상태 : SAL042
        HashMap<String, String> fincStatMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL042", null, langCd)){
            fincStatMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        //금융사 : SAL055
        HashMap<String, String> fincCmpMap = new HashMap<String, String>();
        fincCmpMap.put("BHAF", "北现金融");
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL055", null, langCd)){
            fincCmpMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }

        for(FincInfoMngVO vo : list){
            vo.setFincStatCd(fincStatMap.get(vo.getFincStatCd()));  //신청상태
            vo.setFincCmpCd(fincCmpMap.get(vo.getFincCmpCd()));    //금융사/은행
        }
        
        context.putVar("items", list);
    }
    
    
    /**
     * CRM : 고객의 금융 정보 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCustFincInfosByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception{
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        if(StringUtils.isEmpty(searchVO.getsCustCd())){
            // 고객을 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())});
        }
        return fincInfoMngDAO.selectCustFincInfosByConditionCnt(searchVO);
    }
    public List<FincInfoMngVO> selectCustFincInfosByCondition(FincInfoMngSearchVO searchVO) throws Exception{
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        if(StringUtils.isEmpty(searchVO.getsCustCd())){
            // 고객을 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())});
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return fincInfoMngDAO.selectCustFincInfosByCondition(searchVO);
    }

}
