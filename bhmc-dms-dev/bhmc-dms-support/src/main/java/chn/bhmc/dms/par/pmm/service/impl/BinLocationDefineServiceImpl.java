package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationDefineService;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.dao.BinLocationDefineDAO;
import chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationDefineVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;

/**
 * 로케이션 구조 정의 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 1. 6.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("binLocationDefineService")
public class BinLocationDefineServiceImpl extends HService implements BinLocationDefineService {

    @Resource(name="binLocationDefineDAO")
    private BinLocationDefineDAO binLocationDefineDAO;

    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationDefineService#insertBinLocationDefine(chn.bhmc.dms.par.pmm.vo.BinLocationDefineVO)
     */
    @Override
    public int insertBinLocationDefine(BinLocationDefineVO binLocationDefineVO) {
        binLocationDefineVO.setDlrCd(LoginUtil.getDlrCd());
        binLocationDefineVO.setRegUsrId(LoginUtil.getUserId());
        binLocationDefineVO.setUpdtUsrId(LoginUtil.getUserId());
        return binLocationDefineDAO.insertBinLocationDefine(binLocationDefineVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationDefineService#updateBinLocationDefine(chn.bhmc.dms.par.pmm.vo.BinLocationDefineVO)
     */
    @Override
    public int updateBinLocationDefine(BinLocationDefineVO binLocationDefineVO) {
        binLocationDefineVO.setDlrCd(LoginUtil.getDlrCd());
        binLocationDefineVO.setUpdtUsrId(LoginUtil.getUserId());
        return binLocationDefineDAO.updateBinLocationDefine(binLocationDefineVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationDefineService#deleteBinLocationDefine(chn.bhmc.dms.par.pmm.vo.BinLocationDefineVO)
     */
    @Override
    public int deleteBinLocationDefine(BinLocationDefineVO binLocationDefineVO) {
        return binLocationDefineDAO.deleteBinLocationDefine(binLocationDefineVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationDefineService#selectBinLocationDefineByKey(java.lang.String, java.lang.String)
     */
    @Override
    public BinLocationDefineVO selectBinLocationDefineByKey(String dlrCd, int lvlId) {
        return binLocationDefineDAO.selectBinLocationDefineByKey(dlrCd, lvlId);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationDefineService#multiBinLocationDefines(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiBinLocationDefines(BaseSaveVO<BinLocationDefineVO> obj) throws Exception {

        /*
         * 1. 추가 시 기 로케이션 레벨 데이타 존재유무 체크.
         * 2. 삭제 시 로케이션 레벨 데이타 사용유무 체크.
         *
         * */

        // 로케이션 레벨 검색 VO
        BinLocationDefineSearchVO searchVO = new BinLocationDefineSearchVO();
        String[] lblList = new String[2];

        // 로케이션 레벨 삭제 데이타
        for(BinLocationDefineVO binLocationDefineVO : obj.getDeleteList()){
            // 로케이션 레벨 유효성 체크.
            if(binLocationDefineVO.getLvlId() <= 0){
                lblList[0] = messageSource.getMessage("par.lbl.lvlId", null, LocaleContextHolder.getLocale());  // 레벨코드
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(StringUtils.isEmpty(binLocationDefineVO.getLvlTxt())){
                lblList[0] = messageSource.getMessage("par.lbl.lvlTxt", null, LocaleContextHolder.getLocale());  // 레벨명
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(binLocationDefineVO.getLgthCnt() <= 0){
                lblList[0] = messageSource.getMessage("par.lbl.lgthCnt", null, LocaleContextHolder.getLocale());  // 자릿수
                lblList[1] = "0";
                // 자릿수은  0보다 커야 합니다.
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }

            if(StringUtils.isEmpty(binLocationDefineVO.getCdTp())){
                lblList[0] = messageSource.getMessage("par.lbl.cdTp", null, LocaleContextHolder.getLocale());  // 레벨타입
                throw processException("par.info.issueCheckMsg", lblList);
            }

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                   // 딜러코드
            searchVO.setsLvlId(binLocationDefineVO.getLvlId());         // 레벨코드
            // 로케이션 레벨 카운트 조회.
            if(binLocationDefineDAO.selectBinLocationDefineByConditionCnt(searchVO) > 0){
                // 로케이션 마스터 관리 사용 카운트 조회.
                BinLocationMasterSearchVO binLocationMasterSearchVO = new BinLocationMasterSearchVO();
                binLocationMasterSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                binLocationMasterSearchVO.setsLvlId(binLocationDefineVO.getLvlId());
                if(binLocationMasterService.selectBinLocationMastersByConditionCnt(binLocationMasterSearchVO) == 0){
                    // 삭제
                    binLocationDefineDAO.deleteBinLocationDefine(binLocationDefineVO);
                }else{
                    lblList[0] = messageSource.getMessage("par.lbl.childLocId", null, LocaleContextHolder.getLocale());  // 하위 로케이션
                    throw processException("par.info.itemInsertUseMsg", lblList);
                }
            }
        }

        // 로케이션 레벨 Insert Data
        for(BinLocationDefineVO binLocationDefineVO : obj.getInsertList()){
            // 로케이션 레벨 유효성 체크.
            if(binLocationDefineVO.getLvlId() <= 0){
                lblList[0] = messageSource.getMessage("par.lbl.lvlId", null, LocaleContextHolder.getLocale());  // 레벨코드
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(StringUtils.isEmpty(binLocationDefineVO.getLvlTxt())){
                lblList[0] = messageSource.getMessage("par.lbl.lvlTxt", null, LocaleContextHolder.getLocale());  // 레벨명

                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(binLocationDefineVO.getLgthCnt() <= 0){
                lblList[0] = messageSource.getMessage("par.lbl.lgthCnt", null, LocaleContextHolder.getLocale());  // 자릿수
                lblList[1] = "0";
                // 자릿수은  0보다 커야 합니다.
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }

            if(StringUtils.isEmpty(binLocationDefineVO.getCdTp())){
                lblList[0] = messageSource.getMessage("par.lbl.cdTp", null, LocaleContextHolder.getLocale());  // 레벨타입
                throw processException("par.info.issueCheckMsg", lblList);
            }

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                   // 딜러코드
            searchVO.setsLvlId(binLocationDefineVO.getLvlId());         // 레벨코드

            binLocationDefineVO.setDlrCd(LoginUtil.getDlrCd());
            binLocationDefineVO.setRegUsrId(LoginUtil.getUserId());

            // 로케이션 레벨 카운트 조회.
            if(binLocationDefineDAO.selectBinLocationDefineByConditionCnt(searchVO) == 0){
                binLocationDefineDAO.insertBinLocationDefine(binLocationDefineVO);
            }
            else{
                lblList[0] = messageSource.getMessage("par.lbl.lvlId", null, LocaleContextHolder.getLocale()); // 레벨
                // 레벨(이)가 중복됩니다.
                throw processException("par.info.itemInsertMsg", lblList);
            }
        }

        // 로케이션 레벨 Update Data
        for(BinLocationDefineVO binLocationDefineVO : obj.getUpdateList()){

            // 로케이션 레벨 유효성 체크.
            if(binLocationDefineVO.getLvlId() <= 0)
            {
                lblList[0] = messageSource.getMessage("par.lbl.lvlId", null, LocaleContextHolder.getLocale());  // 레벨코드
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(StringUtils.isEmpty(binLocationDefineVO.getLvlTxt()))
            {
                lblList[0] = messageSource.getMessage("par.lbl.lvlTxt", null, LocaleContextHolder.getLocale());  // 레벨명

                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(binLocationDefineVO.getLgthCnt() <= 0){
                lblList[0] = messageSource.getMessage("par.lbl.lgthCnt", null, LocaleContextHolder.getLocale());  // 자릿수
                lblList[1] = "0";
                // 자릿수은  0보다 커야 합니다.
                throw processException("par.info.itemReqZeroCntMsg", lblList);
            }

            if(StringUtils.isEmpty(binLocationDefineVO.getCdTp())){
                lblList[0] = messageSource.getMessage("par.lbl.cdTp", null, LocaleContextHolder.getLocale());  // 레벨타입
                throw processException("par.info.issueCheckMsg", lblList);
            }

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                   // 딜러코드
            searchVO.setsLvlId(binLocationDefineVO.getLvlId());         // 레벨코드

            binLocationDefineVO.setDlrCd(LoginUtil.getDlrCd());
            binLocationDefineVO.setRegUsrId(LoginUtil.getUserId());
            binLocationDefineVO.setUpdtUsrId(LoginUtil.getUserId());

            // 로케이션 레벨 카운트 조회.
            if(binLocationDefineDAO.selectBinLocationDefineByConditionCnt(searchVO) == 0){
                // 추가.
                binLocationDefineDAO.insertBinLocationDefine(binLocationDefineVO);
            }
            else{
                // 수정.
                binLocationDefineDAO.updateBinLocationDefine(binLocationDefineVO);
            }
        }

    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationDefineService#selectBinLocationDefinesByCondition(chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO)
     */
    @Override
    public List<BinLocationDefineVO> selectBinLocationDefinesByCondition(BinLocationDefineSearchVO searchVO) {
        return binLocationDefineDAO.selectBinLocationDefineByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationDefineService#selectBinLocationDefinesByConditionCnt(chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO)
     */
    @Override
    public int selectBinLocationDefinesByConditionCnt(BinLocationDefineSearchVO searchVO) {
        return binLocationDefineDAO.selectBinLocationDefineByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationDefineService#selectBinLocationLevelCombo(chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO)
     */
    @Override
    public List<BinLocationDefineVO> selectBinLocationLevelCombo(BinLocationDefineSearchVO searchVO) throws Exception {

        return binLocationDefineDAO.selectBinLocationLevelCombo(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.BinLocationDefineService#selectBinLocationLevelCount(chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO)
     */
    @Override
    public int selectBinLocationLevelCount(BinLocationDefineSearchVO searchVO) throws Exception {

        return binLocationDefineDAO.selectBinLocationLevelCount(searchVO);
    }

}
