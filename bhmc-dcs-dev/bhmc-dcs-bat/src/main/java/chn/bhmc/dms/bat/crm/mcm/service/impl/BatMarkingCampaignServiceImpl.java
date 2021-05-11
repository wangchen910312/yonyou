package chn.bhmc.dms.bat.crm.mcm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.bat.crm.css.service.BatSatisFactionManageService;
import chn.bhmc.dms.bat.crm.css.vo.BatSatisFactionManageSearchVO;
import chn.bhmc.dms.bat.crm.css.vo.BatSatisFactionManageVO;
import chn.bhmc.dms.bat.crm.mcm.service.BatMarkingCampaignService;
import chn.bhmc.dms.bat.crm.mcm.service.dao.BatMarkingCampaignDAO;
import chn.bhmc.dms.bat.crm.mcm.vo.BatMarkingCampaignSearchVO;
import chn.bhmc.dms.bat.crm.mcm.vo.BatMarkingCampaignVO;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatSatisFactionManageServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Hyoung Jun An
 * @since 2016. 8. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 8.    Hyoung Jun An     최초 생성
 * </pre>
 */
@Service("batMarkingCampaignService")
public class BatMarkingCampaignServiceImpl extends HService implements BatMarkingCampaignService {

    /**
     * systemConfigInfoService
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 캠페인 배치 DAO
     */
    @Resource(name="batMarkingCampaignDAO")
    BatMarkingCampaignDAO batMarkingCampaignDAO;

    /**
     * batSatisFactionManageService
     */
    @Resource(name="batSatisFactionManageService")
    BatSatisFactionManageService batSatisFactionManageService;

    @Resource(name="eaiClient")
    EaiClient eaiClient;

    /**
     * 캠페인 대상자를 추출하는 프로시저 호출
     * @param batMarkingCampaignVO - 조회 조건을 포함하는 BatMarkingCampaignVO
     * @return
     * 1. 캠페인에 등록된 스케줄러 조회
     * 2. 생성된 대상자는 1003T, 1004T에 존재하는데 해당 tmp table에서 가지고 오는 select,insert를 실행
     * 3. 해당 tmp table에서 data삭제
     * 4. 캠페인 대상자 추출일 update
     * 5. 새롭게 Batch를 수행할 캠페인 대상자 마스터 신규생성
     */
    @Override
    public int multiTargetExtract(BatMarkingCampaignVO batMarkingCampaignVO) throws Exception {

        int result = 0;

        //1. 캠페인에 등록된 스케쥴러를 모두 조회
        BatMarkingCampaignSearchVO searchVO = new BatMarkingCampaignSearchVO();
        searchVO.setsDlrCd(batMarkingCampaignVO.getDlrCd());
        List<BatMarkingCampaignVO> selectMarkingCampaignScheduleCondition = selectMarkingCampaignScheduleCondition(searchVO);

        String usrId = "autoBatch";
        if(selectMarkingCampaignScheduleCondition.size() > 0){
            //2. 배치를 돌아야할 캠페인 대상자 목록가 있을때
            for(BatMarkingCampaignVO mngVO : selectMarkingCampaignScheduleCondition){
                //기본적으로 Setting되는것들 DLR_CD, SEQ, RCPE_EXTR_SEQ, SUBY_TMPL_SEQ, STSF_IVST_MTH_CD, STSF_IVST_EXPD_CD ,STSF_IVST_TP_CD, CUST_EXTR_CYCLE_CONT, CUST_EXTR_CYCLE_TP
                //2-1 프로시저를 이용하여 대상자 추출
                mngVO.setRegUsrId(usrId);
                mngVO.setUpdtUsrId(usrId);

                BatSatisFactionManageVO cteVO = new BatSatisFactionManageVO();
                cteVO.setDlrCd(mngVO.getDlrCd());//딜러코드
                cteVO.setCustExtrTermNo(mngVO.getCustExtrTermNo());//고객추출 조건번호
                cteVO.setRegUsrId(usrId);
                cteVO.setUpdtUsrId(usrId);
                cteVO = batSatisFactionManageService.selectTargetExtractSaveExcel(cteVO);//이 부분에서 추출된 KEY값은 SEQ(일련번호)에 담김

                if(cteVO.getResult().equals("02")){
                    //추출할 대상자가 존재하지 않습니다.
                    throw processException("crm.err.targetEmptyUsr");
                }else if(cteVO.getResult().equals("99")){
                    //대상자 추출을 진행할 수 없습니다.
                    throw processException("crm.info.noRcpeExtrMapping");
                }

                //2-2 생성된 대상자는 1003T, 1004T에 존재하는데 해당 tmp table에서 가지고 오는 select,insert를 실행(기준에 되는 1003T에서 insert select 실행)
                mngVO.setSeq(cteVO.getSeq());//추출 Key값 Setting
                insertBatTargetExtractSave(mngVO);

                //2-3. 해당 tmp table에서 data삭제
                BatSatisFactionManageSearchVO delSearchVO = new BatSatisFactionManageSearchVO();
                delSearchVO.setsDlrCd(mngVO.getDlrCd());
                delSearchVO.setsSeq(cteVO.getSeq()+"");
                batSatisFactionManageService.deleteTempList(delSearchVO);

                //2-4. 캠페인 대상자 추출일 update
                updateBatTargetExtractMaster(mngVO);

                //2-5. 새롭게 Batch를 수행할 캠페인 대상자 마스터 신규생성
                result += insertBatTarget(mngVO);
            }
        }
        return result;
    }

    /**
     * 자동으로 Batch 를 수행할 목록이 있는지 조회한다(캠페인 대상자 추출목록).
     */
    @Override
    public List<BatMarkingCampaignVO> selectMarkingCampaignScheduleCondition(BatMarkingCampaignSearchVO searchVO)
            throws Exception {
        // TODO Auto-generated method stub

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        Calendar startCal = Calendar.getInstance();
        int year = startCal.get(Calendar.YEAR);
        int month = startCal.get(Calendar.MONTH);
        int day = startCal.get(Calendar.DATE);
        startCal.set(year, month, day, 00, 00, 00);
        searchVO.setsCurruntDt(startCal.getTime());

        return batMarkingCampaignDAO.selectMarkingCampaignScheduleCondition(searchVO);
    }

    /**
     * Batch 를 수행하여 추출한 대상자를 등록 한다.
     */
    @Override
    public int insertBatTargetExtractSave(BatMarkingCampaignVO saveVO) throws Exception {
        // TODO Auto-generated method stub
        return batMarkingCampaignDAO.insertBatTargetExtractSave(saveVO);
    }

    /**
     * Batch 를 수행한 이후에 마케팅 캠페인(대상자) 정보를 수정한다.(대상자 마스터 업데이트)
     */
    @Override
    public int updateBatTargetExtractMaster(BatMarkingCampaignVO saveVO) throws Exception {
        // TODO Auto-generated method stub
        return batMarkingCampaignDAO.updateBatTargetExtractMaster(saveVO);
    }

    /**
     * Batch 를 수행한 이후에 새롭게 Batch를 수행할 마케팅 캠페인(대상자) 정보를 등록한다.
     */
    @Override
    public int insertBatTarget(BatMarkingCampaignVO saveVO) throws Exception {
        // TODO Auto-generated method stub
        return batMarkingCampaignDAO.insertBatTarget(saveVO);
    }




    /**
     * DCS캠페인 데이터를 인터페이스 테이블에 이관처리 이후에 인터페이스를 호출한다.
     * @param batMarkingCampaignVO - 조회 조건을 포함하는 BatMarkingCampaignVO
     * @return
     */
    @Override
    public int multiDcsIfCpoy(BatMarkingCampaignVO batMarkingCampaignVO) throws Exception {

        int result = 0;

        //DCS캠페인 데이터를 인터페이스 테이블로 이관처리
        batMarkingCampaignVO = selectMarktingCampaignDcsIfCopy(batMarkingCampaignVO);

        return result;
    }

    /**
     * DCS캠페인 데이터를 인터페이스 테이블에 이관처리 이후에 인터페이스를 호출한다.
     * @param batMarkingCampaignVO - 조회 조건을 포함하는 BatMarkingCampaignVO
     * @return
     */
    @Override
    public int multiDcsIfCpoyEAI() throws Exception {
        int result = 0;

        CommDMSDoc reqCommDMSDoc1 = new EaiSimpleMessage.Builder()
                                            .ifId("CRM408")
                                            .company("H")
                                            .sender("CRM")
                                            .build()
                                            .buildCommDMSDoc();

        eaiClient.sendRequest(reqCommDMSDoc1);

        CommDMSDoc reqCommDMSDoc2 = new EaiSimpleMessage.Builder()
                                            .ifId("CRM411")
                                            .company("H")
                                            .sender("CRM")
                                            .build()
                                            .buildCommDMSDoc();

        eaiClient.sendRequest(reqCommDMSDoc2);

        CommDMSDoc reqCommDMSDoc3 = new EaiSimpleMessage.Builder()
                                            .ifId("CRM412")
                                            .company("H")
                                            .sender("CRM")
                                            .build()
                                            .buildCommDMSDoc();

        eaiClient.sendRequest(reqCommDMSDoc3);

        CommDMSDoc reqCommDMSDoc4 = new EaiSimpleMessage.Builder()
                                            .ifId("CRM413")
                                            .company("H")
                                            .sender("CRM")
                                            .build()
                                            .buildCommDMSDoc();

        eaiClient.sendRequest(reqCommDMSDoc4);

        CommDMSDoc reqCommDMSDoc5 = new EaiSimpleMessage.Builder()
                                            .ifId("CRM414")
                                            .company("H")
                                            .sender("CRM")
                                            .build()
                                            .buildCommDMSDoc();

        eaiClient.sendRequest(reqCommDMSDoc5);

        // TODO Auto-generated method stub
        CommDMSDoc reqCommDMSDoc6 = null;

        //무한루프 방지
        int iMaxLoopCnt = 500;
        int iLoopCnt = 0;

        while("Y".equals(this.selectMarktingCampaignDataYn()) && iLoopCnt < 500){
            reqCommDMSDoc6 = new EaiSimpleMessage.Builder()
                                                .ifId("CRM415")
                                                .company("H")
                                                .sender("CRM")
                                                .build()
                                                .buildCommDMSDoc();

            eaiClient.sendRequest(reqCommDMSDoc6);

            iLoopCnt++;
        }

        CommDMSDoc reqCommDMSDoc7 = new EaiSimpleMessage.Builder()
                                            .ifId("CRM416")
                                            .company("H")
                                            .sender("CRM")
                                            .build()
                                            .buildCommDMSDoc();

        eaiClient.sendRequest(reqCommDMSDoc7);

        return result;
    }

    public String selectMarktingCampaignDataYn() throws Exception {

        return batMarkingCampaignDAO.selectMarktingCampaignDataYn();

    }

    /**
     * DCS캠페인 데이터를 인터페이스 테이블에 이관처리 한다.
     */
    @Override
    public BatMarkingCampaignVO selectMarktingCampaignDcsIfCopy(BatMarkingCampaignVO saveVO) throws Exception {
        // TODO Auto-generated method stub
        batMarkingCampaignDAO.selectMarktingCampaignDcsIfCopy(saveVO);
        return saveVO;
    }

    /**
    * DMS에서 DCS로 다시 이관된 DCS캠페인 대상자에 대한 결과치를 갱신한다.(추출대상자)
    * @throws Exception
    */
    @Override
    public void updateCrmDcsTargetResult() throws Exception {

        batMarkingCampaignDAO.updateCrmDcsTargetResult();
    }

}