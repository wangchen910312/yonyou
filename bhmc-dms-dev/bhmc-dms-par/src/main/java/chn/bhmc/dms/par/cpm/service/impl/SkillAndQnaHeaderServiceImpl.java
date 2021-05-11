package chn.bhmc.dms.par.cpm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.cpm.service.SkillAndQnaDetailService;
import chn.bhmc.dms.par.cpm.service.SkillAndQnaHeaderService;
import chn.bhmc.dms.par.cpm.service.dao.SkillAndQnaHeaderDAO;
import chn.bhmc.dms.par.cpm.vo.SkillAndQnaHeaderVO;
import chn.bhmc.dms.par.cpm.vo.SkillAndQnaResultVO;
import chn.bhmc.dms.par.cpm.vo.SkillAndQnaSaveVO;
import chn.bhmc.dms.par.cpm.vo.SkillAndQnaSearchVO;

/**
 * 기술자문 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 8. 24.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 8. 24.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("skillAndQnaHeaderService")
public class SkillAndQnaHeaderServiceImpl extends HService implements SkillAndQnaHeaderService {

    Logger logger = LoggerFactory.getLogger(SkillAndQnaHeaderServiceImpl.class);

    @Resource(name="skillAndQnaHeaderDAO")
    private SkillAndQnaHeaderDAO skillAndQnaHeaderDAO;

    @Resource(name="skillAndQnaDetailService")
    SkillAndQnaDetailService skillAndQnaDetailService;

    @Resource(name="pblmDocNoIdgenService")
    TableIdGenService pblmDocNoIdgenService;

    @Resource(name="pblmFileDocNoIdgenService")
    TableIdGenService pblmFileDocNoIdgenService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /*
     * @see chn.bhmc.dms.par.cpm.service.SkillAndQnaHeaderService#insertSkillAndQnaHeader(chn.bhmc.dms.par.cpm.vo.SkillAndQnaHeaderVO)
     */
    @Override
    public int insertSkillAndQnaHeader(SkillAndQnaHeaderVO skillAndQnaHeaderVO) throws Exception {
            //set pblmNo
            skillAndQnaHeaderVO.setPblmNo(pblmDocNoIdgenService.getNextStringId());
            skillAndQnaHeaderVO.setDlrCd(LoginUtil.getDlrCd());
            skillAndQnaHeaderVO.setRegUsrId(LoginUtil.getUserId());

            if(StringUtils.isEmpty(skillAndQnaHeaderVO.getFileNo())){
                skillAndQnaHeaderVO.setFileNo(pblmFileDocNoIdgenService.getNextStringId());
           }
           skillAndQnaHeaderDAO.insertSkillAndQnaHeader(skillAndQnaHeaderVO);
           //BMP Send Interface
           sendSkillAndQnaHeader(skillAndQnaHeaderVO);

        return 1;
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SkillAndQnaHeaderService#updateSkillAndQnaHeader(chn.bhmc.dms.par.cpm.vo.SkillAndQnaHeaderVO)
     */
    @Override
    public int updateSkillAndQnaHeader(SkillAndQnaHeaderVO skillAndQnaHeaderVO) throws Exception {
            skillAndQnaHeaderVO.setDlrCd(LoginUtil.getDlrCd());
            skillAndQnaHeaderVO.setUpdtUsrId(LoginUtil.getUserId());
            if(StringUtils.isEmpty(skillAndQnaHeaderVO.getFileNo())){
                skillAndQnaHeaderVO.setFileNo(pblmFileDocNoIdgenService.getNextStringId());
            }
            //update
            skillAndQnaHeaderDAO.updateSkillAndQnaHeader(skillAndQnaHeaderVO);
            //BMP Send Interface
            sendSkillAndQnaHeader(skillAndQnaHeaderVO);

        return 1;
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SkillAndQnaHeaderService#deleteSkillAndQnaHeader(chn.bhmc.dms.par.cpm.vo.SkillAndQnaHeaderVO)
     */
    @Override
    public int deleteSkillAndQnaHeader(SkillAndQnaHeaderVO skillAndQnaHeaderVO) throws Exception {
        return skillAndQnaHeaderDAO.deleteSkillAndQnaHeader(skillAndQnaHeaderVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SkillAndQnaHeaderService#multiSkillAndQnaHeader(chn.bhmc.dms.par.cpm.vo.SkillAndQnaSaveVO)
     */
    @Override
    public void multiSkillAndQnaHeader(SkillAndQnaSaveVO skillAndQnaSaveVO) throws Exception {

        SkillAndQnaHeaderVO skillAndQnaHeaderVO = skillAndQnaSaveVO.getSkillAndQnaHeaderVO();
        //BaseSaveVO<SkillAndQnaDetailVO> skillAndQnaDetailVOList = skillAndQnaSaveVO.getSkillAndQnaDetailVO();

        SkillAndQnaSearchVO searchVO = new SkillAndQnaSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        if(StringUtils.isEmpty(skillAndQnaHeaderVO.getPblmNo())){
            skillAndQnaHeaderDAO.insertSkillAndQnaHeader(skillAndQnaHeaderVO);

        }else{
            skillAndQnaHeaderDAO.updateSkillAndQnaHeader(skillAndQnaHeaderVO);
        }

        //BMP Send Interface
        sendSkillAndQnaHeader(skillAndQnaHeaderVO);

    }



    /*
     * @see chn.bhmc.dms.par.cpm.service.SkillAndQnaHeaderService#sendSkillAndQnaHeader(chn.bhmc.dms.par.cpm.vo.SkillAndQnaHeaderVO)
     */
    @Override
    public void sendSkillAndQnaHeader(SkillAndQnaHeaderVO skillAndQnaHeaderVO) throws Exception {

        if("Y".equals(skillAndQnaHeaderVO.getSendYn())){

            //딜러측 상태요청코드 : 요청:01/수정:02/삭제:03
            String pblmStatCd = skillAndQnaHeaderVO.getPblmStatCd();
            String ifId = "";
            if("01".equals(pblmStatCd)){
                ifId = "PTS508";
            }else if("02".equals(pblmStatCd)){
                ifId = "PTS509";
            }else if("03".equals(pblmStatCd)){
                ifId = "PTS510";
            }else{
                ifId = "";
            }

            if(!StringUtils.isEmpty(pblmStatCd)){
                CamelClient camelClient = camelClientFactory.createCamelClient();
                camelClient.setIfId(ifId); //BMP ID 요청/수정/삭제
                camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
                Map<String, Object> message = null;

                message = new HashMap<String, Object>();

                if("01".equals(pblmStatCd)){//요청시 만 딜러코드 전달.
                    message.put("DEALER_CODE", LoginUtil.getDlrCd());
                }else{//수정/삭제 시 답변문제코드 전달.
                    message.put("CODE", skillAndQnaHeaderVO.getAnswPblmNo());
                }

                message.put("QUESTION_TITLE", skillAndQnaHeaderVO.getTitleNm());
                message.put("VIN", skillAndQnaHeaderVO.getVinNo());

                //기술자문 DMS 차형코드
                //1   ELANTRA_아반떼_5 door
                //2   FDC_I30
                //3   HDC_Elantra
                //4   IX35
                //5   SONATA_NF09MY_쏘나타 트탠드폼
                //6   SONATA_NF_NF 쏘나타
                //7   SONATA_YFC
                //8   SONATA_old style
                //9   TUCSON_투싼
                //10  SONATA_EF 쏘나타
                //11  ERNA_베르나_5 door
                //12  VERNA_베르나_4 door
                //13  ELANTRA_아반떼_4door
                //14  ACCENT_엑센트
                //15  ELANTRA_신형 아반떼
                //16  SANTAFE_타미플루
                //17  MISTRA_미스트라

                message.put("CAR_MODEL_ID", skillAndQnaHeaderVO.getModelCd());

                //1   번호조회_변속기 서브 그룹
                //2   번호조회_엔진 서브 그룹
                //3   번호조회_보드 서브그룹
                //4   번호조회_차체 서브그룹
                //5   번호조회_내부장식 서브그룹
                //6   번호조회_전기기구 서브그룹
                //7   번호조회_실물과 일치하지 않음

                message.put("QUESTION_TYPE", skillAndQnaHeaderVO.getDlrPblmCd());
                message.put("CONTENT", skillAndQnaHeaderVO.getPblmCont());

                message.put("PART_NO", skillAndQnaHeaderVO.getItemCd());
                //get base64 String
                byte[] fileUrl = skillAndQnaHeaderVO.getFileDataCont();
                String base64FileUrlString = new String(fileUrl);
                message.put("FILE_URL", base64FileUrlString);
                message.put("FILE_NAME", skillAndQnaHeaderVO.getFileNm());

                // message add
                camelClient.addSendMessage(message);

                String[] lblList = new String[1];
                try{
                    Data receiveData = camelClient.sendRequest();
                    String ifResult = receiveData.getFooter().getIfResult();

                    if("Z".equals(ifResult)){

                        List<SkillAndQnaResultVO> skillAndQnaResultVOList = receiveData.readMessages(SkillAndQnaResultVO.class);

                        if(skillAndQnaResultVOList.size() > 0){
                            SkillAndQnaResultVO skillAndQnaResultVO = skillAndQnaResultVOList.get(0);

                            //상태코드
                            String status = skillAndQnaResultVO.getStatus();
                            //답변문제코드
                            String code = skillAndQnaResultVO.getCode();

                            if("1".equals(status)){//success

                                //기술자문헤더 답변문제번호 수정.
                                skillAndQnaHeaderVO.setDlrCd(LoginUtil.getDlrCd());
                                skillAndQnaHeaderVO.setUpdtUsrId(LoginUtil.getUserId());
                                skillAndQnaHeaderVO.setAnswPblmNo(code);//답변문제번호
                                skillAndQnaHeaderDAO.updateSkillAndQnaHeader(skillAndQnaHeaderVO);

                            }else{//error

                                if("0".equals(status)){
                                    lblList[0] = messageSource.getMessage("par.lbl.skillQnaIfErrMsg00", null, LocaleContextHolder.getLocale());
                                }else if("-1".equals(status)){
                                    lblList[0] = messageSource.getMessage("par.lbl.skillQnaIfErrMsg01", null, LocaleContextHolder.getLocale());
                                }else if("-2".equals(status)){
                                    lblList[0] = messageSource.getMessage("par.lbl.skillQnaIfErrMsg02", null, LocaleContextHolder.getLocale());
                                }else if("-3".equals(status)){
                                    lblList[0] = messageSource.getMessage("par.lbl.skillQnaIfErrMsg03", null, LocaleContextHolder.getLocale());
                                }else if("-4".equals(status)){
                                    lblList[0] = messageSource.getMessage("par.lbl.skillQnaIfErrMsg04", null, LocaleContextHolder.getLocale());
                                }else if("-5".equals(status)){
                                    lblList[0] = messageSource.getMessage("par.lbl.skillQnaIfErrMsg05", null, LocaleContextHolder.getLocale());
                                }else if("-6".equals(status)){
                                    lblList[0] = messageSource.getMessage("par.lbl.skillQnaIfErrMsg06", null, LocaleContextHolder.getLocale());
                                }else if("-7".equals(status)){
                                    lblList[0] = messageSource.getMessage("par.lbl.skillQnaIfErrMsg07", null, LocaleContextHolder.getLocale());
                                }

                                logger.error("interface error message");
                                throw processException("par.info.skillQnaIfErrMsg", lblList);
                            }
                        }

                    }else{
                        logger.error("skill QnA Interface Failed[sendSkillAndQnaHeader]",receiveData.getFooter().getIfFailMsg());
                        lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
                        throw processException("par.info.skillQnaIfErrMsg", lblList);
                    }
                }catch(Exception ex){
                    logger.error("skill QnA Interface Failed[sendSkillAndQnaHeader]",ex);
                    throw ex;
                }
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SkillAndQnaHeaderService#selectSkillAndQnaHeaderByKey(java.lang.String, java.lang.String)
     */
    @Override
    public SkillAndQnaHeaderVO selectSkillAndQnaHeaderByKey(String dlrCd, String pblmNo) throws Exception {
        return skillAndQnaHeaderDAO.selectSkillAndQnaHeaderByKey(dlrCd, pblmNo);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SkillAndQnaHeaderService#selectSkillAndQnaHeadersByCondition(chn.bhmc.dms.par.cpm.vo.SkillAndQnaSearchVO)
     */
    @Override
    public List<SkillAndQnaHeaderVO> selectSkillAndQnaHeadersByCondition(SkillAndQnaSearchVO searchVO) throws Exception {
        return skillAndQnaHeaderDAO.selectSkillAndQnaHeadersByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SkillAndQnaHeaderService#selectSkillAndQnaHeadersByConditionCnt(chn.bhmc.dms.par.cpm.vo.SkillAndQnaSearchVO)
     */
    @Override
    public int selectSkillAndQnaHeadersByConditionCnt(SkillAndQnaSearchVO searchVO) throws Exception {
        return skillAndQnaHeaderDAO.selectSkillAndQnaHeadersByConditionCnt(searchVO);
    }



}
