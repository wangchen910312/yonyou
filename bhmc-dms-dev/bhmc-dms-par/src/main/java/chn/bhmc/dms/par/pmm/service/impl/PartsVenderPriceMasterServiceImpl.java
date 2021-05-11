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
import chn.bhmc.dms.par.pmm.service.PartsVenderPriceMasterService;
import chn.bhmc.dms.par.pmm.service.dao.PartsVenderPriceMasterDAO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderPriceMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderPriceMasterVO;

/**
 * 공급처별 부품가격 마스터 관리 구현 클래스
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
@Service("partsVenderPriceMasterService")
public class PartsVenderPriceMasterServiceImpl extends HService implements PartsVenderPriceMasterService {

    @Resource(name="partsVenderPriceMasterDAO")
    private PartsVenderPriceMasterDAO partsVenderPriceMasterDAO;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderPriceMasterService#insertPartsVenderPriceMaster(chn.bhmc.dms.par.pmm.vo.PartsVenderPriceMasterVO)
     */
    @Override
    public int insertPartsVenderPriceMaster(PartsVenderPriceMasterVO partsVenderPriceMasterVO) {

        partsVenderPriceMasterVO.setDlrCd(LoginUtil.getDlrCd());
        partsVenderPriceMasterVO.setRegUsrId(LoginUtil.getUserId());
        partsVenderPriceMasterVO.setUpdtUsrId(LoginUtil.getUserId());
        return partsVenderPriceMasterDAO.insertPartsVenderPriceMaster(partsVenderPriceMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderPriceMasterService#updatePartsVenderPriceMaster(chn.bhmc.dms.par.pmm.vo.PartsVenderPriceMasterVO)
     */
    @Override
    public int updatePartsVenderPriceMaster(PartsVenderPriceMasterVO partsVenderPriceMasterVO) {

        partsVenderPriceMasterVO.setDlrCd(LoginUtil.getDlrCd());
        partsVenderPriceMasterVO.setUpdtUsrId(LoginUtil.getUserId());
        return partsVenderPriceMasterDAO.updatePartsVenderPriceMaster(partsVenderPriceMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderPriceMasterService#deletePartsVenderPriceMaster(chn.bhmc.dms.par.pmm.vo.PartsVenderPriceMasterVO)
     */
    @Override
    public int deletePartsVenderPriceMaster(PartsVenderPriceMasterVO partsVenderPriceMasterVO) {
        partsVenderPriceMasterVO.setDlrCd(LoginUtil.getDlrCd());
        partsVenderPriceMasterVO.setUpdtUsrId(LoginUtil.getUserId());
        return partsVenderPriceMasterDAO.deletePartsVenderPriceMaster(partsVenderPriceMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderPriceMasterService#multiPartsVenderPriceMaster(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiPartsVenderPriceMaster(BaseSaveVO<PartsVenderPriceMasterVO> obj) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        // 부품구매가격 검색 VO
        PartsVenderPriceMasterSearchVO searchVO = new PartsVenderPriceMasterSearchVO();
        String[] lblList = new String[1];

        for(PartsVenderPriceMasterVO partsVenderPriceMasterVO : obj.getDeleteList()){
            partsVenderPriceMasterVO.setDlrCd(LoginUtil.getDlrCd());
            partsVenderPriceMasterDAO.deletePartsVenderPriceMaster(partsVenderPriceMasterVO);
        }

        for(PartsVenderPriceMasterVO partsVenderPriceMasterVO : obj.getInsertList()){

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsBpCd(partsVenderPriceMasterVO.getBpCd());
            searchVO.setsItemCd(partsVenderPriceMasterVO.getItemCd());
            searchVO.setsPrcTp(partsVenderPriceMasterVO.getPrcTp());
            searchVO.setsLineNo(partsVenderPriceMasterVO.getLineNo());

            // 가격유형 유효성 체크
            if(StringUtils.isEmpty(partsVenderPriceMasterVO.getPrcTp())){
                lblList[0] = messageSource.getMessage("par.lbl.prcTp", null, LocaleContextHolder.getLocale());  // 가격유형
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 유효시작일 유효성 체크
            if(StringUtils.isEmpty(partsVenderPriceMasterVO.getStartDt().toString())){
                lblList[0] = messageSource.getMessage("par.lbl.startDt", null, LocaleContextHolder.getLocale());  // 유효시작일
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 유효종료일 유효성 체크
            if(StringUtils.isEmpty(partsVenderPriceMasterVO.getEndDt().toString())){
                lblList[0] = messageSource.getMessage("par.lbl.endDt", null, LocaleContextHolder.getLocale());  // 유효종료일
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 적용여부
            if(StringUtils.isEmpty(partsVenderPriceMasterVO.getApplyYn())){
                lblList[0] = messageSource.getMessage("par.lbl.applyYn", null, LocaleContextHolder.getLocale());  // 적용여부
                throw processException("par.info.issueCheckMsg", lblList);
            }
            // 구매단가 유효성 체크
            if(partsVenderPriceMasterVO.getPurcPrc() <= 0.0){
                lblList = new String[2];
                lblList[0] = messageSource.getMessage("par.lbl.purcPrc", null, LocaleContextHolder.getLocale());  // 구매단가
                lblList[1] = "0";
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }
            // 단가수량 유효성 체크
            if(partsVenderPriceMasterVO.getPrcQty() <= 0.0){
                lblList = new String[2];
                lblList[0] = messageSource.getMessage("par.lbl.prcQty", null, LocaleContextHolder.getLocale());  // 단가수량
                lblList[1] = "0";
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }
            // 단위명 유효성 체크
            if(StringUtils.isEmpty(partsVenderPriceMasterVO.getPrcQtyUnitCd())){
                lblList[0] = messageSource.getMessage("par.lbl.unitNm", null, LocaleContextHolder.getLocale());  // 단위명
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 기존 유효시작일 포함 체크.
            searchVO.setsStartDt(partsVenderPriceMasterVO.getStartDt());
            searchVO.setsEndDt(null);
            if(partsVenderPriceMasterDAO.selectPartsVenderPriceMastersPeriodByConditionCnt(searchVO) > 0)
            {
                // 유효시작일자가 유효일자에 포함됩니다.
                lblList[0] = messageSource.getMessage("par.lbl.startDt", null, LocaleContextHolder.getLocale());  // 유효시작일
                throw processException("par.info.peridDtCheckMsg", lblList);
            }

            // 기존 유효종료일 포함 체크.
            searchVO.setsStartDt(null);
            searchVO.setsEndDt(partsVenderPriceMasterVO.getEndDt());
            if(partsVenderPriceMasterDAO.selectPartsVenderPriceMastersPeriodByConditionCnt(searchVO) > 0)
            {
                // 유효종료일자가 유효일자에 포함됩니다.
                lblList[0] = messageSource.getMessage("par.lbl.endDt", null, LocaleContextHolder.getLocale());  // 유효종료일
                throw processException("par.info.peridDtCheckMsg", lblList);
            }

            int selectCnt = partsVenderPriceMasterDAO.selectPartsVenderPriceMastersByConditionCnt(searchVO);

            if(selectCnt == 0)
            {
                partsVenderPriceMasterVO.setDlrCd(LoginUtil.getDlrCd());
                partsVenderPriceMasterVO.setRegUsrId(LoginUtil.getUserId());
                partsVenderPriceMasterVO.setUpdtUsrId(LoginUtil.getUserId());
                partsVenderPriceMasterDAO.insertPartsVenderPriceMaster(partsVenderPriceMasterVO);
            }
        }

        for(PartsVenderPriceMasterVO partsVenderPriceMasterVO : obj.getUpdateList()){

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsBpCd(partsVenderPriceMasterVO.getBpCd());
            searchVO.setsItemCd(partsVenderPriceMasterVO.getItemCd());
            searchVO.setsLineNo(partsVenderPriceMasterVO.getLineNo());

            // 가격유형 유효성 체크
            if(StringUtils.isEmpty(partsVenderPriceMasterVO.getPrcTp())){
                lblList[0] = messageSource.getMessage("par.lbl.prcTp", null, LocaleContextHolder.getLocale());  // 가격유형
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 유효시작일 유효성 체크
            if(StringUtils.isEmpty(partsVenderPriceMasterVO.getStartDt().toString())){
                lblList[0] = messageSource.getMessage("par.lbl.startDt", null, LocaleContextHolder.getLocale());  // 유효시작일
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 유효종료일 유효성 체크
            if(StringUtils.isEmpty(partsVenderPriceMasterVO.getEndDt().toString())){
                lblList[0] = messageSource.getMessage("par.lbl.endDt", null, LocaleContextHolder.getLocale());  // 유효종료일
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 적용여부
            if(StringUtils.isEmpty(partsVenderPriceMasterVO.getApplyYn())){
                lblList[0] = messageSource.getMessage("par.lbl.applyYn", null, LocaleContextHolder.getLocale());  // 적용여부
                throw processException("par.info.issueCheckMsg", lblList);
            }
            // 구매단가 유효성 체크
            if(partsVenderPriceMasterVO.getPurcPrc() <= 0.0){
                lblList = new String[2];
                lblList[0] = messageSource.getMessage("par.lbl.purcPrc", null, LocaleContextHolder.getLocale());  // 구매단가
                lblList[1] = "0";
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }
            // 단가수량 유효성 체크
            if(partsVenderPriceMasterVO.getPrcQty() <= 0.0){
                lblList = new String[2];
                lblList[0] = messageSource.getMessage("par.lbl.prcQty", null, LocaleContextHolder.getLocale());  // 단가수량
                lblList[1] = "0";
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }
            // 단위명 유효성 체크
            if(StringUtils.isEmpty(partsVenderPriceMasterVO.getPrcQtyUnitCd())){
                lblList[0] = messageSource.getMessage("par.lbl.unitNm", null, LocaleContextHolder.getLocale());  // 단위명
                throw processException("par.info.issueCheckMsg", lblList);
            }

            partsVenderPriceMasterVO.setDlrCd(LoginUtil.getDlrCd());
            partsVenderPriceMasterVO.setRegUsrId(LoginUtil.getUserId());
            partsVenderPriceMasterVO.setUpdtUsrId(LoginUtil.getUserId());

            // 부품구매가격마스터 키 가져오기.
            PartsVenderPriceMasterSearchVO searchVenderPriceMasterByKeyVO = new PartsVenderPriceMasterSearchVO();

            searchVenderPriceMasterByKeyVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVenderPriceMasterByKeyVO.setsBpCd(partsVenderPriceMasterVO.getBpCd());
            searchVenderPriceMasterByKeyVO.setsItemCd(partsVenderPriceMasterVO.getItemCd());
            searchVenderPriceMasterByKeyVO.setsPrcTp(partsVenderPriceMasterVO.getPrcTp());
            searchVenderPriceMasterByKeyVO.setsLineNo(partsVenderPriceMasterVO.getLineNo());
            searchVenderPriceMasterByKeyVO.setsDelYn("N");

            int selectVenderPriceMasterByKeyCnt = partsVenderPriceMasterDAO.selectPartsVenderPriceMastersByConditionCnt(searchVenderPriceMasterByKeyVO);

            // UPDATE MODE
            if(selectVenderPriceMasterByKeyCnt > 0){

                PartsVenderPriceMasterVO partsVenderPriceMasterByKey = new PartsVenderPriceMasterVO();
                partsVenderPriceMasterByKey = partsVenderPriceMasterDAO.selectPartsVenderPriceMasterByKey(LoginUtil.getDlrCd(), partsVenderPriceMasterVO.getBpCd(), partsVenderPriceMasterVO.getItemCd(), partsVenderPriceMasterVO.getPrcTp(), partsVenderPriceMasterVO.getLineNo(), "N");

                // 그리드 시작일자 != DB 시작일자 동일 체크.
                String dbStartDt = DateUtil.convertToString(partsVenderPriceMasterByKey.getStartDt(), dateFormat);//foramt yyyy-MM-dd
                String toStartDt = DateUtil.convertToString(partsVenderPriceMasterVO.getStartDt(), dateFormat);//foramt yyyy-MM-dd
                if(!toStartDt.equals(dbStartDt)){
                    // 기존 유효시작일 포함 체크.
                    searchVO.setsStartDt(partsVenderPriceMasterVO.getStartDt());
                    searchVO.setsEndDt(null);
                    if(partsVenderPriceMasterDAO.selectPartsVenderPriceMastersPeriodByConditionCnt(searchVO) > 0){
                        // 유효시작일자가 유효일자에 포함됩니다.
                        lblList[0] = messageSource.getMessage("par.lbl.startDt", null, LocaleContextHolder.getLocale());  // 유효시작일
                        throw processException("par.info.peridDtCheckMsg", lblList);
                    }
                }

                // 그리드 시작일자 != DB 시작일자 동일 체크.
                String dbEndDt = DateUtil.convertToString(partsVenderPriceMasterByKey.getEndDt(), dateFormat);//foramt yyyy-MM-dd
                String toEndDt = DateUtil.convertToString(partsVenderPriceMasterVO.getEndDt(), dateFormat);//foramt yyyy-MM-dd
                if(!toEndDt.equals(dbEndDt)){
                    // 기존 유효종료일 포함 체크.
                    searchVO.setsStartDt(null);
                    searchVO.setsEndDt(partsVenderPriceMasterVO.getEndDt());
                    if(partsVenderPriceMasterDAO.selectPartsVenderPriceMastersPeriodByConditionCnt(searchVO) > 0){
                        // 유효종료일자가 유효일자에 포함됩니다.
                        lblList[0] = messageSource.getMessage("par.lbl.endDt", null, LocaleContextHolder.getLocale());  // 유효종료일
                        throw processException("par.info.peridDtCheckMsg", lblList);
                    }
                }

                partsVenderPriceMasterDAO.updatePartsVenderPriceMaster(partsVenderPriceMasterVO);

            }
            else{// INSERT MODE

                // 기존 유효시작일 포함 체크.
                searchVO.setsStartDt(partsVenderPriceMasterVO.getStartDt());
                searchVO.setsEndDt(null);
                if(partsVenderPriceMasterDAO.selectPartsVenderPriceMastersPeriodByConditionCnt(searchVO) > 0){
                    //유효시작일자가 유효일자에 포함됩니다.
                    lblList[0] = messageSource.getMessage("par.lbl.startDt", null, LocaleContextHolder.getLocale());  // 유효시작일
                    throw processException("par.info.peridDtCheckMsg", lblList);
                }

                // 기존 유효종료일 포함 체크.
                searchVO.setsStartDt(null);
                searchVO.setsEndDt(partsVenderPriceMasterVO.getEndDt());
                if(partsVenderPriceMasterDAO.selectPartsVenderPriceMastersPeriodByConditionCnt(searchVO) > 0){
                    // 유효종료일자가 유효일자에 포함됩니다.
                    lblList[0] = messageSource.getMessage("par.lbl.endDt", null, LocaleContextHolder.getLocale());  // 유효종료일
                    throw processException("par.info.peridDtCheckMsg", lblList);
                }

                partsVenderPriceMasterDAO.insertPartsVenderPriceMaster(partsVenderPriceMasterVO);
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderPriceMasterService#selectPartsVenderPriceMasterByKey(java.lang.String, java.lang.String)
     */
    @Override
    public PartsVenderPriceMasterVO selectPartsVenderPriceMasterByKey(String dlrCd, String bpCd, String itemCd, String prcTp, int lineNo, String delYn) {
        return partsVenderPriceMasterDAO.selectPartsVenderPriceMasterByKey(dlrCd, bpCd, itemCd, prcTp, lineNo, delYn);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderPriceMasterService#selectPartsVenderPriceMastersByCondition(chn.bhmc.dms.par.pmm.vo.PartsVenderPriceMasterSearchVO)
     */
    @Override
    public List<PartsVenderPriceMasterVO> selectPartsVenderPriceMastersByCondition(
            PartsVenderPriceMasterSearchVO searchVO) {
        return partsVenderPriceMasterDAO.selectPartsVenderPriceMastersByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderPriceMasterService#selectPartsVenderPriceMastersByConditionCnt(chn.bhmc.dms.par.pmm.vo.PartsVenderPriceMasterSearchVO)
     */
    @Override
    public int selectPartsVenderPriceMastersByConditionCnt(PartsVenderPriceMasterSearchVO searchVO) {
        return partsVenderPriceMasterDAO.selectPartsVenderPriceMastersByConditionCnt(searchVO);
    }
}
