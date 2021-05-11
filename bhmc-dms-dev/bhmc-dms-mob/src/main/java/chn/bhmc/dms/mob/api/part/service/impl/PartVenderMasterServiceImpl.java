package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.part.dao.PartVenderMasterDAO;
import chn.bhmc.dms.mob.api.part.service.PartCommonCodeService;
import chn.bhmc.dms.mob.api.part.service.PartVenderMasterService;
import chn.bhmc.dms.mob.api.part.vo.CommonCodeSearchVO;
import chn.bhmc.dms.mob.api.part.vo.CommonCodeVO;
import chn.bhmc.dms.mob.api.part.vo.VenderCustomerMasterExcelVO;
import chn.bhmc.dms.mob.api.part.vo.VenderMasterExcelVO;
import chn.bhmc.dms.mob.api.part.vo.VenderMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.VenderMasterVO;


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
@Service("PartVenderMasterService")
public class PartVenderMasterServiceImpl extends HService implements PartVenderMasterService, JxlsSupport {

    @Resource(name="PartVenderMasterDAO")
    private PartVenderMasterDAO PartVenderMasterDAO;

  
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="PartCommonCodeService")
    PartCommonCodeService PartCommonCodeService;


    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#selectBHMCVenderMaster(java.lang.String)
     */
    @Override
    public VenderMasterVO selectBHMCVenderMaster(String dlrCd) throws Exception {
        return PartVenderMasterDAO.selectBHMCVenderMaster(dlrCd);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#selectVenderMastersByCondition(chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO)
     */
    @Override
    public List<VenderMasterVO> selectVenderMastersByCondition(VenderMasterSearchVO searchVO) throws Exception {
        return PartVenderMasterDAO.selectVenderMastersByCondition(searchVO);
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

            List<CommonCodeVO> bpTpList = PartCommonCodeService.selectCommonCodesByCondition(commonCodeSearchVO);

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
        return PartVenderMasterDAO.selectVenderMastersExcelDownByCondition(searchVO);
    }
    
    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderMasterService#selectVenderCustomerMastersExcelDownByCondition(chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO)
     */
    @Override
    public List<VenderCustomerMasterExcelVO> selectVenderCustomerMastersExcelDownByCondition(
            VenderMasterSearchVO searchVO) throws Exception {
        return PartVenderMasterDAO.selectVenderCustomerMastersExcelDownByCondition(searchVO);
    }

}
