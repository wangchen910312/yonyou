package chn.bhmc.dms.crm.css.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileService;
import chn.bhmc.dms.crm.css.service.dao.SatisFactionMobileDAO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileSaveVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileVO;

/**
 * 만족도조사 설문 모바일 서비스 구현 클래스
 *
 * @author hyun ho kim
 * @since 2016. 03. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.15         hyun ho kim            최초 생성
 * </pre>
 */

@Service("satisFactionMobileService")
public class SatisFactionMobileServiceImpl extends HService implements SatisFactionMobileService {
    /**
     * 만족도조사 설문 모바일 DAO
     */
    @Resource(name="satisFactionMobileDAO")
    SatisFactionMobileDAO satisFactionMobileDAO;


    /**
     * 만족도결과  서비스
     */
    @Resource(name="satisFactionMobileResultService")
    SatisFactionMobileResultService satisFactionMobileResultService;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 고객정보관리
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 설문에 응답한 답변들을 등록 처리한다.
     * @param SatisFactionMobileVO
     */
    @Override
    public boolean multiUsrAnswerSurveys(SatisFactionMobileSaveVO saveVO) throws Exception {

        boolean result = false;
        int updtCnt = 0;

        String dlrCd = LoginUtil.getDlrCd();
        String usrId = LoginUtil.getUserId();

        //List<SatisFactionMobileVO> obj = saveVO.getInsertList();

        // 설문응답 상세등록 필요 attr
        double tmpTotScore = 0;
        double tmpQestWgtVal = 0;
        int tmpStsfIvstSeq = 0;
        int tmpSubyTmplSeq = 0;
        String tmpCustNo = "";
        String tmpCustNm = "";
        String stsfIvstYn = "";
        String cmplReasonCont = "";
        double score = 0;
        double sc = 0;
        double ts = 0;

        // 고객 정보
        String hpNo = "";

        int stsfIvstRsltSeq = 0;
        if(!(saveVO.getSatisFactionMobileResultVO() == null) && saveVO.getSatisFactionMobileResultVO().getStsfIvstRsltSeq() > 0 ){
            stsfIvstRsltSeq = saveVO.getSatisFactionMobileResultVO().getStsfIvstRsltSeq();
        }

        if (StringUtils.isNotBlank(saveVO.getSatisFactionMobileResultVO().getCustNo())) {
            // customerInfoService
            CustomerInfoSearchVO customerInfoSearchVO = new CustomerInfoSearchVO();
            customerInfoSearchVO.setsCustNo(saveVO.getSatisFactionMobileResultVO().getCustNo());
            customerInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            CustomerInfoVO customerInfoVO = customerInfoService.selectCustomerInfoByKey(customerInfoSearchVO);
            hpNo = customerInfoVO.getHpNo();
        }

        //만족도 조사와 캠페인 결과관리 에서는 만족도조사결과에 Insert가 되고, 콜센터에서의 설문조사는 Update가 된다.
        if(stsfIvstRsltSeq > 0 ){

            // 콜센터에서 만족도 조사를 하는경우...

            stsfIvstYn = saveVO.getSatisFactionMobileResultVO().getStsfIvstYn();
            cmplReasonCont = saveVO.getSatisFactionMobileResultVO().getCmplReasonCont();

            SatisFactionMobileResultVO resultVO = saveVO.getSatisFactionMobileResultVO();
            resultVO.setDlrCd(saveVO.getSatisFactionMobileResultVO().getDlrCd());
            stsfIvstRsltSeq = saveVO.getSatisFactionMobileResultVO().getStsfIvstRsltSeq();
            resultVO.setStsfIvstRsltSeq(stsfIvstRsltSeq);
            resultVO.setDlrCd(dlrCd);

            //응답한 답변 갯수만큼 for
            for(SatisFactionMobileVO satisFactionMobileVO : saveVO.getInsertList()){
                satisFactionMobileVO.setRegUsrId(LoginUtil.getUserId());
                satisFactionMobileVO.setDlrCd(dlrCd);
                satisFactionMobileVO.setStsfIvstRsltSeq(stsfIvstRsltSeq);

                // 질문유형 코드 : qestTpCd
                // 가중치 : qestWgtVal
                // 설문지 일련번호 : subyTmplSeq
                // 질문 일련번호 : qestSeq
                // 답변 일련번호 : answSeq
                // 답변점수 : answScoreVal

                tmpQestWgtVal = satisFactionMobileVO.getQestWgtVal();//가중치값 setting
                tmpStsfIvstSeq = satisFactionMobileVO.getStsfIvstSeq();//만족도조사 일련번호
                tmpSubyTmplSeq = satisFactionMobileVO.getSubyTmplSeq();//설문지 일련번호
                tmpCustNo = satisFactionMobileVO.getCustNo();//고객 일련번호
                tmpCustNm = satisFactionMobileVO.getCustNm();//고객명

                if(satisFactionMobileVO.getQestTpCd() != null && satisFactionMobileVO.getQestTpCd().equals("01")){
                    // 01:객관식 단답형
                    score = satisFactionMobileVO.getAnswScoreVal();
                    sc = (double)tmpQestWgtVal/100;
                    ts =  score * sc;
                    tmpTotScore += (double)(ts);

                }
                if(satisFactionMobileVO.getQestTpCd() != null && satisFactionMobileVO.getQestTpCd().equals("02")){
                    // 02:객관식 다답형(현재는 100점 만점의 기준이 없기 때문에 개별 선택한 값에서 개별 점수를 합산 - 추후 변경)

                    //tmpTotScore += satisFactionMobileVO.getAnswScoreVal()*(tmpQestWgtVal/100);
                    score = satisFactionMobileVO.getAnswScoreVal();
                    sc = (double)tmpQestWgtVal/100;
                    ts =  score * sc;
                    tmpTotScore += (double)(ts);

                }
                //설문 응답 상세정보 저장
                insertUsrAnswerSurvey(satisFactionMobileVO);
            }

            // 최종 설문결과 점수 정보 update
            resultVO.setStsfIvstScoreVal(tmpTotScore); // 만족도조사 점수값
            resultVO.setStsfIvstYn(stsfIvstYn);//만족여부
            resultVO.setCmplReasonCont(cmplReasonCont);//총결
            resultVO.setCustNo(tmpCustNo);
            resultVO.setUpdtUsrId(usrId);
            resultVO.setStsfIvstEmpId(usrId);
            updtCnt = satisFactionMobileResultService.updateSurveyResultScore(resultVO);

        }else{

            //1. 설문결과 일련번호생성
            SatisFactionMobileResultSearchVO searchVO = new SatisFactionMobileResultSearchVO();
            searchVO.setsDlrCd(dlrCd);
            stsfIvstRsltSeq = satisFactionMobileResultService.selectStsfIvstRsltSeq(searchVO);

            //2. 설문 Master Insert
            SatisFactionMobileResultVO resultVO = saveVO.getSatisFactionMobileResultVO();
            resultVO.setDlrCd(dlrCd);//딜러코드
            saveVO.getSatisFactionMobileResultVO().setStsfIvstEmpId(LoginUtil.getUserId());
            saveVO.getSatisFactionMobileResultVO().setRegUsrId(LoginUtil.getUserId());
            resultVO.setStsfIvstRsltSeq(stsfIvstRsltSeq); //설문결과 일련번호
            resultVO.setCustNo(saveVO.getSatisFactionMobileResultVO().getCustNo()); //고객번호
            resultVO.setHpNo(hpNo);
            resultVO.setSubyTmplSeq(saveVO.getSatisFactionMobileResultVO().getSubyTmplSeq());//설문템플릿 일련번호
            satisFactionMobileResultService.insertSurveyResult(resultVO);


            //3. 응답한 답변 갯수만큼 for
            for(SatisFactionMobileVO satisFactionMobileVO : saveVO.getInsertList()){
                satisFactionMobileVO.setRegUsrId(LoginUtil.getUserId());
                satisFactionMobileVO.setDlrCd(dlrCd);
                satisFactionMobileVO.setStsfIvstRsltSeq(stsfIvstRsltSeq);

                // 질문유형 코드 : qestTpCd
                // 가중치 : qestWgtVal
                // 설문지 일련번호 : subyTmplSeq
                // 질문 일련번호 : qestSeq
                // 답변 일련번호 : answSeq
                // 답변점수 : answScoreVal

                tmpQestWgtVal = satisFactionMobileVO.getQestWgtVal();//가중치값 setting
                tmpStsfIvstSeq = satisFactionMobileVO.getStsfIvstSeq();//만족도조사 일련번호
                tmpSubyTmplSeq = satisFactionMobileVO.getSubyTmplSeq();//설문지 일련번호
                tmpCustNo = satisFactionMobileVO.getCustNo();//고객 일련번호
                tmpCustNm = satisFactionMobileVO.getCustNm();//고객명
                stsfIvstYn = satisFactionMobileVO.getStsfIvstYn();//만족여부
                cmplReasonCont = satisFactionMobileVO.getCmplReasonCont();//총결

                if(satisFactionMobileVO.getQestTpCd() != null && satisFactionMobileVO.getQestTpCd().equals("01")){
                    // 01:객관식 단답형
                    score = satisFactionMobileVO.getAnswScoreVal();
                    sc = (double)tmpQestWgtVal/100;
                    ts =  score * sc;
                    tmpTotScore += (double)(ts);

                }
                if(satisFactionMobileVO.getQestTpCd() != null && satisFactionMobileVO.getQestTpCd().equals("02")){
                    // 02:객관식 다답형(현재는 100점 만점의 기준이 없기 때문에 개별 선택한 값에서 개별 점수를 합산 - 추후 변경)

                    //tmpTotScore += satisFactionMobileVO.getAnswScoreVal()*(tmpQestWgtVal/100);
                    score = satisFactionMobileVO.getAnswScoreVal();
                    sc = (double)tmpQestWgtVal/100;
                    ts =  score * sc;
                    tmpTotScore += (double)(ts);

                }
                //설문 응답 상세정보 저장
                insertUsrAnswerSurvey(satisFactionMobileVO);
            }

            //4. 최종 설문결과 점수 정보 update
            resultVO.setStsfIvstScoreVal(tmpTotScore); // 만족도조사 점수값
            resultVO.setStsfIvstYn(stsfIvstYn);//만족여부
            resultVO.setCmplReasonCont(cmplReasonCont);//총결
            resultVO.setCustNm(tmpCustNm);//고객명
            resultVO.setUpdtUsrId(usrId);
            resultVO.setStsfIvstEmpId(usrId);
            updtCnt = satisFactionMobileResultService.updateSurveyResultScore(resultVO);

        }

        if ( updtCnt == 1 ) {
            result = true;
        }

        return result;

    }

    /**
     * 설문 응답 정보를 등록한다.
     * @param satisFactionMonileVO - 등록할 정보가 담긴 SatisFactionMobileVO
     * @return 등록된 목록수
     */
    @Override
    public int insertUsrAnswerSurvey(SatisFactionMobileVO satisFactionMobileVO) throws Exception {
        return satisFactionMobileDAO.insertUsrAnswerSurvey(satisFactionMobileVO);
    }

}
