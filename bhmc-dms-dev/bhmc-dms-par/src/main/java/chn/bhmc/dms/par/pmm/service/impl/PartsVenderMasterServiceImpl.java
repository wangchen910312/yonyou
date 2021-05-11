package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.PartsVenderMasterService;
import chn.bhmc.dms.par.pmm.service.dao.PartsVenderMasterDAO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderMasterVO;

/**
 * 공급처별 부품 마스터 관리 구현 클래스
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
@Service("partsVenderMasterService")
public class PartsVenderMasterServiceImpl extends HService implements PartsVenderMasterService{

    @Resource(name="partsVenderMasterDAO")
    private PartsVenderMasterDAO partsVenderMasterDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderMasterService#insertPartsVenderMaster(chn.bhmc.dms.par.pmm.vo.PartsVenderMasterVO)
     */
    @Override
    public int insertPartsVenderMaster(PartsVenderMasterVO partsVenderMasterVO) throws Exception {

        PartsVenderMasterSearchVO searchVO = new PartsVenderMasterSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsItemCd(partsVenderMasterVO.getItemCd());
        searchVO.setsBpCd(partsVenderMasterVO.getBpCd());

        if(partsVenderMasterDAO.selectPartsVenderMastersByConditionCnt(searchVO) > 0 ){
            String[] lblList = new String[1];
            lblList[0] = messageSource.getMessage("par.lbl.supplyNo", null, LocaleContextHolder.getLocale()); // 공급업체 번호
            // 공급업체 번호가 존재합니다.
            throw processException("par.info.itemInsertMsg", lblList);
        }

        partsVenderMasterVO.setDlrCd(LoginUtil.getDlrCd());
        partsVenderMasterVO.setRegUsrId(LoginUtil.getUserId());
        partsVenderMasterVO.setUpdtUsrId(LoginUtil.getUserId());
        return partsVenderMasterDAO.insertPartsVenderMaster(partsVenderMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderMasterService#updatePartsVenderMaster(chn.bhmc.dms.par.pmm.vo.PartsVenderMasterVO)
     */
    @Override
    public int updatePartsVenderMaster(PartsVenderMasterVO partsVenderMasterVO) throws Exception {
        partsVenderMasterVO.setDlrCd(LoginUtil.getDlrCd());
        partsVenderMasterVO.setUpdtUsrId(LoginUtil.getUserId());
        return partsVenderMasterDAO.updatePartsVenderMaster(partsVenderMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderMasterService#deletePartsVenderMaster(chn.bhmc.dms.par.pmm.vo.PartsVenderMasterVO)
     */
    @Override
    public int deletePartsVenderMaster(PartsVenderMasterVO partsVenderMasterVO) throws Exception {
        partsVenderMasterVO.setDlrCd(LoginUtil.getDlrCd());
        partsVenderMasterVO.setUpdtUsrId(LoginUtil.getUserId());
        return partsVenderMasterDAO.deletePartsVenderMaster(partsVenderMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderMasterService#multiPartsVenderMasters(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiPartsVenderMasters(BaseSaveVO<PartsVenderMasterVO> obj) throws Exception {

        // 공급업체 검색 VO
        PartsVenderMasterSearchVO searchVO = new PartsVenderMasterSearchVO();
        for(PartsVenderMasterVO partsVenderMasterVO : obj.getInsertList()){

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsItemCd(partsVenderMasterVO.getItemCd());
            searchVO.setsBpCd(partsVenderMasterVO.getBpCd());
            searchVO.setsApplyYn(partsVenderMasterVO.getApplyYn());

            if(partsVenderMasterDAO.selectPartsVenderMastersByConditionCnt(searchVO) == 0)
            {
                partsVenderMasterVO.setDlrCd(LoginUtil.getDlrCd());
                partsVenderMasterVO.setRegUsrId(LoginUtil.getUserId());
                partsVenderMasterVO.setUpdtUsrId(LoginUtil.getUserId());
                partsVenderMasterDAO.insertPartsVenderMaster(partsVenderMasterVO);
            }
        }

        for(PartsVenderMasterVO partsVenderMasterVO : obj.getUpdateList()){

            searchVO = new PartsVenderMasterSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsItemCd(partsVenderMasterVO.getItemCd());
            searchVO.setsBpCd(partsVenderMasterVO.getBpCd());
            searchVO.setsApplyYn(partsVenderMasterVO.getApplyYn());

            partsVenderMasterVO.setDlrCd(LoginUtil.getDlrCd());
            partsVenderMasterVO.setRegUsrId(LoginUtil.getUserId());
            partsVenderMasterVO.setUpdtUsrId(LoginUtil.getUserId());

            if(partsVenderMasterDAO.selectPartsVenderMastersByConditionCnt(searchVO) == 0){
                partsVenderMasterDAO.insertPartsVenderMaster(partsVenderMasterVO);
            }else{
                partsVenderMasterDAO.updatePartsVenderMaster(partsVenderMasterVO);
            }
        }

        for(PartsVenderMasterVO partsVenderMasterVO : obj.getDeleteList()){

            searchVO = new PartsVenderMasterSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsItemCd(partsVenderMasterVO.getItemCd());
            searchVO.setsBpCd(partsVenderMasterVO.getBpCd());
            searchVO.setsApplyYn(partsVenderMasterVO.getApplyYn());

            if(partsVenderMasterDAO.selectPartsVenderMastersByConditionCnt(searchVO) > 0){
                partsVenderMasterVO.setDlrCd(LoginUtil.getDlrCd());
                partsVenderMasterVO.setUpdtUsrId(LoginUtil.getUserId());
                partsVenderMasterDAO.deletePartsVenderMaster(partsVenderMasterVO);
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderMasterService#selectPartsVenderMasterByKey(java.lang.String, java.lang.String)
     */
    @Override
    public PartsVenderMasterVO selectPartsVenderMasterByKey(String dlrCd, String bpCd) throws Exception {
        return partsVenderMasterDAO.selectPartsVenderMasterByKey(dlrCd, bpCd);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderMasterService#selectPartsVenderMastersByCondition(chn.bhmc.dms.par.pmm.vo.PartsVenderMasterSearchVO)
     */
    @Override
    public List<PartsVenderMasterVO> selectPartsVenderMastersByCondition(PartsVenderMasterSearchVO searchVO) throws Exception {
        return partsVenderMasterDAO.selectPartsVenderMastersByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderMasterService#selectPartsVenderMastersByConditionCnt(chn.bhmc.dms.par.pmm.vo.PartsVenderMasterSearchVO)
     */
    @Override
    public int selectPartsVenderMastersByConditionCnt(PartsVenderMasterSearchVO searchVO) throws Exception {
        return partsVenderMasterDAO.selectPartsVenderMastersByConditionCnt(searchVO);
    }

}
