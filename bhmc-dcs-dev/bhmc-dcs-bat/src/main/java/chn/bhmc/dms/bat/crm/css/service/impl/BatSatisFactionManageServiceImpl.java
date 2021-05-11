package chn.bhmc.dms.bat.crm.css.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.bat.crm.css.service.BatSatisFactionManageService;
import chn.bhmc.dms.bat.crm.css.service.dao.BatSatisFactionManageDAO;
import chn.bhmc.dms.bat.crm.css.vo.BatSatisFactionManageSearchVO;
import chn.bhmc.dms.bat.crm.css.vo.BatSatisFactionManageVO;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatSatisFactionManageServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 7. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 20.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Service("batSatisFactionManageService")
public class BatSatisFactionManageServiceImpl extends HService implements BatSatisFactionManageService {

    /**
     * systemConfigInfoService
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 만족도 조사 배치 DAO
     */
    @Resource(name="batSatisFactionManageDAO")
    BatSatisFactionManageDAO batSatisFactionManageDAO;

    /*
     * 만족도 조사에서 대상자 추출 버튼 클릭했을때와 같은 업무이다.(SatisFactionManageServiceImpl-selectCallRcpeExtrMapping)
     */
    @Override
    public int selectCallRcpeExtrMapping(BatSatisFactionManageVO batStsfMngVO) throws Exception {

        int result = 0;

        //1. 만족도 조사에 등록된 스케쥴러를 모두 조회
        BatSatisFactionManageSearchVO searchVO = new BatSatisFactionManageSearchVO();
        searchVO.setsDlrCd(batStsfMngVO.getDlrCd());
        List<BatSatisFactionManageVO> stsfScheduleCondition = stsfScheduleCondition(searchVO);

        String usrId = LoginUtil.getUserId();
        if(stsfScheduleCondition.size() > 0){
            //2. 배치를 돌아야할 만족도 조사가 있을때
            for(BatSatisFactionManageVO mngVO : stsfScheduleCondition){
                //기본적으로 Setting되는것들 DLR_CD, SEQ, RCPE_EXTR_SEQ, SUBY_TMPL_SEQ, STSF_IVST_MTH_CD, STSF_IVST_EXPD_CD ,STSF_IVST_TP_CD, CUST_EXTR_CYCLE_CONT, CUST_EXTR_CYCLE_TP
                //2-1 프로시저를 이용하여 대상자 추출
                mngVO.setCustExtrTermNo(mngVO.getRcpeExtrSeq());
                mngVO.setStsfIvstSeq(mngVO.getSeq());//만족도 일련번호 STSF_IVST_SEQ로 복사(추후 대상자 추출시 SEQ는 추출 KEY값으로 사용되기 때문에 미리 이동)
                mngVO.setRegUsrId(usrId);
                mngVO.setUpdtUsrId(usrId);

                BatSatisFactionManageVO cteVO = new BatSatisFactionManageVO();
                cteVO.setDlrCd(mngVO.getDlrCd());//딜러코드
                cteVO.setStsfIvstSeq(mngVO.getSeq());//만족도조사 일련번호
                cteVO.setSubyTmplSeq(mngVO.getSubyTmplSeq());//설문템플릿 일련번호
                cteVO.setCustExtrTermNo(mngVO.getCustExtrTermNo());//고객추출 조건번호
                cteVO = selectTargetExtractSaveExcel(mngVO);//이 부분에서 추출된 KEY값은 SEQ(일련번호)에 담김

                if(cteVO.getResult().equals("02")){
                    //추출할 대상자가 존재하지 않습니다.
                    throw processException("crm.err.targetEmptyUsr");
                }else if(cteVO.getResult().equals("99")){
                    //대상자 추출을 진행할 수 없습니다.
                    throw processException("crm.info.noRcpeExtrMapping");
                }

                //2-2 생성된 대상자는 1003T, 1004T에 존재하는데 해당 tmp table에서 가지고 오는 select,insert를 실행(기준에 되는 1003T에서 insert select 실행)
                mngVO.setSeq(cteVO.getSeq());//추출 Key값 Setting
                insertSatisFactionManageTargExtUsr(mngVO);

                //2-3 추출된 태상자를 콜센터로 이관
                mngVO.setRefKeyNm(mngVO.getStsfIvstSeq()+"");////만족도 조사 일련번호(캠페인번호, 고개케어 일련번호, 만족도조사 일련번호)
                mngVO.setExtrDgreCnt(1);//추출차수(캠페인/고객케어는 추출차수, 만족도조사는 무조건 1 을 넘김)
                mngVO.setBizCd("05");//업무코드(캠페인->06, 고객케어->09, 만족도조사->05)
                selectCallCenterSends(mngVO);
                /*if(resultVO.getResult().equals("03")){
                    //콜센터로 이관할 대상이 없습니다.
                    throw processException("crm.err.callCenterUserEmpty");
                }*/

                //2-4. 해당 tmp table에서 data삭제
                BatSatisFactionManageSearchVO delSearchVO = new BatSatisFactionManageSearchVO();
                delSearchVO.setsDlrCd(mngVO.getDlrCd());
                delSearchVO.setsSeq(cteVO.getSeq()+"");
                deleteTempList(delSearchVO);

                //2-5. 만족도조사 의 마지막 추출일 update
                result += updateLastExtrDt(mngVO);

            }
        }
        return result;
    }

    /*
     * @see chn.bhmc.dms.bat.crm.css.service.BatSatisFactionManageService#stsfScheduleCondition(chn.bhmc.dms.bat.crm.css.vo.BatSatisFactionManageSearchVO)
     */
    @Override
    public List<BatSatisFactionManageVO> stsfScheduleCondition(BatSatisFactionManageSearchVO searchVO)
            throws Exception {
        // TODO Auto-generated method stub

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        Calendar startCal = Calendar.getInstance();
        int year = startCal.get(Calendar.YEAR);
        int month = startCal.get(Calendar.MONTH);
        int day = startCal.get(Calendar.DATE);
        startCal.set(year, month, day, 00, 00, 00);
        searchVO.setsCurruntDt(startCal.getTime());
        searchVO.setsUseYn("Y");//사용여부
        searchVO.setsCustExtrAutoYn("Y");//자동여부

        return batSatisFactionManageDAO.stsfScheduleCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.bat.crm.css.service.BatSatisFactionManageService#selectTargetExtractSaveExcel(chn.bhmc.dms.bat.crm.css.vo.BatSatisFactionManageVO)
     */
    @Override
    public BatSatisFactionManageVO selectTargetExtractSaveExcel(BatSatisFactionManageVO saveVO) throws Exception {
        // TODO Auto-generated method stub
        batSatisFactionManageDAO.selectTargetExtractSaveExcel(saveVO);
        return saveVO;
    }

    /*
     * @see chn.bhmc.dms.bat.crm.css.service.BatSatisFactionManageService#insertSatisFactionManageTargExtUsr(chn.bhmc.dms.bat.crm.css.vo.BatSatisFactionManageVO)
     */
    @Override
    public int insertSatisFactionManageTargExtUsr(BatSatisFactionManageVO batSatisFactionManageVO) throws Exception {
        // TODO Auto-generated method stub
        return batSatisFactionManageDAO.insertSatisFactionManageTargExtUsr(batSatisFactionManageVO);
    }

    /*
     * @see chn.bhmc.dms.bat.crm.css.service.BatSatisFactionManageService#selectCallCenterSends(chn.bhmc.dms.bat.crm.css.vo.BatSatisFactionManageVO)
     */
    @Override
    public BatSatisFactionManageVO selectCallCenterSends(BatSatisFactionManageVO callSenProc) throws Exception {
        // TODO Auto-generated method stub
        batSatisFactionManageDAO.selectCallCenterSends(callSenProc);

        return callSenProc;
    }

    /*
     * @see chn.bhmc.dms.bat.crm.css.service.BatSatisFactionManageService#deleteTempList(chn.bhmc.dms.bat.crm.css.vo.BatSatisFactionManageSearchVO)
     */
    @Override
    public void deleteTempList(BatSatisFactionManageSearchVO searchVO) throws Exception {
        batSatisFactionManageDAO.deleteTemp01(searchVO);
        batSatisFactionManageDAO.deleteTemp02(searchVO);
    }

    /*
     * @see chn.bhmc.dms.bat.crm.css.service.BatSatisFactionManageService#updateLastExtrDt(chn.bhmc.dms.bat.crm.css.vo.BatSatisFactionManageVO)
     */
    @Override
    public int updateLastExtrDt(BatSatisFactionManageVO batSatisFactionManageVO) throws Exception {
        // TODO Auto-generated method stub
        return batSatisFactionManageDAO.updateLastExtrDt(batSatisFactionManageVO);
    }

}
