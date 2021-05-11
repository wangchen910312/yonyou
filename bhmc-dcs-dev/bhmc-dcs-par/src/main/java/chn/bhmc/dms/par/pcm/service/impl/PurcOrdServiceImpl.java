package chn.bhmc.dms.par.pcm.service.impl;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;
import chn.bhmc.dms.cmm.ath.service.dao.UserDAO;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.pcm.service.PurcOrdService;
import chn.bhmc.dms.par.pcm.service.dao.PurcOrdDAO;
import chn.bhmc.dms.par.pcm.vo.DBPartsAccSupVO;
import chn.bhmc.dms.par.pcm.vo.InvcStatisticsVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdVO;

/**
 * 구매오더 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ju Won Lee      최초 생성
 * </pre>
 */
@Service("purcOrdService")
public class PurcOrdServiceImpl extends HService implements PurcOrdService, JxlsSupport {

    @Resource(name="purcOrdDAO")
    private PurcOrdDAO purcOrdDAO;
   
    @Resource(name="userDAO") 
    private UserDAO userDAO;
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    @Resource(name="dataSourceMessageSource")
	ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;
    
    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdesByCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdVO> selectPurcOrdsByCondition(PurcOrdSearchVO searchVO) throws Exception {
        return purcOrdDAO.selectPurcOrdsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdsByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectPurcOrdsByConditionCnt(PurcOrdSearchVO searchVO) throws Exception {
        return purcOrdDAO.selectPurcOrdsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdStatusByCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdItemVO> selectPurcOrdStatusByCondition(PurcOrdSearchVO searchVO) throws Exception {

        return purcOrdDAO.selectPurcOrdStatusByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdStatusByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectPurcOrdStatusByConditionCnt(PurcOrdSearchVO searchVO) throws Exception {

        return purcOrdDAO.selectPurcOrdStatusByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdStatusDetailByCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdItemVO> selectPurcOrdStatusDetailByCondition(PurcOrdSearchVO searchVO) throws Exception {

        return purcOrdDAO.selectPurcOrdStatusDetailByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdStatusDetailByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectPurcOrdStatusDetailByConditionCnt(PurcOrdSearchVO searchVO) throws Exception {

        return purcOrdDAO.selectPurcOrdStatusDetailByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        PurcOrdSearchVO searchVO = new PurcOrdSearchVO();
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName", "selectTabId");
        if (!StringUtils.equals("null", (String)params.get("sPurcRegDtFr")) && !StringUtil.isEmpty((String)params.get("sPurcRegDtFr"))) {
            searchVO.setsPurcRegDtFr(DateUtil.convertToDate((String)params.get("sPurcRegDtFr")));
        }
        if (!StringUtils.equals("null", (String)params.get("sPurcRegDtTo")) && !StringUtil.isEmpty((String)params.get("sPurcRegDtTo"))) {
            searchVO.setsPurcRegDtTo(DateUtil.convertToDate((String)params.get("sPurcRegDtTo")));
        }
        if (!StringUtils.equals("null", (String)params.get("sConfirmFr")) && !StringUtil.isEmpty((String)params.get("sConfirmFr"))) {
            searchVO.setsConfirmFr(DateUtil.convertToDate((String)params.get("sConfirmFr")));
        }
        if (!StringUtils.equals("null", (String)params.get("sConfirmTo")) &&!StringUtil.isEmpty((String)params.get("sConfirmTo"))) {
            searchVO.setsConfirmTo(DateUtil.convertToDate((String)params.get("sConfirmTo")));
        }
        if (!StringUtil.isEmpty((String)params.get("sPurcOrdStatLst"))) {
            String[] sPurcOrdStatArry = ((String)params.get("sPurcOrdStatLst")).split(",");
            searchVO.setsPurcOrdStatLst(Arrays.asList(sPurcOrdStatArry));
        }
        searchVO.setsQuestionNo((String)params.get("sQuestionNo"));
        searchVO.setsDlrCd((String)params.get("sDlrCd"));
        searchVO.setsDlrNm((String)params.get("sDlrNm"));
        searchVO.setsBmpOrdNo((String)params.get("sBmpOrdNo"));
        searchVO.setsItemCd((String)params.get("sItemCd"));
        searchVO.setsItemNm((String)params.get("sItemNm"));
        searchVO.setsBpCd((String)params.get("sBpCd"));
        searchVO.setsBpNm((String)params.get("sBpNm"));
        searchVO.setsBmpCd((String)params.get("sBmpCd"));
        
        if(StringUtils.defaultString((String)params.get("selectTabId"), "").equals("DT")){
            List<PurcOrdItemVO> list = selectPurcOrdStatusDetailByCondition(searchVO);
            for(PurcOrdItemVO purcOrdItemVO : list){
                purcOrdItemVO.setPurcRegDt(purcOrdItemVO.getPurcRegDt().substring(0, 4)+"-"+purcOrdItemVO.getPurcRegDt().substring(4, 6)+"-"+purcOrdItemVO.getPurcRegDt().substring(6, 8));
                purcOrdItemVO.setConfirmDt(purcOrdItemVO.getConfirmDt().substring(0, 4)+"-"+purcOrdItemVO.getConfirmDt().substring(4, 6)+"-"+purcOrdItemVO.getConfirmDt().substring(6, 8));
                purcOrdItemVO.setPurcOrdTp(commonCodeService.selectCommonCodeName("PAR203", purcOrdItemVO.getPurcOrdTp(), langCd));
                purcOrdItemVO.setDlDistCd(commonCodeService.selectCommonCodeName("PAR214", purcOrdItemVO.getDlDistCd(), langCd));
                purcOrdItemVO.setEditCd(commonCodeService.selectCommonCodeName("PAR207", purcOrdItemVO.getEditCd(), langCd));
                purcOrdItemVO.setTrsfTp(commonCodeService.selectCommonCodeName("PAR205", purcOrdItemVO.getTrsfTp(), langCd));
                purcOrdItemVO.setPurcPgssCd(commonCodeService.selectCommonCodeName("PAR210", purcOrdItemVO.getPurcPgssCd(), langCd));
            }
            context.putVar("items", list);
        }else if(StringUtils.defaultString((String)params.get("selectTabId"), "").equals("HD")){
            List<PurcOrdVO> list = selectPurcOrdsByCondition(searchVO);
            for(PurcOrdVO purcOrdVO : list){
                purcOrdVO.setPurcOrdStatNm(commonCodeService.selectCommonCodeName("PAR204", purcOrdVO.getPurcOrdStatCd(), langCd));
                purcOrdVO.setPurcOrdTp(commonCodeService.selectCommonCodeName("PAR203", purcOrdVO.getPurcOrdTp(), langCd));
                String year = purcOrdVO.getPurcRegDt().substring(0, 4);
                String month = purcOrdVO.getPurcRegDt().substring(4, 6);
                String day = purcOrdVO.getPurcRegDt().substring(6, 8);
                purcOrdVO.setPurcRegDt(year+"-"+month+"-"+day);
            }
            context.putVar("items", list);
        }else if(StringUtils.defaultString((String)params.get("selectTabId"), "").equals("BOINFO")){
        	List<PurcOrdItemVO> list = purcOrdDAO.selectOrdBoInfoExcelByCondition(searchVO);
        	context.putVar("items", list);  
        }else if(StringUtils.defaultString((String)params.get("selectTabId"), "").equals("PS")){
        	searchVO.setsReplyStatus("1");
        	List<PurcOrdItemVO> list = purcOrdDAO.selectPurcOrdReplyExcelByCondition(searchVO);
       	    context.putVar("items", list);  
       }else{
            List<PurcOrdItemVO> list = selectPurcOrdStatusByCondition(searchVO);
            for(PurcOrdItemVO purcOrdItemVO : list){
                purcOrdItemVO.setPurcRegDt(purcOrdItemVO.getPurcRegDt().substring(0, 4)+"-"+purcOrdItemVO.getPurcRegDt().substring(4, 6)+"-"+purcOrdItemVO.getPurcRegDt().substring(6, 8));
                purcOrdItemVO.setConfirmDt(purcOrdItemVO.getConfirmDt().substring(0, 4)+"-"+purcOrdItemVO.getConfirmDt().substring(4, 6)+"-"+purcOrdItemVO.getConfirmDt().substring(6, 8));
                purcOrdItemVO.setArrvDt(purcOrdItemVO.getArrvDt().substring(0, 4)+"-"+purcOrdItemVO.getArrvDt().substring(4, 6)+"-"+purcOrdItemVO.getArrvDt().substring(6, 8));
                purcOrdItemVO.setPurcItemStatCd(commonCodeService.selectCommonCodeName("PAR204", purcOrdItemVO.getPurcItemStatCd(), langCd));
            }
            context.putVar("items", list);
        }
    }
    
	/**
	 * 事业部汇总
	 */
	@Override
	public List<InvcStatisticsVO> selectPurcOrdStatisticsByCondition(
			PurcOrdSearchVO searchVO) throws Exception {
		return purcOrdDAO.selectPurcOrdStatisticsByCondition(searchVO);
	}

	/**
	 * 经销汇总
	 */
	@Override
	public List<InvcStatisticsVO> selectPurcOrdStatisticsByDlr(
			PurcOrdSearchVO searchVO) throws Exception {
		return purcOrdDAO.selectPurcOrdStatisticsByDlr(searchVO);
	}
    
	/**
	 * 配件对应供应商写入 JiaMing 2020-11-18
	 */
	@Override
	public void insertPartsAccSupInfoBatchUpload(List<DBPartsAccSupVO> list) throws Exception {
		
		String userId = LoginUtil.getUserId();
		for(DBPartsAccSupVO dbPartsAccSupVO:list){
			DBPartsAccSupVO obj = selectDBPartsAccSupVOInfo(dbPartsAccSupVO.getItemCd());
			if(obj == null){
				dbPartsAccSupVO.setRegUsrId(userId);
			    insertDBPartsAccSup(dbPartsAccSupVO);
			}else{
				dbPartsAccSupVO.setUpdtUsrId(userId);
				updateDBPartsAccSup(dbPartsAccSupVO);
			}
		}
	}

	@Override
	public int insertDBPartsAccSup(DBPartsAccSupVO dbPartsAccSupVO) throws Exception {
		DBPartsAccSupVO obj = selectDBPartsAccSupVOInfo(dbPartsAccSupVO.getItemCd());
		if(obj != null) {
            throw processException("global.err.duplicate");
        }
		 dataSourceMessageSource.clearCache();
		return purcOrdDAO.insertDBPartsAccSup(dbPartsAccSupVO);
	}

	@Override
	public int updateDBPartsAccSup(DBPartsAccSupVO dbPartsAccSupVO) throws Exception {
		dataSourceMessageSource.clearCache();
		return purcOrdDAO.updateDBPartsAccSup(dbPartsAccSupVO);
	}

	@Override
	public DBPartsAccSupVO selectDBPartsAccSupVOInfo(String itemCd) throws Exception {
		return purcOrdDAO.selectDBPartsAccSupVOInfo(itemCd);
	}

	/**
     * @author liuxueying
     * 区分登陆人查询负责的经销商的配件待货信息
     */
	@Override
	public int selectPurcOrdStatusForMeCnt(PurcOrdSearchVO searchVO)
			throws Exception {
		//区分登录人
		String usrId = LoginUtil.getUserId();
		UserSearchVO userSearchVO = new UserSearchVO();
		userSearchVO.setsUsrId(usrId);
		userSearchVO.setsTskCd("08");
		List<UserVO> users = userDAO.selectUsersByTskCdAndUsrId(userSearchVO);
		if(users != null && users.size() > 0){//科长
			searchVO.setsUsrTp("1");
		}else{
			userSearchVO.setsTskCd("09");
			users = userDAO.selectUsersByTskCdAndUsrId(userSearchVO);
			if(users != null && users.size() > 0){//职员
				searchVO.setsUsrTp("2");
			}
		}
		searchVO.setsCurrentUsrId(usrId);
	  return purcOrdDAO.selectPurcOrdBoByConditionCnt(searchVO);
	}

	/**
	 * @author liuxueying
	 * 区分登陆人查询负责的经销商的配件待货信息
	 */
	@Override
	public List<PurcOrdItemVO> selectPurcOrdStatusForMe(PurcOrdSearchVO searchVO)
			throws Exception {
		String usrId = LoginUtil.getUserId();
		UserSearchVO userSearchVO = new UserSearchVO();
		userSearchVO.setsUsrId(usrId);
		userSearchVO.setsTskCd("08");
		List<UserVO> users = userDAO.selectUsersByTskCdAndUsrId(userSearchVO);
		if(users != null && users.size() > 0){//科长
			searchVO.setsUsrTp("1");
		}else{
			userSearchVO.setsTskCd("09");
			users = userDAO.selectUsersByTskCdAndUsrId(userSearchVO);
			if(users != null && users.size() > 0){//职员
				searchVO.setsUsrTp("2");
			}
		}
		searchVO.setsCurrentUsrId(usrId);
		return purcOrdDAO.selectPurcOrdBoByCondition(searchVO);
	}

	@Override
	public List<PurcOrdItemVO> selectOrdBoInfoByCondition(PurcOrdSearchVO searchVO) throws Exception {
		return purcOrdDAO.selectOrdBoInfoByCondition(searchVO);
	}

	@Override
	public int selectOrdBoInfoByConditionCnt(PurcOrdSearchVO searchVO) throws Exception {
		return purcOrdDAO.selectOrdBoInfoByConditionCnt(searchVO);
	}

	@Override
	public List<PurcOrdItemVO> selectPurcOrdReplyByCondition(
			PurcOrdSearchVO searchVO) throws Exception {
		return purcOrdDAO.selectPurcOrdReplyByCondition(searchVO);
	}

	@Override
	public int selectPurcOrdReplyByConditionCnt(PurcOrdSearchVO searchVO)
			throws Exception {
		return purcOrdDAO.selectPurcOrdReplyByConditionCnt(searchVO);
	}


}
