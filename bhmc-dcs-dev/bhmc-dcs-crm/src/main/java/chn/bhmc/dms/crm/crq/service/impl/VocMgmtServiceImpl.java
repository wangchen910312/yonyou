package chn.bhmc.dms.crm.crq.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.crq.service.VocMgmtService;
import chn.bhmc.dms.crm.crq.service.dao.VocMgmtDAO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtSearchVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * VOC 관리 서비스 구현 클래스
 *
 * @author hyoung jun an
 * @since 2016. 3. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyoung jun an            최초 생성
 * </pre>
 */

@Service("vocMgmtService")
public class VocMgmtServiceImpl extends HService implements VocMgmtService {

    @Resource(name="vocNoIdgenService")
    EgovIdGnrService vocNoIdgenService;

    /**
     * VOC 관리 DAO
     */
    @Resource(name="vocMgmtDAO")
    VocMgmtDAO vocMgmtDAO;

    /**
     * VOC 목록 수량 조회
     */
    @Override
    public int selectVocMgmtsByConditionCnt(VocMgmtSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return vocMgmtDAO.selectVocMgmtsByConditionCnt(searchVO);
    }

    /**
     * VOC 목록 조회
     */
    @Override
    public List<VocMgmtVO> selectVocMgmtsByCondition(VocMgmtSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return vocMgmtDAO.selectVocMgmtsByCondition(searchVO);
    }

    /**
     * VOC 등록
     */
    @Override
    public int insertVocMgmt(VocMgmtVO vocMgmtVO) throws Exception {

        if("".equals(vocMgmtVO.getBhmcYn())){
            vocMgmtVO.setBhmcYn("N");           //BHMC여부
        }

        vocMgmtVO.setEmgcRescStartYn("N");  //긴급구조 출발 여부

        //유형코드가 [02 불만신고]일 경우 및 아닐 경우 값 셋팅.
        if("02".equals(vocMgmtVO.getVocTpCd())){
            vocMgmtVO.setEmgcCallCd(null);      //긴급전화 첫 연결
            vocMgmtVO.setCauCd(null);           //원인코드
            vocMgmtVO.setEmgcRescStsfCd(null);  //긴급구조 만족도 코드
            vocMgmtVO.setCustRescLocCont(null); //고객구조 위치내용

            if("".equals(vocMgmtVO.getCmplReAcptYn())){
                vocMgmtVO.setCmplReAcptYn("N");     //불만 재 접수 여부
            }
            if("".equals(vocMgmtVO.getParOrdYn())){
                vocMgmtVO.setParOrdYn("N");     //부품 오더 여부
            }
        }else{
            vocMgmtVO.setCmplCauCd(null);       //불만이유
            vocMgmtVO.setProcLmtCd(null);       //처리시한
            vocMgmtVO.setRevMthCont(null);      //검토중인 방안
            vocMgmtVO.setMthAchvHm(0);          //방안 달성시간
            vocMgmtVO.setCmplStsfCd(null);      //불만 만족도
            vocMgmtVO.setCmplReAcptYn("N");     //불만 재 접수 여부
            vocMgmtVO.setCmplReAcptCnt(0);      //불만 재 접수 횟수
            vocMgmtVO.setSerReqNo(null);        //관련서비스 요청번호
            vocMgmtVO.setCmplDlDeptNm(null);    //불만전달 부서
            vocMgmtVO.setCmplDlEmpId(null);     //불만전달자
            vocMgmtVO.setSaleDt(null);          //판매일자
            vocMgmtVO.setDstbNo(null);          //물류번호
            vocMgmtVO.setParOrdYn("N");         //부품 오더 여부
            vocMgmtVO.setParOrdDt(null);        //오더시간
            vocMgmtVO.setParArrvDt(null);       //도착시간
            vocMgmtVO.setItemCd(null);          //부품번호

            if("".equals(vocMgmtVO.getEmgcRescStartYn())){
                vocMgmtVO.setEmgcRescStartYn("N");  //긴급구조 출발 여부
            }
        }

        //VOC번호 생성
        vocMgmtVO.setVocNo(selectNextVocNo());

        vocMgmtVO.setRegUsrId(LoginUtil.getUserId());
        vocMgmtVO.setPltCd(LoginUtil.getPltCd());
        vocMgmtVO.setDlrCd(LoginUtil.getDlrCd());

        // VOC 생성
        return vocMgmtDAO.insertVocMgmt(vocMgmtVO);
    }

    /**
     * VOC 수정
     */
    @Override
    public int updateVocMgmt(VocMgmtVO vocMgmtVO) throws Exception {

        if("".equals(vocMgmtVO.getBhmcYn())){
            vocMgmtVO.setBhmcYn("N");           //BHMC여부
        }

        vocMgmtVO.setEmgcRescStartYn("N");  //긴급구조 출발 여부

        //유형코드가 [02 불만신고]일 경우 및 아닐 경우 값 셋팅.
        if("02".equals(vocMgmtVO.getVocTpCd())){
            vocMgmtVO.setEmgcCallCd(null);      //긴급전화 첫 연결
            vocMgmtVO.setCauCd(null);           //원인코드
            vocMgmtVO.setEmgcRescStsfCd(null);  //긴급구조 만족도 코드
            vocMgmtVO.setCustRescLocCont(null); //고객구조 위치내용

            if("".equals(vocMgmtVO.getCmplReAcptYn())){
                vocMgmtVO.setCmplReAcptYn("N");     //불만 재 접수 여부
            }
            if("".equals(vocMgmtVO.getParOrdYn())){
                vocMgmtVO.setParOrdYn("N");     //부품 오더 여부
            }
        }else{
            vocMgmtVO.setCmplCauCd(null);       //불만이유
            vocMgmtVO.setProcLmtCd(null);       //처리시한
            vocMgmtVO.setRevMthCont(null);      //검토중인 방안
            vocMgmtVO.setMthAchvHm(0);          //방안 달성시간
            vocMgmtVO.setCmplStsfCd(null);      //불만 만족도
            vocMgmtVO.setCmplReAcptYn("N");     //불만 재 접수 여부
            vocMgmtVO.setCmplReAcptCnt(0);      //불만 재 접수 횟수
            vocMgmtVO.setSerReqNo(null);        //관련서비스 요청번호
            vocMgmtVO.setCmplDlDeptNm(null);    //불만전달 부서
            vocMgmtVO.setCmplDlEmpId(null);     //불만전달자
            vocMgmtVO.setSaleDt(null);          //판매일자
            vocMgmtVO.setDstbNo(null);          //물류번호
            vocMgmtVO.setParOrdYn("N");         //부품 오더 여부
            vocMgmtVO.setParOrdDt(null);        //오더시간
            vocMgmtVO.setParArrvDt(null);       //도착시간
            vocMgmtVO.setItemCd(null);          //부품번호

            if("".equals(vocMgmtVO.getEmgcRescStartYn())){
                vocMgmtVO.setEmgcRescStartYn("N");  //긴급구조 출발 여부
            }
        }

        vocMgmtVO.setUpdtUsrId(LoginUtil.getUserId());

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(vocMgmtVO.getDlrCd())){vocMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(vocMgmtVO.getPltCd())){vocMgmtVO.setPltCd(LoginUtil.getPltCd());}

        return vocMgmtDAO.updateVocMgmt(vocMgmtVO);
    }

    /**
     * 상태 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    @Override
    public List<VocMgmtVO> selectVocTpCdListByCondition(VocMgmtSearchVO searchVO) throws Exception {
        return vocMgmtDAO.selectVocTpCdListByCondition(searchVO);
    }

    /**
     * 성코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    @Override
    public List<VocMgmtVO> selectSungCdListByCondition(VocMgmtSearchVO searchVO) throws Exception {
        return vocMgmtDAO.selectSungCdListByCondition(searchVO);
    }

    /**
     * 도시코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    @Override
    public List<VocMgmtVO> selectCityCdListByCondition(VocMgmtSearchVO searchVO) throws Exception {
        return vocMgmtDAO.selectCityCdListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectNextPurcOrdNo()
     */
    @Override
    public String selectNextVocNo() throws Exception {
        try {
            return vocNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
        }
    }





    /**
     * {@inheritDoc}
     */
    @Override
    public int insertActive(VocMgmtVO vocMgmtVO) throws Exception {

        return vocMgmtDAO.insertActive(vocMgmtVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateActive(VocMgmtVO vocMgmtVO) throws Exception {

        return vocMgmtDAO.updateActive(vocMgmtVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiActives(BaseSaveVO<VocMgmtVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(VocMgmtVO vocMgmtVO : obj.getInsertList()){
            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(vocMgmtVO.getDlrCd())){vocMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(vocMgmtVO.getPltCd())){vocMgmtVO.setPltCd(LoginUtil.getPltCd());}

            vocMgmtVO.setRegUsrId(userId);
            insertActive(vocMgmtVO);
        }
        for(VocMgmtVO vocMgmtVO : obj.getUpdateList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(vocMgmtVO.getDlrCd())){vocMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(vocMgmtVO.getPltCd())){vocMgmtVO.setPltCd(LoginUtil.getPltCd());}

            vocMgmtVO.setUpdtUsrId(userId);
            updateActive(vocMgmtVO);
        }
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<VocMgmtVO> selectActivesByCondition(VocMgmtSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return vocMgmtDAO.selectActivesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectActivesByConditionCnt(VocMgmtSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return vocMgmtDAO.selectActivesByConditionCnt(searchVO);
    }
}
