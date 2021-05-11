package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.IssueTypeService;
import chn.bhmc.dms.par.pmm.service.dao.IssueTypeDAO;
import chn.bhmc.dms.par.pmm.vo.IssueTypeSearchVO;
import chn.bhmc.dms.par.pmm.vo.IssueTypeVO;


/**
 * 출고유형 구현 클래스
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
@Service("issueTypeService")
public class IssueTypeServiceImpl extends HService implements IssueTypeService {

    @Resource(name="issueTypeDAO")
    private IssueTypeDAO issueTypeDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.IssueTypeService#insertIssueType(chn.bhmc.dms.par.pmm.vo.IssueTypeVO)
     */
    @Override
    public int insertIssueType(IssueTypeVO issueTypeVO) {
        return issueTypeDAO.insertIssueType(issueTypeVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.IssueTypeService#updateIssueType(chn.bhmc.dms.par.pmm.vo.IssueTypeVO)
     */
    @Override
    public int updateIssueType(IssueTypeVO issueTypeVO) {
        return issueTypeDAO.updateIssueType(issueTypeVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.IssueTypeService#deleteIssueType(chn.bhmc.dms.par.pmm.vo.IssueTypeVO)
     */
    @Override
    public int deleteIssueType(IssueTypeVO issueTypeVO) {
        return issueTypeDAO.deleteIssueType(issueTypeVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.IssueTypeService#selectIssueTypeByKey(java.lang.String, java.lang.String)
     */
    @Override
    public IssueTypeVO selectIssueTypeByKey(String dlrCd, String issueTp) {
        return issueTypeDAO.selectIssueTypeByKey(dlrCd, issueTp);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.IssueTypeService#selectIssueTypesByCondition(chn.bhmc.dms.par.pmm.vo.IssueTypeSearchVO)
     */
    @Override
    public List<IssueTypeVO> selectIssueTypesByCondition(IssueTypeSearchVO searchVO) {
        return issueTypeDAO.selectIssueTypesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.IssueTypeService#selectIssueTypesByConditionCnt(chn.bhmc.dms.par.pmm.vo.IssueTypeSearchVO)
     */
    @Override
    public int selectIssueTypesByConditionCnt(IssueTypeSearchVO searchVO) {
        return issueTypeDAO.selectIssueTypesByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.IssueTypeService#multiIssueTypes(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiIssueTypes(BaseSaveVO<IssueTypeVO> obj) throws Exception {

        // 품목그룹 검색 VO
        IssueTypeSearchVO searchVO = new IssueTypeSearchVO();
        String[] lblList = new String[1];

        // 출고유형 Insert Data
        for(IssueTypeVO issueTypeVO : obj.getInsertList()){

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                   // 딜러코드
            searchVO.setsParGiTp(issueTypeVO.getParGiTp());             // 출고유형

            // 부품출고유형 유효성 체크.
            if(StringUtils.isEmpty(issueTypeVO.getParGiTp())){
                lblList[0] = messageSource.getMessage("par.lbl.parGiTp", null, LocaleContextHolder.getLocale());  // 부품출고유형
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 출고유형명 유효성 체크.
            if(StringUtils.isEmpty(issueTypeVO.getGiTpNm())){
                lblList[0] = messageSource.getMessage("par.lbl.parGiTpNm", null, LocaleContextHolder.getLocale());  // 출고유형명
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 수불유형 유효성 체크.
            if(StringUtils.isEmpty(issueTypeVO.getMvtTp())){
                lblList[0] = messageSource.getMessage("par.lbl.mvtTp", null, LocaleContextHolder.getLocale());  // 수불유형
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 출고유형 카운트 조회.
            if(issueTypeDAO.selectIssueTypesByConditionCnt(searchVO) == 0){
                issueTypeVO.setDlrCd(LoginUtil.getDlrCd());
                issueTypeVO.setRegUsrId(LoginUtil.getUserId());
                issueTypeVO.setUpdtUsrId(LoginUtil.getUserId());

                issueTypeDAO.insertIssueType(issueTypeVO);
            }else{
                lblList[0] = messageSource.getMessage("par.lbl.giTp", null, LocaleContextHolder.getLocale()); // 출고유형
                // 출고유형(이)가 존재합니다.
                throw processException("par.info.itemInsertMsg", lblList);
            }
        }

        // 출고유형 Update Data
        for(IssueTypeVO issueTypeVO : obj.getUpdateList()){
            searchVO = new IssueTypeSearchVO();
            searchVO.setsDlrCd(issueTypeVO.getDlrCd());                 // 딜러코드
            searchVO.setsParGiTp(issueTypeVO.getParGiTp());             // 출고유형코드

            issueTypeVO.setDlrCd(LoginUtil.getDlrCd());
            issueTypeVO.setUpdtUsrId(LoginUtil.getUserId());

            // 부품출고유형 유효성 체크.
            if(StringUtils.isEmpty(issueTypeVO.getParGiTp())){
                lblList[0] = messageSource.getMessage("par.lbl.parGiTp", null, LocaleContextHolder.getLocale());  // 부품출고유형
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 출고유형명 유효성 체크.
            if(StringUtils.isEmpty(issueTypeVO.getGiTpNm())){
                lblList[0] = messageSource.getMessage("par.lbl.parGiTpNm", null, LocaleContextHolder.getLocale());  // 출고유형명
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 수불유형 유효성 체크.
            if(StringUtils.isEmpty(issueTypeVO.getMvtTp())){
                lblList[0] = messageSource.getMessage("par.lbl.mvtTp", null, LocaleContextHolder.getLocale());  // 수불유형
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 출고유형 카운트 조회.
            if(issueTypeDAO.selectIssueTypesByConditionCnt(searchVO) == 0){
                // 추가.
                issueTypeDAO.insertIssueType(issueTypeVO);
            }else{
                if("N".equals(issueTypeVO.getDbYn())){
                    lblList[0] = messageSource.getMessage("par.lbl.giTp", null, LocaleContextHolder.getLocale()); // 출고유형
                    // 출고유형(이)가 존재합니다.
                    throw processException("par.info.itemInsertMsg", lblList);
                }else{
                    // 수정.
                    issueTypeDAO.updateIssueType(issueTypeVO);
                }
            }
        }

        // 수불유형 Delete Data
        for(IssueTypeVO issueTypeVO : obj.getDeleteList()){
            issueTypeVO.setDlrCd(LoginUtil.getDlrCd());
            issueTypeDAO.deleteIssueType(issueTypeVO);
        }
    }

}
