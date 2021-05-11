package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService;
import chn.bhmc.dms.par.pmm.service.dao.PartsVenderSalPriceMasterDAO;
import chn.bhmc.dms.par.pmm.vo.*;

/**
 * 공급처별 부품판매가격 마스터 관리 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 16.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("partsVenderSalPriceMasterService")
public class PartsVenderSalPriceMasterServiceImpl extends HService implements PartsVenderSalPriceMasterService {

    @Resource(name="partsVenderSalPriceMasterDAO")
    private PartsVenderSalPriceMasterDAO partsVenderSalPriceMasterDAO;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService#insertPartsVenderSalPriceMaster(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceMasterVO)
     */
    @Override
    public int insertPartsVenderSalPriceMaster(PartsVenderSalPriceMasterVO partsVenderSalPriceMasterVO)
            throws Exception {
            partsVenderSalPriceMasterVO.setDlrCd(LoginUtil.getDlrCd());
            partsVenderSalPriceMasterVO.setRegUsrId(LoginUtil.getUserId());
        return partsVenderSalPriceMasterDAO.insertPartsVenderSalPriceMaster(partsVenderSalPriceMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService#updatePartsVenderSalPriceMaster(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceMasterVO)
     */
    @Override
    public int updatePartsVenderSalPriceMaster(PartsVenderSalPriceMasterVO partsVenderSalPriceMasterVO)
            throws Exception {
            partsVenderSalPriceMasterVO.setDlrCd(LoginUtil.getDlrCd());
            partsVenderSalPriceMasterVO.setUpdtUsrId(LoginUtil.getUserId());
        return partsVenderSalPriceMasterDAO.updatePartsVenderSalPriceMaster(partsVenderSalPriceMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService#insertPartsVenderSalPriceMaster(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetMasterVO)
     */
    @Override
    public int insertPartsVenderSalPriceTargetMaster(PartsVenderSalPriceTargetMasterVO partsVenderSalPriceTargetMasterVO)
            throws Exception {
        partsVenderSalPriceTargetMasterVO.setDlrCd(LoginUtil.getDlrCd());
        partsVenderSalPriceTargetMasterVO.setRegUsrId(LoginUtil.getUserId());
        return partsVenderSalPriceMasterDAO.insertPartsVenderSalPriceTargetMaster(partsVenderSalPriceTargetMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService#updatePartsVenderSalPriceMaster(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetMasterVO)
     */
    @Override
    public int updatePartsVenderSalPriceTargetMaster(PartsVenderSalPriceTargetMasterVO partsVenderSalPriceTargetMasterVO)
            throws Exception {
        partsVenderSalPriceTargetMasterVO.setDlrCd(LoginUtil.getDlrCd());
        partsVenderSalPriceTargetMasterVO.setUpdtUsrId(LoginUtil.getUserId());
    return partsVenderSalPriceMasterDAO.updatePartsVenderSalPriceTargetMaster(partsVenderSalPriceTargetMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService#deletePartsVenderSalPriceMaster(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceMasterVO)
     */
    @Override
    public int deletePartsVenderSalPriceMaster(PartsVenderSalPriceMasterVO partsVenderSalPriceMasterVO)
            throws Exception {
            partsVenderSalPriceMasterVO.setDlrCd(LoginUtil.getDlrCd());
            partsVenderSalPriceMasterVO.setUpdtUsrId(LoginUtil.getUserId());
            partsVenderSalPriceMasterDAO.deletePartsVenderSalPriceMaster(partsVenderSalPriceMasterVO);
        return 0;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService#multiPartsVenderSalPriceMaster(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiPartsVenderSalPriceMaster(BaseSaveVO<PartsVenderSalPriceMasterVO> obj) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        // 부품판매가격 검색 VO
        PartsVenderSalPriceMasterSearchVO searchVO = new PartsVenderSalPriceMasterSearchVO();
        String[] lblList = new String[1];

        for(PartsVenderSalPriceMasterVO partsVenderSalPriceMasterVO : obj.getDeleteList()){
            partsVenderSalPriceMasterVO.setDlrCd(LoginUtil.getDlrCd());
            partsVenderSalPriceMasterDAO.deletePartsVenderSalPriceMaster(partsVenderSalPriceMasterVO);
        }

        for(PartsVenderSalPriceMasterVO partsVenderSalPriceMasterVO : obj.getInsertList()){

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsBpCd(partsVenderSalPriceMasterVO.getBpCd());
            searchVO.setsItemCd(partsVenderSalPriceMasterVO.getItemCd());
            searchVO.setsLineNo(partsVenderSalPriceMasterVO.getLineNo());

            // 가격유형 유효성 체크
            if(StringUtils.isEmpty(partsVenderSalPriceMasterVO.getPrcTp())){
                lblList[0] = messageSource.getMessage("par.lbl.prcTp", null, LocaleContextHolder.getLocale());  // 가격유형
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 유효시작일 유효성 체크
            if(StringUtils.isEmpty(partsVenderSalPriceMasterVO.getStartDt().toString())){
                lblList[0] = messageSource.getMessage("par.lbl.startDt", null, LocaleContextHolder.getLocale());  // 유효시작일
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 유효종료일 유효성 체크
            if(StringUtils.isEmpty(partsVenderSalPriceMasterVO.getEndDt().toString())){
                lblList[0] = messageSource.getMessage("par.lbl.endDt", null, LocaleContextHolder.getLocale());  // 유효종료일
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 적용여부
            if(StringUtils.isEmpty(partsVenderSalPriceMasterVO.getApplyYn())){
                lblList[0] = messageSource.getMessage("par.lbl.applyYn", null, LocaleContextHolder.getLocale());  // 적용여부
                throw processException("par.info.issueCheckMsg", lblList);
            }
            // 판매단가 유효성 체크
            if(partsVenderSalPriceMasterVO.getSalePrcAmt() <= 0.0){
                lblList = new String[2];
                lblList[0] = messageSource.getMessage("par.lbl.salePrcAmt", null, LocaleContextHolder.getLocale());  // 판매단가
                lblList[1] = "0";
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }
            // 단가수량 유효성 체크
            if(partsVenderSalPriceMasterVO.getPrcQty() <= 0.0){
                lblList = new String[2];
                lblList[0] = messageSource.getMessage("par.lbl.prcQty", null, LocaleContextHolder.getLocale());  // 단가수량
                lblList[1] = "0";
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }
            // 단위명 유효성 체크
            if(StringUtils.isEmpty(partsVenderSalPriceMasterVO.getPrcQtyUnitCd())){
                lblList[0] = messageSource.getMessage("par.lbl.unitNm", null, LocaleContextHolder.getLocale());  // 단위명
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 기존 유효시작일 포함 체크.
            searchVO.setsStartDt(partsVenderSalPriceMasterVO.getStartDt());
            searchVO.setsEndDt(null);
            if(partsVenderSalPriceMasterDAO.selectPartsVenderSalPriceMastersPeriodByConditionCnt(searchVO) > 0){
                // 유효시작일자가 유효일자에 포함됩니다.
                lblList[0] = messageSource.getMessage("par.lbl.startDt", null, LocaleContextHolder.getLocale());  // 유효시작일
                throw processException("par.info.peridDtCheckMsg", lblList);
            }

            // 기존 유효종료일 포함 체크.
            searchVO.setsStartDt(null);
            searchVO.setsEndDt(partsVenderSalPriceMasterVO.getEndDt());
            if(partsVenderSalPriceMasterDAO.selectPartsVenderSalPriceMastersPeriodByConditionCnt(searchVO) > 0){
                // 유효종료일자가 유효일자에 포함됩니다.
                lblList[0] = messageSource.getMessage("par.lbl.endDt", null, LocaleContextHolder.getLocale());  // 유효종료일
                throw processException("par.info.peridDtCheckMsg", lblList);
            }

            int selectCnt = partsVenderSalPriceMasterDAO.selectPartsVenderSalPriceMastersByConditionCnt(searchVO);

            if(selectCnt == 0){
                partsVenderSalPriceMasterVO.setDlrCd(LoginUtil.getDlrCd());
                partsVenderSalPriceMasterVO.setRegUsrId(LoginUtil.getUserId());
                partsVenderSalPriceMasterVO.setUpdtUsrId(LoginUtil.getUserId());
                partsVenderSalPriceMasterDAO.insertPartsVenderSalPriceMaster(partsVenderSalPriceMasterVO);
            }
        }

        for(PartsVenderSalPriceMasterVO partsVenderSalPriceMasterVO : obj.getUpdateList()){

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsBpCd(partsVenderSalPriceMasterVO.getBpCd());
            searchVO.setsItemCd(partsVenderSalPriceMasterVO.getItemCd());
            searchVO.setsLineNo(partsVenderSalPriceMasterVO.getLineNo());

            // 가격유형 유효성 체크
            if(StringUtils.isEmpty(partsVenderSalPriceMasterVO.getPrcTp())){
                lblList[0] = messageSource.getMessage("par.lbl.prcTp", null, LocaleContextHolder.getLocale());  // 가격유형
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 유효시작일 유효성 체크
            if(StringUtils.isEmpty(partsVenderSalPriceMasterVO.getStartDt().toString())){
                lblList[0] = messageSource.getMessage("par.lbl.startDt", null, LocaleContextHolder.getLocale());  // 유효시작일
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 유효종료일 유효성 체크
            if(StringUtils.isEmpty(partsVenderSalPriceMasterVO.getEndDt().toString())){
                lblList[0] = messageSource.getMessage("par.lbl.endDt", null, LocaleContextHolder.getLocale());  // 유효종료일
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 적용여부
            if(StringUtils.isEmpty(partsVenderSalPriceMasterVO.getApplyYn())){
                lblList[0] = messageSource.getMessage("par.lbl.applyYn", null, LocaleContextHolder.getLocale());  // 적용여부
                throw processException("par.info.issueCheckMsg", lblList);
            }
            // 판매단가 유효성 체크
            if(partsVenderSalPriceMasterVO.getSalePrcAmt() <= 0.0){
                lblList = new String[2];
                lblList[0] = messageSource.getMessage("par.lbl.salePrcAmt", null, LocaleContextHolder.getLocale());  // 판매단가
                lblList[1] = "0";
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }
            // 단가수량 유효성 체크
            if(partsVenderSalPriceMasterVO.getPrcQty() <= 0.0){
                lblList = new String[2];
                lblList[0] = messageSource.getMessage("par.lbl.prcQty", null, LocaleContextHolder.getLocale());  // 단가수량
                lblList[1] = "0";
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }
            // 단위명 유효성 체크
            if(StringUtils.isEmpty(partsVenderSalPriceMasterVO.getPrcQtyUnitCd())){
                lblList[0] = messageSource.getMessage("par.lbl.unitNm", null, LocaleContextHolder.getLocale());  // 단위명
                throw processException("par.info.issueCheckMsg", lblList);
            }

            partsVenderSalPriceMasterVO.setDlrCd(LoginUtil.getDlrCd());
            partsVenderSalPriceMasterVO.setRegUsrId(LoginUtil.getUserId());
            partsVenderSalPriceMasterVO.setUpdtUsrId(LoginUtil.getUserId());

            // 부품판매가격마스터 키 가져오기.
            PartsVenderSalPriceMasterSearchVO searchVenderSalPriceMasterByKeyVO = new PartsVenderSalPriceMasterSearchVO();

            searchVenderSalPriceMasterByKeyVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVenderSalPriceMasterByKeyVO.setsBpCd(partsVenderSalPriceMasterVO.getBpCd());
            searchVenderSalPriceMasterByKeyVO.setsItemCd(partsVenderSalPriceMasterVO.getItemCd());
            searchVenderSalPriceMasterByKeyVO.setsPrcTp(partsVenderSalPriceMasterVO.getPrcTp());
            searchVenderSalPriceMasterByKeyVO.setsLineNo(partsVenderSalPriceMasterVO.getLineNo());
            searchVenderSalPriceMasterByKeyVO.setsDelYn("N");

            int selectVenderSalPriceMasterByKeyCnt = partsVenderSalPriceMasterDAO.selectPartsVenderSalPriceMastersByConditionCnt(searchVenderSalPriceMasterByKeyVO);

            if(selectVenderSalPriceMasterByKeyCnt > 0){// UPDATE MODE

                // 부품판매가격마스터 키 가져오기.
                PartsVenderSalPriceMasterVO partsVenderSalPriceMasterByKey = partsVenderSalPriceMasterDAO.selectPartsVenderSalPriceMasterByKey(LoginUtil.getDlrCd(), partsVenderSalPriceMasterVO.getBpCd(), partsVenderSalPriceMasterVO.getItemCd(), partsVenderSalPriceMasterVO.getPrcTp(), partsVenderSalPriceMasterVO.getLineNo(), "N");

                // 그리드 시작일자 != DB 시작일자 동일 체크.
                String dbStartDt = DateUtil.convertToString(partsVenderSalPriceMasterByKey.getStartDt(), dateFormat);//foramt yyyy-MM-dd
                String toStartDt = DateUtil.convertToString(partsVenderSalPriceMasterVO.getStartDt(), dateFormat);//foramt yyyy-MM-dd
                if(!toStartDt.equals(dbStartDt)){
                    // 기존 유효시작일 포함 체크.
                    searchVO.setsStartDt(partsVenderSalPriceMasterVO.getStartDt());
                    searchVO.setsEndDt(null);
                    if(partsVenderSalPriceMasterDAO.selectPartsVenderSalPriceMastersPeriodByConditionCnt(searchVO) > 0)
                    {
                        // 유효시작일자가 유효일자에 포함됩니다.
                        lblList[0] = messageSource.getMessage("par.lbl.startDt", null, LocaleContextHolder.getLocale());  // 유효시작일
                        throw processException("par.info.peridDtCheckMsg", lblList);
                    }
                }

                // 그리드 시작일자 != DB 시작일자 동일 체크.
                String dbEndDt = DateUtil.convertToString(partsVenderSalPriceMasterByKey.getEndDt(), dateFormat);//foramt yyyy-MM-dd
                String toEndDt = DateUtil.convertToString(partsVenderSalPriceMasterVO.getEndDt(), dateFormat);//foramt yyyy-MM-dd
                if(!toEndDt.equals(dbEndDt)){
                    // 기존 유효종료일 포함 체크.
                    searchVO.setsStartDt(null);
                    searchVO.setsEndDt(partsVenderSalPriceMasterVO.getEndDt());
                    if(partsVenderSalPriceMasterDAO.selectPartsVenderSalPriceMastersPeriodByConditionCnt(searchVO) > 0)
                    {
                        // 유효종료일자가 유효일자에 포함됩니다.
                        lblList[0] = messageSource.getMessage("par.lbl.endDt", null, LocaleContextHolder.getLocale());  // 유효종료일
                        throw processException("par.info.peridDtCheckMsg", lblList);
                    }
                }

                // UPDATE
                partsVenderSalPriceMasterDAO.updatePartsVenderSalPriceMaster(partsVenderSalPriceMasterVO);

            }else{// INSERT MODE

                // 기존 유효시작일 포함 체크.
                searchVO.setsStartDt(partsVenderSalPriceMasterVO.getStartDt());
                searchVO.setsEndDt(null);
                if(partsVenderSalPriceMasterDAO.selectPartsVenderSalPriceMastersPeriodByConditionCnt(searchVO) > 0){
                    // 유효시작일자가 유효일자에 포함됩니다.
                    lblList[0] = messageSource.getMessage("par.lbl.startDt", null, LocaleContextHolder.getLocale());  // 유효시작일
                    throw processException("par.info.peridDtCheckMsg", lblList);
                }

                // 기존 유효종료일 포함 체크.
                searchVO.setsStartDt(null);
                searchVO.setsEndDt(partsVenderSalPriceMasterVO.getEndDt());
                if(partsVenderSalPriceMasterDAO.selectPartsVenderSalPriceMastersPeriodByConditionCnt(searchVO) > 0){
                    // 유효종료일자가 유효일자에 포함됩니다.
                    lblList[0] = messageSource.getMessage("par.lbl.endDt", null, LocaleContextHolder.getLocale());  // 유효종료일
                    throw processException("par.info.peridDtCheckMsg", lblList);
                }

                // INSERT
                partsVenderSalPriceMasterDAO.insertPartsVenderSalPriceMaster(partsVenderSalPriceMasterVO);
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService#selectPartsVenderSalPriceMasterByKey(java.lang.String, java.lang.String)
     */
    @Override
    public PartsVenderSalPriceMasterVO selectPartsVenderSalPriceMasterByKey(String dlrCd, String bpCd, String itemCd, String prcTp, int lineNo, String delYn) throws Exception {
        return partsVenderSalPriceMasterDAO.selectPartsVenderSalPriceMasterByKey(dlrCd, bpCd, itemCd, prcTp, lineNo, delYn);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService#selectPartsVenderSalPriceMastersByItemInfoCnt(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceMasterSearchVO)
     */
    @Override
    public int selectPartsVenderSalPriceMastersByItemInfoCnt(PartsVenderSalPriceMasterSearchVO searchVO)
            throws Exception {

        return partsVenderSalPriceMasterDAO.selectPartsVenderSalPriceMastersByItemInfoCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService#selectPartsVenderSalPriceMastersByCondition(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceMasterSearchVO)
     */
    @Override
    public List<PartsVenderSalPriceMasterVO> selectPartsVenderSalPriceMastersByCondition(
            PartsVenderSalPriceMasterSearchVO searchVO) throws Exception {
        return partsVenderSalPriceMasterDAO.selectPartsVenderSalPriceMastersByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService#selectPartsVenderSalPriceMastersByConditionCnt(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceMasterSearchVO)
     */
    @Override
    public int selectPartsVenderSalPriceMastersByConditionCnt(PartsVenderSalPriceMasterSearchVO searchVO) throws Exception {
        return partsVenderSalPriceMasterDAO.selectPartsVenderSalPriceMastersByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService#selectPartsPurcPriceMastersByKey(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceMasterSearchVO)
     */
    @Override
    public List<PartsVenderSalPriceMasterVO> selectPartsPurcPriceMastersByKey(PartsVenderSalPriceMasterSearchVO searchVO)
            throws Exception {

        return partsVenderSalPriceMasterDAO.selectPartsPurcPriceMastersByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService#selectPartsRetailPriceMastersByKey(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceMasterSearchVO)
     */
    @Override
    public List<PartsVenderSalPriceMasterVO> selectPartsRetailPriceMastersByKey(
            PartsVenderSalPriceMasterSearchVO searchVO) throws Exception {

        return partsVenderSalPriceMasterDAO.selectPartsRetailPriceMastersByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService#selectPayTpPriceMasterByKey(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceMasterSearchVO)
     */
    @Override
    public PartsVenderSalPriceMasterVO selectPayTpPriceMasterByKey(PartsVenderSalPriceMasterSearchVO searchVO)
            throws Exception {
        return partsVenderSalPriceMasterDAO.selectPayTpPriceMasterByKey(searchVO);
    }

   
    /**
     * 修改维修组合中的配件价格
     * @param partsVenderSalPriceTargetMasterItemVO
     */
	@Override
	public int updatePackagePar(PartsVenderSalPriceTargetMasterVO partsVenderSalPriceTargetMasterItemVO) throws Exception {
		return partsVenderSalPriceMasterDAO.updatePackagePar(partsVenderSalPriceTargetMasterItemVO);
	}
    
    

}
