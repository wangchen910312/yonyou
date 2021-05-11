package chn.bhmc.dms.sal.acc.service.impl;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.pcm.service.impl.InvcServiceImpl;
import chn.bhmc.dms.par.pcm.vo.InvcItemVO;
import chn.bhmc.dms.par.pcm.vo.InvcVO;
import chn.bhmc.dms.sal.acc.service.AccessoryItemInputService;
import chn.bhmc.dms.sal.acc.service.dao.AccessoryItemInputDAO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemInputSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AccessoryItemInputServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 2. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 9.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("accessoryItemInputService")
public class AccessoryItemInputServiceImpl extends InvcServiceImpl implements AccessoryItemInputService, JxlsSupport {

    @Resource(name="accessoryItemInputDAO")
    private AccessoryItemInputDAO accessoryItemInputDAO;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    private CommonCodeService commonCodeService;

    /**
     * 창고 관리 서비스
     */
//    @Resource(name="storageService")
//    private StorageService storageService;

    /**
     * {@inheritDoc}
     */
    @Override
    public List<InvcVO> selectAccessoryItemInputDocsByCondition(AccessoryItemInputSearchVO searchVO) throws Exception {
        return accessoryItemInputDAO.selectAccessoryItemInputDocsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectAccessoryItemInputDocsByConditionCnt(AccessoryItemInputSearchVO searchVO) throws Exception {
        return accessoryItemInputDAO.selectAccessoryItemInputDocsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<InvcItemVO> selectAccessoryItemInputItemsByCondition(AccessoryItemInputSearchVO searchVO)
            throws Exception {
        return accessoryItemInputDAO.selectAccessoryItemInputItemsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectAccessoryItemInputItemsByConditionCnt(AccessoryItemInputSearchVO searchVO) throws Exception {
        return accessoryItemInputDAO.selectAccessoryItemInputItemsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sListType = params.get("sListType").toString();

        AccessoryItemInputSearchVO searchVO = new AccessoryItemInputSearchVO();
        searchVO.setsLangCd(langCd);
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

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

        if("H".equals(sListType)){
            List<InvcVO> list = selectAccessoryItemInputDocsByCondition(searchVO);

            //공급업체유형
            CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
            commonCodeSearchVO.setsCmmGrpCd("PAR121");
            commonCodeSearchVO.setsRemark2("01"); //구매처
            commonCodeSearchVO.setsLangCd(langCd);
            List<CommonCodeVO> bpTpList = commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO);

            //공통코드 또는 코드 명칭  변환 처리.
            for(InvcVO invcVO : list){
                for(CommonCodeVO cmmCodeVO : bpTpList){
                    if(cmmCodeVO.getCmmCd().equals(invcVO.getBpTp())){
                        invcVO.setBpTp("["+invcVO.getBpTp()+"]"+cmmCodeVO.getCmmCdNm());
                        break;
                    }
                }
            }
            context.putVar("items", list);
        } else {
            List<InvcItemVO> list = selectAccessoryItemInputItemsByCondition(searchVO);

            //창고목록
//            StorageSearchVO storageSearchVO = new StorageSearchVO();
//            storageSearchVO.setsPltCd(LoginUtil.getPltCd());
//            storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
//            storageSearchVO.setsStrgeTp("20");  //창고유형(판매용품창고)
//            List<StorageVO> storageList = storageService.selectStoragesByCondition(storageSearchVO);

            context.putVar("items", list);
        }
    }

}
