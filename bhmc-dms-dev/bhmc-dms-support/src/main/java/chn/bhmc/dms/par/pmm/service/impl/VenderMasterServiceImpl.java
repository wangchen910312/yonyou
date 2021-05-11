package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.service.VenderTelService;
import chn.bhmc.dms.par.pmm.service.dao.VenderMasterDAO;
import chn.bhmc.dms.par.pmm.vo.VenderCustomerMasterExcelVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterExcelVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterSaveVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
import chn.bhmc.dms.par.pmm.vo.VenderTelSearchVO;
import chn.bhmc.dms.par.pmm.vo.VenderTelVO;

/**
 * 거래처 관리 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 11.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("venderMasterService")
public class VenderMasterServiceImpl extends HService implements VenderMasterService, JxlsSupport {

    @Resource(name="venderMasterDAO")
    private VenderMasterDAO venderMasterDAO;

    @Resource(name="venderTelService")
    VenderTelService venderTelService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#insertVenderMaster(chn.bhmc.dms.par.pmm.vo.VenderMasterVO)
     */
    @Override
    public int insertVenderMaster(VenderMasterSaveVO venderMasterSaveVO) throws Exception {

        VenderMasterVO venderMasterVO = venderMasterSaveVO.getVenderMasterVO();
        BaseSaveVO<VenderTelVO> venderTelSaveVO  = venderMasterSaveVO.getVenderTelSaveVO();

        String[] lblList = new String[2];
        VenderMasterSearchVO searchVO = new VenderMasterSearchVO();

        if("01".equals(venderMasterVO.getBpTp())){//거래처 유형 BHMC일 때
            searchVO.setsBpTp(venderMasterVO.getBpTp());

            if(venderMasterDAO.selectVenderMastersByConditionCnt(searchVO) > 0){
                lblList[0] = messageSource.getMessage("par.lbl.bpTp", null, LocaleContextHolder.getLocale());   // 거래처유형
                lblList[1] = messageSource.getMessage("par.lbl.bhmc", null, LocaleContextHolder.getLocale());   // BHMC
                // 거래처유형 BHMC은 하나만 등록 가능합니다.
                throw processException("global.info.itemOnlyMsg", lblList);
            }
        }

        // 거래처코드 유무 체크.
        searchVO.setsBpCd(venderMasterVO.getBpCd());
        if(venderMasterDAO.selectVenderMastersByConditionCnt(searchVO) > 0){
            lblList = new String[1];
            lblList[0] = messageSource.getMessage("par.lbl.bpCd", null, LocaleContextHolder.getLocale());    // 거래처코드
            // 이미 거래처코드 사용 중입니다.
            throw processException("par.info.itemUseMsg", lblList);
        }

        venderMasterVO.setRegUsrId(LoginUtil.getUserId());

        // vendetTel delete list
        for(VenderTelVO venderTelVO : venderTelSaveVO.getDeleteList()){
            venderTelVO.setDlrCd(LoginUtil.getDlrCd());
            venderTelVO.setBpCd(venderMasterVO.getBpCd());
            //vender telephone delete
            venderTelService.deleteVenderTel(venderTelVO);
        }

        // vendetTel insert list
        for(VenderTelVO venderTelVO : venderTelSaveVO.getInsertList()){
            venderTelVO.setDlrCd(LoginUtil.getDlrCd());
            venderTelVO.setBpCd(venderMasterVO.getBpCd());
            venderTelVO.setRegUsrId(LoginUtil.getUserId());
            //vender telephone insert
            venderTelService.insertVenderTel(venderTelVO);
        }

        // vendetTel update list
        for(VenderTelVO venderTelVO : venderTelSaveVO.getUpdateList()){
            venderTelVO.setDlrCd(LoginUtil.getDlrCd());
            venderTelVO.setBpCd(venderMasterVO.getBpCd());
            venderTelVO.setUpdtUsrId(LoginUtil.getUserId());

            VenderTelSearchVO vendetTelSearchVO = new VenderTelSearchVO();
            vendetTelSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            vendetTelSearchVO.setsBpCd(venderMasterVO.getBpCd());
            vendetTelSearchVO.setsLineNo(venderTelVO.getLineNo());

            if(venderTelService.selectVenderTelsByConditionCnt(vendetTelSearchVO) > 0){
                //vender telephone update
                venderTelService.updateVenderTel(venderTelVO);
            }else{
                //vender telephone insert
                venderTelService.insertVenderTel(venderTelVO);
            }
        }
        // vender Master VO insert
        return venderMasterDAO.insertVenderMaster(venderMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#updateVenderMaster(chn.bhmc.dms.par.pmm.vo.VenderMasterVO)
     */
    @Override
    public int updateVenderMaster(VenderMasterSaveVO venderMasterSaveVO) throws Exception {

        VenderMasterVO venderMasterVO = venderMasterSaveVO.getVenderMasterVO();
        BaseSaveVO<VenderTelVO> venderTelSaveVO  = venderMasterSaveVO.getVenderTelSaveVO();

        venderMasterVO.setUpdtUsrId(LoginUtil.getUserId());

        // vendetTel delete list
        for(VenderTelVO venderTelVO : venderTelSaveVO.getDeleteList()){
            venderTelVO.setDlrCd(LoginUtil.getDlrCd());
            venderTelVO.setBpCd(venderMasterVO.getBpCd());
            //vender telephone delete
            venderTelService.deleteVenderTel(venderTelVO);
        }

        // vendetTel insert list
        for(VenderTelVO venderTelVO : venderTelSaveVO.getInsertList()){
            venderTelVO.setDlrCd(LoginUtil.getDlrCd());
            venderTelVO.setBpCd(venderMasterVO.getBpCd());
            venderTelVO.setRegUsrId(LoginUtil.getUserId());
            //vender telephone insert
            venderTelService.insertVenderTel(venderTelVO);
        }

        // vendetTel update list
        for(VenderTelVO venderTelVO : venderTelSaveVO.getUpdateList()){
            venderTelVO.setDlrCd(LoginUtil.getDlrCd());
            venderTelVO.setBpCd(venderMasterVO.getBpCd());
            venderTelVO.setUpdtUsrId(LoginUtil.getUserId());

            VenderTelSearchVO vendetTelSearchVO = new VenderTelSearchVO();
            vendetTelSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            vendetTelSearchVO.setsBpCd(venderMasterVO.getBpCd());
            vendetTelSearchVO.setsLineNo(venderTelVO.getLineNo());

            if(venderTelService.selectVenderTelsByConditionCnt(vendetTelSearchVO) > 0){
                if("N".equals(venderTelVO.getDbYn())){
                    //vender telephone insert
                    venderTelService.insertVenderTel(venderTelVO);
                }else{
                    //vender telephone update
                    venderTelService.updateVenderTel(venderTelVO);
                }
            }else{
                //vender telephone insert
                venderTelService.insertVenderTel(venderTelVO);
            }
        }
        // vender Master VO update
        return venderMasterDAO.updateVenderMaster(venderMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#deleteVenderMaster(chn.bhmc.dms.par.pmm.vo.VenderMasterVO)
     */
    @Override
    public int deleteVenderMaster(VenderMasterVO venderMasterVO) throws Exception {
        // UPDATE END_YN : Y
        return venderMasterDAO.deleteVenderMaster(venderMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#selectVenderMasterByKey(java.lang.String, java.lang.String)
     */
    @Override
    public VenderMasterVO selectVenderMasterByKey(String dlrCd, String bpCd) throws Exception {
        return venderMasterDAO.selectVenderMasterByKey(dlrCd, bpCd);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#selectVenderMasterBpByKey(java.lang.String, java.lang.String)
     */
    @Override
    public VenderMasterVO selectVenderMasterBpTpByKey(String dlrCd, String bpTp) throws Exception {
        return venderMasterDAO.selectVenderMasterBpTpByKey(dlrCd, bpTp);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#selectBHMCVenderMaster(java.lang.String)
     */
    @Override
    public VenderMasterVO selectBHMCVenderMaster(String dlrCd) throws Exception {
        return venderMasterDAO.selectBHMCVenderMaster(dlrCd);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#selectVenderMastersByCondition(chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO)
     */
    @Override
    public List<VenderMasterVO> selectVenderMastersByCondition(VenderMasterSearchVO searchVO) throws Exception {
        return venderMasterDAO.selectVenderMastersByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#selectVenderMastersByConditionCnt(chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO)
     */
    @Override
    public int selectVenderMastersByConditionCnt(VenderMasterSearchVO searchVO) throws Exception {
        return venderMasterDAO.selectVenderMastersByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#selectVenderMastersByCondition(chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO)
     */
    @Override
    public List<VenderMasterVO> selectAllVenderMastersByCondition(VenderMasterSearchVO searchVO) throws Exception {
        return venderMasterDAO.selectAllVenderMastersByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#selectVenderMastersByConditionCnt(chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO)
     */
    @Override
    public int selectAllVenderMastersByConditionCnt(VenderMasterSearchVO searchVO) throws Exception {
        return venderMasterDAO.selectAllVenderMastersByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        VenderMasterSearchVO searchVO = new VenderMasterSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsBpTp(params.get("sBpTp").toString());
        searchVO.setsBpCd(params.get("sBpCd").toString());
        searchVO.setsBpNm(params.get("sBpNm").toString());
        searchVO.setsBpDstinCd(params.get("sBpDstinCd").toString());

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        if("Y".equals(searchVO.getsBpDstinCd())){
            List<VenderMasterExcelVO> list = selectVenderMastersExcelDownByCondition(searchVO);
            context.putVar("items", list);
        }else{

            CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
            commonCodeSearchVO.setsCmmGrpCd("PAR121");
            commonCodeSearchVO.setsRemark2("02");//판매처

            List<CommonCodeVO> bpTpList = commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO);

            List<VenderCustomerMasterExcelVO> list = selectVenderCustomerMastersExcelDownByCondition(searchVO);

            //공통코드 또는 코드 명칭  변환 처리.
            for(VenderCustomerMasterExcelVO venderCustomerMasterExcelVO : list){
                //bpTp
                for(CommonCodeVO bpTpVO : bpTpList){
                    if(StringUtil.nullConvert(venderCustomerMasterExcelVO.getBpTp()).equals(bpTpVO.getCmmCd())){
                        venderCustomerMasterExcelVO.setBpTp(bpTpVO.getCmmCdNm());
                        break;
                    }
                }
            }

            context.putVar("items", list);
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#selectVenderMastersExcelDownByCondition(chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO)
     */
    @Override
    public List<VenderMasterExcelVO> selectVenderMastersExcelDownByCondition(VenderMasterSearchVO searchVO)
            throws Exception {
        return venderMasterDAO.selectVenderMastersExcelDownByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#selectVenderCustomerMastersExcelDownByCondition(chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO)
     */
    @Override
    public List<VenderCustomerMasterExcelVO> selectVenderCustomerMastersExcelDownByCondition(
            VenderMasterSearchVO searchVO) throws Exception {
        return venderMasterDAO.selectVenderCustomerMastersExcelDownByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#multiVenderMastersExcelDown(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiVenderMastersExcelDown(BaseSaveVO<VenderMasterExcelVO> obj) throws Exception {

        //업체관리 Update Data
        for(VenderMasterExcelVO venderMasterExcelVO : obj.getUpdateList()){

            VenderMasterSearchVO searchVO = new VenderMasterSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsBpDstinCd("Y");
            searchVO.setsBpCd(venderMasterExcelVO.getBpCd());

            venderMasterExcelVO.setDlrCd(LoginUtil.getDlrCd());
            venderMasterExcelVO.setBpDstinCd("Y");
            venderMasterExcelVO.setRegUsrId(LoginUtil.getDlrCd());
            venderMasterExcelVO.setUpdtUsrId(LoginUtil.getDlrCd());

            VenderTelVO venderTelVO = new VenderTelVO();
            venderTelVO.setDlrCd(LoginUtil.getDlrCd());
            venderTelVO.setPrsnNm(venderMasterExcelVO.getPrsnNm());
            venderTelVO.setPrsnTelNo(venderMasterExcelVO.getPrsnTelNo());
            venderTelVO.setPrsnHpNo(venderMasterExcelVO.getPrsnHpNo());
            venderTelVO.setLineNo(1);

            if(venderMasterDAO.selectAllVenderMastersByConditionCnt(searchVO) > 0 && "U".equals(venderMasterExcelVO.getInsertUpdateTp())){

                venderTelVO.setBpCd(venderMasterExcelVO.getBpCd());

                venderMasterDAO.updateVenderMasterExcelDown(venderMasterExcelVO);
                venderTelService.updateVenderTel(venderTelVO);
            }else{

                VenderMasterVO venderMasterVO = venderMasterDAO.selectVenderMasterBpTpByKey(LoginUtil.getDlrCd(), venderMasterExcelVO.getBpTp());

                venderMasterExcelVO.setBpCd(venderMasterVO.getBpCd());
                venderTelVO.setBpCd(venderMasterVO.getBpCd());

                venderMasterDAO.insertVenderMasterExcelDown(venderMasterExcelVO);
                venderTelService.insertVenderTel(venderTelVO);

            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#multiVenderCustomerMastersExcelDown(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiVenderCustomerMastersExcelDown(BaseSaveVO<VenderMasterExcelVO> obj)
            throws Exception {
        //업체관리 Update Data
        for(VenderMasterExcelVO venderMasterExcelVO : obj.getUpdateList()){

            VenderMasterSearchVO searchVO = new VenderMasterSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsBpDstinCd("N");
            searchVO.setsBpCd(venderMasterExcelVO.getBpCd());

            venderMasterExcelVO.setDlrCd(LoginUtil.getDlrCd());
            venderMasterExcelVO.setBpDstinCd("N");
            venderMasterExcelVO.setRegUsrId(LoginUtil.getDlrCd());
            venderMasterExcelVO.setUpdtUsrId(LoginUtil.getDlrCd());

            VenderTelVO venderTelVO = new VenderTelVO();
            venderTelVO.setDlrCd(LoginUtil.getDlrCd());
            venderTelVO.setPrsnNm(venderMasterExcelVO.getPrsnNm());
            venderTelVO.setPrsnTelNo(venderMasterExcelVO.getPrsnTelNo());
            venderTelVO.setPrsnHpNo(venderMasterExcelVO.getPrsnHpNo());
            venderTelVO.setLineNo(1);

            if(venderMasterDAO.selectAllVenderMastersByConditionCnt(searchVO) > 0 && "U".equals(venderMasterExcelVO.getInsertUpdateTp())){

                venderTelVO.setBpCd(venderMasterExcelVO.getBpCd());

                venderMasterDAO.updateVenderMasterExcelDown(venderMasterExcelVO);
                venderTelService.updateVenderTel(venderTelVO);
            }else{

                VenderMasterVO venderMasterVO = venderMasterDAO.selectVenderMasterBpTpByKey(LoginUtil.getDlrCd(), venderMasterExcelVO.getBpTp());

                venderMasterExcelVO.setBpCd(venderMasterVO.getBpCd());
                venderTelVO.setBpCd(venderMasterVO.getBpCd());

                venderMasterDAO.insertVenderMasterExcelDown(venderMasterExcelVO);
                venderTelService.insertVenderTel(venderTelVO);

            }
        }

    }



}
