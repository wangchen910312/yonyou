package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.MovementTypeService;
import chn.bhmc.dms.par.pmm.service.dao.MovementTypeDAO;
import chn.bhmc.dms.par.pmm.vo.MovementTypeSearchVO;
import chn.bhmc.dms.par.pmm.vo.MovementTypeVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;


/**
 * 수불유형 구현 클래스
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
@Service("movementTypeService")
public class MovementTypeServiceImpl extends HService implements MovementTypeService {

    @Resource(name="movementTypeDAO")
    private MovementTypeDAO movementTypeDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.MovementTypeService#insertMovementType(chn.bhmc.dms.par.pmm.vo.MovementTypeVO)
     */
    @Override
    public int insertMovementType(MovementTypeVO movementTypeVO) {
        return movementTypeDAO.insertMovementType(movementTypeVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MovementTypeService#updateMovementType(chn.bhmc.dms.par.pmm.vo.MovementTypeVO)
     */
    @Override
    public int updateMovementType(MovementTypeVO movementTypeVO) {
        return movementTypeDAO.updateMovementType(movementTypeVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MovementTypeService#deleteMovementType(chn.bhmc.dms.par.pmm.vo.MovementTypeVO)
     */
    @Override
    public int deleteMovementType(MovementTypeVO movementTypeVO) {
        return movementTypeDAO.deleteMovementType(movementTypeVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MovementTypeService#selectMovementTypeByKey(java.lang.String, java.lang.String)
     */
    @Override
    public MovementTypeVO selectMovementTypeByKey(String dlrCd, String mvtTp) {
        return movementTypeDAO.selectMovementTypeByKey(dlrCd, mvtTp);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MovementTypeService#selectCombiMovementTypeByKey(java.lang.String, java.lang.String)
     */
    @Override
    public MovementTypeVO selectCombiMovementTypeByKey(String dlrCd, String mvtTp) throws Exception {

        return movementTypeDAO.selectCombiMovementTypeByKey(dlrCd, mvtTp);
    }


    /*
     * @see chn.bhmc.dms.par.pmm.service.MovementTypeService#selectMvtDocItemsByCondition(chn.bhmc.dms.par.pmm.vo.MovementTypeSearchVO)
     */
    @Override
    public List<MvtDocItemVO> selectMvtDocItemsByCondition(MovementTypeSearchVO searchVO) throws Exception {
        return movementTypeDAO.selectMvtDocItemsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MovementTypeService#selectMvtDocItemsByConditionCnt(chn.bhmc.dms.par.pmm.vo.MovementTypeSearchVO)
     */
    @Override
    public int selectMvtDocItemsByConditionCnt(MovementTypeSearchVO searchVO) throws Exception {
        return movementTypeDAO.selectMvtDocItemsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MovementTypeService#selectMovementTypesByCondition(chn.bhmc.dms.par.pmm.vo.MovementTypeSearchVO)
     */
    @Override
    public List<MovementTypeVO> selectMovementTypesByCondition(MovementTypeSearchVO searchVO) {
        return movementTypeDAO.selectMovementTypesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MovementTypeService#selectMovementTypesByConditionCnt(chn.bhmc.dms.par.pmm.vo.MovementTypeSearchVO)
     */
    @Override
    public int selectMovementTypesByConditionCnt(MovementTypeSearchVO searchVO) {
        return movementTypeDAO.selectMovementTypesByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MovementTypeService#multiMovementTypes(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiMovementTypes(BaseSaveVO<MovementTypeVO> obj) throws Exception {

        // 수불유형 검색 VO
        MovementTypeSearchVO searchVO = new MovementTypeSearchVO();
        String[] lblList = new String[1];

        // 수불유형 Insert Data
        for(MovementTypeVO movementTypeVO : obj.getInsertList()){

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                 // 딜러코드
            searchVO.setsMvtTp(movementTypeVO.getMvtTp());                 // 수불유형코드

            // 수불유형코드 유효성 체크.
            if(StringUtils.isEmpty(movementTypeVO.getMvtTp())){
                lblList[0] = messageSource.getMessage("par.lbl.mvtTp", null, LocaleContextHolder.getLocale());  // 수불유형코드
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 수불유형명 유효성 체크.
            if(StringUtils.isEmpty(movementTypeVO.getMvtTpNm())){
                lblList[0] = messageSource.getMessage("par.lbl.mvtTpNm", null, LocaleContextHolder.getLocale());  // 수불유형명
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 수불입출고구분 유효성 체크.
            if(StringUtils.isEmpty(movementTypeVO.getMvtGrGiTp())){
                lblList[0] = messageSource.getMessage("par.lbl.mvtGrGiTp", null, LocaleContextHolder.getLocale());  // 수불입출고구분
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 재고계산식 유효성 체크.
            if(StringUtils.isEmpty(movementTypeVO.getStockCalcTp())){
                lblList[0] = messageSource.getMessage("par.lbl.stockCalcTp", null, LocaleContextHolder.getLocale());  // 재고계산식
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 프로세스분석 유효성 체크.
            if(StringUtils.isEmpty(movementTypeVO.getProcessTp())){
                lblList[0] = messageSource.getMessage("par.lbl.processTp", null, LocaleContextHolder.getLocale());  // 프로세스분석
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 출고유형 카운트 조회.
            if(movementTypeDAO.selectMovementTypesByConditionCnt(searchVO) == 0){
                movementTypeVO.setDlrCd(LoginUtil.getDlrCd());
                movementTypeVO.setRegUsrId(LoginUtil.getUserId());
                movementTypeVO.setUpdtUsrId(LoginUtil.getUserId());

                movementTypeDAO.insertMovementType(movementTypeVO);
            }
            else{
                lblList[0] = messageSource.getMessage("par.lbl.mvtTp", null, LocaleContextHolder.getLocale()); // 수불유형코드
                // 수불유형코드가 존재합니다.
                throw processException("par.info.itemInsertMsg", lblList);
            }
        }

        // 수불유형 Update Data
        for(MovementTypeVO movementTypeVO : obj.getUpdateList()){
            searchVO = new MovementTypeSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());                       // 딜러코드
            searchVO.setsMvtTp(movementTypeVO.getMvtTp());                 // 수불유형코드

            // 수불유형코드 유효성 체크.
            if(StringUtils.isEmpty(movementTypeVO.getMvtTp())){
                lblList[0] = messageSource.getMessage("par.lbl.mvtTp", null, LocaleContextHolder.getLocale());  // 수불유형코드
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 수불유형명 유효성 체크.
            if(StringUtils.isEmpty(movementTypeVO.getMvtTpNm())){
                lblList[0] = messageSource.getMessage("par.lbl.mvtTpNm", null, LocaleContextHolder.getLocale());  // 수불유형명
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 수불입출고구분 유효성 체크.
            if(StringUtils.isEmpty(movementTypeVO.getMvtGrGiTp())){
                lblList[0] = messageSource.getMessage("par.lbl.mvtGrGiTp", null, LocaleContextHolder.getLocale());  // 수불입출고구분
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 재고계산식 유효성 체크.
            if(StringUtils.isEmpty(movementTypeVO.getStockCalcTp())){
                lblList[0] = messageSource.getMessage("par.lbl.stockCalcTp", null, LocaleContextHolder.getLocale());  // 재고계산식
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 프로세스분석 유효성 체크.
            if(StringUtils.isEmpty(movementTypeVO.getProcessTp())){
                lblList[0] = messageSource.getMessage("par.lbl.processTp", null, LocaleContextHolder.getLocale());  // 프로세스분석
                throw processException("par.info.issueCheckMsg", lblList);
            }

            movementTypeVO.setDlrCd(LoginUtil.getDlrCd());
            movementTypeVO.setRegUsrId(LoginUtil.getUserId());
            movementTypeVO.setUpdtUsrId(LoginUtil.getUserId());

            // 출고유형 카운트 조회.
            if(movementTypeDAO.selectMovementTypesByConditionCnt(searchVO) == 0){
                // 추가.
                movementTypeDAO.insertMovementType(movementTypeVO);
            }
            else{
                if("N".equals(movementTypeVO.getDbYn())){//DB 품목코드 없을 때
                    lblList[0] = messageSource.getMessage("par.lbl.mvtTp", null, LocaleContextHolder.getLocale()); // 수불유형코드
                    // 수불유형코드가 존재합니다.
                    throw processException("par.info.itemInsertMsg", lblList);
                }else{// 수정.
                    movementTypeDAO.updateMovementType(movementTypeVO);
                }
            }
        }

        // 수불유형 Delete Data
        for(MovementTypeVO movementTypeVO : obj.getDeleteList()){
            movementTypeVO.setDlrCd(LoginUtil.getDlrCd());
            movementTypeVO.setUseYn("N");
            movementTypeVO.setUpdtUsrId(LoginUtil.getUserId());
            movementTypeDAO.updateMovementType(movementTypeVO);
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.MovementTypeService#selectGrGiMovementTypes(chn.bhmc.dms.par.pmm.vo.MovementTypeSearchVO)
     */
    @Override
    public List<MovementTypeVO> selectGrGiMovementTypes(MovementTypeSearchVO searchVO) throws Exception {

        return movementTypeDAO.selectGrGiMovementTypes(searchVO);
    }

}
