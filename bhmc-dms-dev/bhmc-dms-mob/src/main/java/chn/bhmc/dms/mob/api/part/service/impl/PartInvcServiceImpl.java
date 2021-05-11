package chn.bhmc.dms.mob.api.part.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.part.dao.PartInvcDAO;
import chn.bhmc.dms.mob.api.part.service.PartCommonCodeService;
import chn.bhmc.dms.mob.api.part.service.PartInvcService;
import chn.bhmc.dms.mob.api.part.vo.CommonCodeVO;
import chn.bhmc.dms.mob.api.part.vo.InvcItemVO;
import chn.bhmc.dms.mob.api.part.vo.InvcSearchVO;
import chn.bhmc.dms.mob.api.part.vo.InvcVO;


/**
 * 송장 구현 클래스
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
@Service("PartInvcService")
public class PartInvcServiceImpl extends HService implements PartInvcService, JxlsSupport {

    @Resource(name="PartInvcDAO")
    private PartInvcDAO PartInvcDAO;
    
  
    /**
     * 구매요청 서비스
     */
    @Resource(name="PartCommonCodeService")
    PartCommonCodeService PartCommonCodeService;


    @SuppressWarnings("unused")
	private static final Logger LOGGER = LoggerFactory.getLogger(PartInvcServiceImpl.class);


    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdesByCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<InvcVO> selectInvcsByCondition(InvcSearchVO searchVO) throws Exception {
        return PartInvcDAO.selectInvcsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdsByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectInvcsByConditionCnt(InvcSearchVO searchVO) throws Exception {
        return PartInvcDAO.selectInvcsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectInvcByKey(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public InvcVO selectInvcByKey(InvcVO invcVO) throws Exception {

        return PartInvcDAO.selectInvcByKey(invcVO);
    }
    
    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceivesByConditionCnt(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public int selectReceivesByConditionCnt(InvcSearchVO searchVO) throws Exception {

        return PartInvcDAO.selectReceivesByConditionCnt(searchVO);
    }
    
    //부품별 입고현황 화면 조회 목록 총 갯수
    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveCnfmListByConditionCnt(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public int selectReceiveCnfmListByConditionCnt(InvcSearchVO searchVO) throws Exception {
        return PartInvcDAO.selectReceiveCnfmListByConditionCnt(searchVO);
    }
    
    
    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceivesByCondition(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcVO> selectReceivesByCondition(InvcSearchVO searchVO) throws Exception {

        return PartInvcDAO.selectReceivesByCondition(searchVO);
    }
    
    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceivesByCondition(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcVO> selectReceivesSumByCondition(InvcSearchVO searchVO) throws Exception {

        return PartInvcDAO.selectReceivesSumByCondition(searchVO);
    }

    //부품별 입고현황 화면 조회
    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveCnfmListByCondition(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcItemVO> selectReceiveCnfmListByCondition(InvcSearchVO searchVO) throws Exception {
        return PartInvcDAO.selectReceiveCnfmListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveItemByConditionCnt(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public int selectReceiveItemByConditionCnt(InvcSearchVO searchVO) throws Exception {

        return PartInvcDAO.selectReceiveItemByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveItemByCondition(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcItemVO> selectReceiveItemByCondition(InvcSearchVO searchVO) throws Exception {

        return PartInvcDAO.selectReceiveItemByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveByMobile(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcVO> selectReceiveByMobile(InvcSearchVO invcSearchVO) throws Exception {

        return PartInvcDAO.selectReceiveByMobile(invcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveByMobileCnt(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public int selectReceiveByMobileCnt(InvcSearchVO invcSearchVO) throws Exception {

        return PartInvcDAO.selectReceiveByMobileCnt(invcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveItemByInvcItemBarcode(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public InvcItemVO selectReceiveItemByInvcItemBarcode(InvcSearchVO searchVO) throws Exception {

        return PartInvcDAO.selectReceiveItemByInvcItemBarcode(searchVO);
    }
    
    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdItemExcelUploadByKey(chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO)
     */
    @Override
    public List<InvcItemVO> selectInvcItemByKey(InvcSearchVO searchVO) throws Exception {

        return PartInvcDAO.selectInvcItemByKey(searchVO);
    }
    


    @Override
	public List<InvcItemVO> selectReceiveCnfmItemByInvcKey(InvcSearchVO searchVO) {
		// TODO Auto-generated method stub
		return PartInvcDAO.selectReceiveCnfmItemByInvcKey(searchVO);
	}

	/*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        InvcSearchVO searchVO = new InvcSearchVO();

        List<String> sBpCdLst = new ArrayList<String>();
        String sBpCd;
        String[] arrayBpCdStr;

        String sListType = params.get("sListType").toString();

        searchVO.setsLangCd(langCd);
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        if (StringUtils.isNotEmpty((String)params.get("sBpCdList"))) {
            sBpCd = (String)params.get("sBpCdList");
            arrayBpCdStr = sBpCd.split(",");
            sBpCdLst = Arrays.asList(arrayBpCdStr);
            searchVO.setsBpCdList(sBpCdLst);
        }

        if(!StringUtils.isBlank(params.get("sInvcGrDtFr").toString())){
            String sInvcGrDtFr = params.get("sInvcGrDtFr").toString();
            Date dInvcGrDtFr = Date.valueOf(sInvcGrDtFr);
            searchVO.setsInvcGrDtFr(dInvcGrDtFr);
        }

        if(!StringUtils.isBlank(params.get("sInvcGrDtTo").toString())){
            String sInvcGrDtTo = params.get("sInvcGrDtTo").toString();
            Date dInvcGrDtTo = Date.valueOf(sInvcGrDtTo);
            searchVO.setsInvcGrDtTo(dInvcGrDtTo);
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        if(StringUtil.nullConvert(sListType).equals("H")){
            List<InvcVO> list = selectReceivesByCondition(searchVO);

            List<CommonCodeVO> bpTpList = PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR121", null, langCd);
            List<CommonCodeVO> invcTpList = PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR211", null, langCd);

            //공통코드 또는 코드 명칭  변환 처리.
            for(InvcVO invcVO : list){
                for(CommonCodeVO cmmCodeVO : bpTpList){
                    if(cmmCodeVO.getCmmCd().equals(invcVO.getBpTp())){
                        invcVO.setBpTp("["+invcVO.getBpTp()+"]"+cmmCodeVO.getCmmCdNm());
                        break;
                    }
                }

                for(CommonCodeVO cmmCodeVO : invcTpList){
                    if(cmmCodeVO.getCmmCd().equals(invcVO.getInvcTp())){
                        invcVO.setInvcTp("["+invcVO.getInvcTp()+"]"+cmmCodeVO.getCmmCdNm());
                        break;
                    }
                }
            }
            context.putVar("items", list);
        } else {
            List<InvcItemVO> list = selectReceiveCnfmListByCondition(searchVO);
            context.putVar("items", list);
        }
    }
}
