package chn.bhmc.dms.par.pmm.service.impl;

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
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.CertificationInterfaceService;
import chn.bhmc.dms.par.pmm.vo.CertificationFileVO;
import chn.bhmc.dms.par.pmm.vo.CertificationResultVO;
import chn.bhmc.dms.par.pmm.vo.CertificationSaveVO;
import chn.bhmc.dms.par.pmm.vo.CertificationVO;


/**
 * <pre>
 * 합격증 인터페이스 서비스 구현 클래스
 * </pre>
 *
 * @ClassName   : CertificationInterfaceServiceImpl
 * @author In Bo Shim
 * @since 2016. 11. 07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 09.  In Bo Shim     최초 생성
 * </pre>
 */

@Service("certificationInterfaceService")
public class CertificationInterfaceServiceImpl extends HService implements CertificationInterfaceService  {

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    private static final Logger LOGGER = LoggerFactory.getLogger(CertificationInterfaceServiceImpl.class);

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationInterfaceService#multiCertificationSend(chn.bhmc.dms.par.pmm.vo.CertificationSaveVO)
     */
    @Override
    public void multiCertificationEngineSend(CertificationSaveVO certificationSaveVO) throws Exception {

        CertificationVO certificationVO = certificationSaveVO.getCertificationVO();

        CamelClient camelClient = camelClientFactory.createCamelClient();

        /*
         * 신규 차체, 엔진 IF_ID 리스트
         * PTS520 신규 엔진합격증정보    (O)

         * PTS619 엔진 합격증 심사 정보
         * PTS620 엔진 합격증 처리 결과
         * */

        camelClient.setIfId("PTS520");//Cerification Engine Interface Code
        camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd

        Map<String, Object> message = new HashMap<String, Object>();

        /*
         * 등록 : 01 시 ENGINE_APPLY_ORDER_NO 전송
         * */

        message.put("DEALER_CODE", LoginUtil.getDlrCd());
        message.put("TELEPHONE", certificationVO.getTelNo());
        message.put("APPLY_NAME", certificationVO.getCustNm());
        message.put("ZIP_CODE","");
        message.put("MOBILE",certificationVO.getHpNo());
        //message.put("ENGINE_APPLY_ORDER_NO", certificationVO.getCertNo());
        message.put("ENGINE_APPLY_ORDER_NO", certificationVO.getOrdNo());
        message.put("PARTS_CODE", certificationVO.getItemCd());
        message.put("VIN_CODE", certificationVO.getBaseVinNo());
        message.put("APPLY_DESCRIPTION", certificationVO.getDetlCont());
        //파일정보
        for(CertificationFileVO certificationFileVO: certificationSaveVO.getCertificationFileList()){

            if(certificationFileVO.getFileSeq() == 1){
                if(!StringUtils.isEmpty(certificationFileVO.getFileNm())){

                    byte[] fileUrl01 = certificationFileVO.getFileDataCont();
                    String base64FileUrlString01 = new String(fileUrl01);

                    message.put("ENGINE_CYLINDER_PHOTO", base64FileUrlString01);
                    message.put("ENGINE_CYLINDER", certificationFileVO.getEnginCylNo());
                    message.put("ENGINE_PHOTO_NAME", certificationFileVO.getFileNm());
                    //message.put("ENGINE_CYLINDER_NAME", certificationFileVO.getFileNm());
                }else{
                    message.put("ENGINE_CYLINDER_PHOTO", "");
                    message.put("ENGINE_CYLINDER", "");
                    message.put("ENGINE_PHOTO_NAME", "");
                    //message.put("ENGINE_CYLINDER_NAME", "");
                }
            }

            if(certificationFileVO.getFileSeq() == 2){
                if(!StringUtils.isEmpty(certificationFileVO.getFileNm())){

                    byte[] fileUrl02 = certificationFileVO.getFileDataCont();
                    String base64FileUrlString02 = new String(fileUrl02);

                    message.put("NEW_ENGINE_CYLINDER_PHOTO", base64FileUrlString02);
                    message.put("NEW_ENGINE_CYLINDER", certificationFileVO.getEnginCylNo());
                    message.put("NEW_ENGINE_PHOTO_NAME", certificationFileVO.getFileNm());
                    //message.put("NEW_ENGINE_CYLINDER_NAME", certificationFileVO.getFileNm());
                }else{
                    message.put("NEW_ENGINE_CYLINDER_PHOTO", "");
                    message.put("NEW_ENGINE_CYLINDER", "");
                    message.put("NEW_ENGINE_PHOTO_NAME", "");
                    //message.put("NEW_ENGINE_CYLINDER_NAME", "");
                }
            }

            if(certificationFileVO.getFileSeq() == 3){
                if(!StringUtils.isEmpty(certificationFileVO.getFileNm())){

                    byte[] fileUrl03 = certificationFileVO.getFileDataCont();
                    String base64FileUrlString03 = new String(fileUrl03);

                    message.put("OTHER_ACCESSORIES", base64FileUrlString03);
                    message.put("OTHER_FILE_NAME", certificationFileVO.getFileNm());
                }else{
                    message.put("OTHER_ACCESSORIES", "");
                    message.put("OTHER_FILE_NAME", "");
                }
            }
        }

        message.put("SUBMIT_TYPE", "1");//저장유형(0:임시저장 1:전송)

        // message add
        camelClient.addSendMessage(message);

        String[] lblList = new String[1];
        try{
            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();

            if("Z".equals(ifResult)){
                //합격증 등록 시 전송결과

                List<CertificationResultVO> certificationResultVOList = receiveData.readMessages(CertificationResultVO.class);

                if(certificationResultVOList.size() > 0){
                    CertificationResultVO certificationResultVO = certificationResultVOList.get(0);

                    //상태코드
                    String status = certificationResultVO.getStatus();
                    //엔진합격증신청서코드
                    String applyCode = certificationResultVO.getApply_code();
                    certificationSaveVO.getCertificationVO().setCertReqNo(applyCode);

                    if("1".equals(status)){//저장성공

                    }else{//error

                        if("0".equals(status)){//사용자ID 또는 패스워드 미입력
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMsg00", null, LocaleContextHolder.getLocale());
                        }else if("-1".equals(status)){//사용자ID 패스워드 오류
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg01", null, LocaleContextHolder.getLocale());
                        }else if("-2".equals(status)){//xml해석실패，xml양식 Encapsulation 부정확
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg02", null, LocaleContextHolder.getLocale());
                        }else if("-3".equals(status)){//딜러정보 오류，딜러코드 체크 바람
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg03", null, LocaleContextHolder.getLocale());
                        }else if("-6".equals(status)){//업로드 파일용량 5MB보다 작아야 함！
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg06", null, LocaleContextHolder.getLocale());
                        }else if("-7".equals(status)){//파일양식 부정확
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg07", null, LocaleContextHolder.getLocale());
                        }else if("-8".equals(status)){//저장실패
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg08", null, LocaleContextHolder.getLocale());
                        }

                        throw processException("par.info.skillQnaIfErrMsg", lblList);
                    }
                }

            }else{
                LOGGER.error("certification Interface Failed[multiCertificationEngineSend]",receiveData.getFooter().getIfFailMsg());
                lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
                throw processException("par.info.skillQnaIfErrMsg", lblList);
            }
        }catch(Exception ex){
            LOGGER.error("certification Interface Failed[multiCertificationEngineSend]",ex);
            throw ex;
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationInterfaceService#multiCertificationSendUpdate(chn.bhmc.dms.par.pmm.vo.CertificationSaveVO)
     */
    @Override
    public void multiCertificationSendEngineUpdate(CertificationSaveVO certificationSaveVO) throws Exception {
        CertificationVO certificationVO = certificationSaveVO.getCertificationVO();

        CamelClient camelClient = camelClientFactory.createCamelClient();

        /*
         * 신규 차체, 엔진 IF_ID 리스트
         * PTS521 엔진합격증정보 수정    (O)
         *
         * PTS619 엔진 합격증 심사 정보
         * PTS620 엔진 합격증 처리 결과
         * */

        camelClient.setIfId("PTS521");//Cerification Engine Interface Code
        camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd

        Map<String, Object> message = new HashMap<String, Object>();

        /*
         * 수정 : 04 시 ENGINE_APPLY_ORDER_NO 빼고 ENGINE_APPLY_ORDER_CODE 합격신청코드 전송.
         * */

        message.put("DEALER_CODE", LoginUtil.getDlrCd());
        message.put("TELEPHONE", certificationVO.getTelNo());
        message.put("ZIP_CODE",certificationVO.getZipCd());
        message.put("APPLY_NAME", certificationVO.getCustNm());
        message.put("MOBILE",certificationVO.getHpNo());
        //message.put("ENGINE_APPLY_ORDER_CODE", certificationVO.getCertReqNo());
        message.put("ENGINE_APPLY_ORDER_CODE", certificationVO.getOrdNo());
        message.put("CODE", certificationVO.getCertReqNo());
        message.put("PARTS_CODE", certificationVO.getItemCd());
        message.put("VIN_CODE", certificationVO.getBaseVinNo());
        message.put("APPLY_DESCRIPTION", certificationVO.getDetlCont());

        for(CertificationFileVO certificationFileVO: certificationSaveVO.getCertificationFileList()){

            if(certificationFileVO.getFileSeq() == 1){
                if(!StringUtils.isEmpty(certificationFileVO.getFileNm())){

                    byte[] fileUrl01 = certificationFileVO.getFileDataCont();
                    String base64FileUrlString01 = new String(fileUrl01);

                    message.put("ENGINE_CYLINDER_PHOTO", base64FileUrlString01);
                    message.put("ENGINE_CYLINDER", certificationFileVO.getEnginCylNo());
                    message.put("ENGINE_PHOTO_NAME", certificationFileVO.getFileNm());
                    //message.put("ENGINE_CYLINDER_NAME", certificationFileVO.getFileNm());
                }else{
                    message.put("ENGINE_CYLINDER_PHOTO", "");
                    message.put("ENGINE_CYLINDER", "");
                    message.put("ENGINE_PHOTO_NAME", "");
                    //message.put("ENGINE_CYLINDER_NAME", "");
                }
            }

            if(certificationFileVO.getFileSeq() == 2){
                if(!StringUtils.isEmpty(certificationFileVO.getFileNm())){

                    byte[] fileUrl02 = certificationFileVO.getFileDataCont();
                    String base64FileUrlString02 = new String(fileUrl02);

                    message.put("NEW_ENGINE_CYLINDER_PHOTO", base64FileUrlString02);
                    message.put("NEW_ENGINE_CYLINDER", certificationFileVO.getEnginCylNo());
                    //message.put("NEW_ENGINE_CYLINDER_NAME", certificationFileVO.getFileNm());
                    message.put("NEW_ENGINE_PHOTO_NAME", certificationFileVO.getFileNm());
                }else{
                    message.put("NEW_ENGINE_CYLINDER_PHOTO", "");
                    message.put("NEW_ENGINE_CYLINDER", "");
                    //message.put("NEW_ENGINE_CYLINDER_NAME", "");
                    message.put("NEW_ENGINE_PHOTO_NAME", "");
                }
            }

            if(certificationFileVO.getFileSeq() == 3){
                if(!StringUtils.isEmpty(certificationFileVO.getFileNm())){

                    byte[] fileUrl03 = certificationFileVO.getFileDataCont();
                    String base64FileUrlString03 = new String(fileUrl03);

                    message.put("OTHER_ACCESSORIES", base64FileUrlString03);
                    message.put("OTHER_FILE_NAME", certificationFileVO.getFileNm());
                }else{
                    message.put("OTHER_ACCESSORIES", "");
                    message.put("OTHER_FILE_NAME", "");
                }
            }
        }

        message.put("SUBMIT_TYPE", "1");//저장유형(0:임시저장 1:전송)

        // message add
        camelClient.addSendMessage(message);

        String[] lblList = new String[1];
        try{
            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();

            if("Z".equals(ifResult)){
                //합격증 수정 시 전송결과

                List<CertificationResultVO> certificationResultVOList = receiveData.readMessages(CertificationResultVO.class);

                if(certificationResultVOList.size() > 0){
                    CertificationResultVO certificationResultVO = certificationResultVOList.get(0);

                    //상태코드
                    String status = certificationResultVO.getStatus();

                    if("1".equals(status)){//success

                    }else{//error

                        if("0".equals(status)){//사용자ID 또는 패스워드 미입력
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMsg00", null, LocaleContextHolder.getLocale());
                        }else if("-1".equals(status)){//사용자ID 패스워드 오류
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg01", null, LocaleContextHolder.getLocale());
                        }else if("-2".equals(status)){//xml해석실패，xml양식 Encapsulation 부정확
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg02", null, LocaleContextHolder.getLocale());
                        }else if("-3".equals(status)){//딜러정보 오류，딜러코드 체크 바람
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg03", null, LocaleContextHolder.getLocale());
                        }else if("-4".equals(status)){//해당 엔진합격증 존재하지 않음. 체크 바람
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg04", null, LocaleContextHolder.getLocale());
                        }else if("-5".equals(status)){//해당 엔진합격증신청서 처리중, 수정 불가.
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg05", null, LocaleContextHolder.getLocale());
                        }else if("-6".equals(status)){//업로드 파일용량 5MB보다 작아야 함！
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg06", null, LocaleContextHolder.getLocale());
                        }else if("-7".equals(status)){//파일양식 부정확
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg07", null, LocaleContextHolder.getLocale());
                        }else if("-8".equals(status)){//저장실패
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg08", null, LocaleContextHolder.getLocale());
                        }

                        throw processException("par.info.skillQnaIfErrMsg", lblList);
                    }
                }

            }else{
                LOGGER.error("certification Interface Failed[multiCertificationSendEngineUpdate]",receiveData.getFooter().getIfFailMsg());
                lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
                throw processException("par.info.skillQnaIfErrMsg", lblList);
            }
        }catch(Exception ex){
            LOGGER.error("certification Interface Failed[multiCertificationSendEngineUpdate]",ex);
            throw ex;
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationInterfaceService#multiCertificationSendDelete(chn.bhmc.dms.par.pmm.vo.CertificationSaveVO)
     */
    @Override
    public void multiCertificationSendEngineDelete(CertificationSaveVO certificationSaveVO) throws Exception {

        CertificationVO certificationVO = certificationSaveVO.getCertificationVO();

        CamelClient camelClient = camelClientFactory.createCamelClient();

        /*
         * 신규 차체, 엔진 IF_ID 리스트
         * PTS522 엔진합격증정보 삭제    (O)
         *
         * PTS619 엔진 합격증 심사 정보
         * PTS620 엔진 합격증 처리 결과
         * */

        camelClient.setIfId("PTS522");//Cerification Engine Interface Code
        camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd

        Map<String, Object> message = new HashMap<String, Object>();

        /*
         * 삭제 : 05 시 ENGINE_APPLY_ORDER_CODE 만 전송.
         * */

        message.put("CODE", certificationVO.getCertReqNo());

        // message add
        camelClient.addSendMessage(message);

        String[] lblList = new String[1];
        try{
            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();

            if("Z".equals(ifResult)){
                //합격증 삭제 시 전송결과
                List<CertificationResultVO> certificationResultVOList = receiveData.readMessages(CertificationResultVO.class);

                if(certificationResultVOList.size() > 0){
                    CertificationResultVO certificationResultVO = certificationResultVOList.get(0);

                    //상태코드
                    String status = certificationResultVO.getStatus();
                    //엔진합격증신청서코드
                    String applyCode = certificationResultVO.getApply_code();
                    certificationSaveVO.getCertificationVO().setCertReqNo(applyCode);

                    if("1".equals(status)){//success

                    }else{//error

                        if("0".equals(status)){//사용자ID 또는 패스워드 미입력
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMsg00", null, LocaleContextHolder.getLocale());
                        }else if("-1".equals(status)){//사용자ID 패스워드 오류
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg01", null, LocaleContextHolder.getLocale());
                        }else if("-2".equals(status)){//xml해석실패，xml양식 Encapsulation 부정확
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg02", null, LocaleContextHolder.getLocale());
                        }else if("-3".equals(status)){//딜러정보 오류，딜러코드 체크 바람
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg03", null, LocaleContextHolder.getLocale());
                        }else if("-4".equals(status)){//해당 엔진합격증 존재하지 않음. 체크 바람
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg04", null, LocaleContextHolder.getLocale());
                        }else if("-5".equals(status)){//해당 엔진합격증신청서 처리중, 수정 불가.
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg05", null, LocaleContextHolder.getLocale());
                        }else if("-6".equals(status)){//업로드 파일용량 5MB보다 작아야 함！
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg06", null, LocaleContextHolder.getLocale());
                        }else if("-7".equals(status)){//파일양식 부정확
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg07", null, LocaleContextHolder.getLocale());
                        }else if("-8".equals(status)){//삭제실패
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg09", null, LocaleContextHolder.getLocale());
                        }

                        throw processException("par.info.skillQnaIfErrMsg", lblList);
                    }
                }

            }else{
                LOGGER.error("certification Interface Failed[multiCertificationSendEngineDelete]",receiveData.getFooter().getIfFailMsg());
                lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
                throw processException("par.info.skillQnaIfErrMsg", lblList);
            }
        }catch(Exception ex){
            LOGGER.error("certification Interface Failed[multiCertificationSendEngineDelete]",ex);
            throw ex;
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationInterfaceService#multiCertificationBodySend(chn.bhmc.dms.par.pmm.vo.CertificationSaveVO)
     */
    @Override
    public void multiCertificationBodySend(CertificationSaveVO certificationSaveVO) throws Exception {

        CertificationVO certificationVO = certificationSaveVO.getCertificationVO();

        CamelClient camelClient = camelClientFactory.createCamelClient();

        /*
         * 신규 차체, 엔진 IF_ID 리스트
         * PTS517 신규 차체(바디)합격증 정보
         * PTS518 차체합격증 정보 수정
         * PTS519 차체합격증정보 삭제
         * PTS520 신규 엔진합격증정보
         * PTS521 엔진합격증정보 수정
         * PTS522 엔진합격증정보 삭제
         *
         * PTS617 차체 합격증 심사 정보
         * PTS618 차체 합격증 처리 결과
         * PTS619 엔진 합격증 심사 정보
         * PTS620 엔진 합격증 처리 결과
         * */

        camelClient.setIfId("PTS517");//Cerification Body Interface Code
        camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd

        Map<String, Object> message = new HashMap<String, Object>();

        /*
         * 등록 : 01 시 ENGINE_APPLY_ORDER_NO 전송
         * 수정 : 04 시 ENGINE_APPLY_ORDER_NO 빼고 ENGINE_APPLY_ORDER_CODE 합격신청코드 전송.
         * 수정 : 05 시 ENGINE_APPLY_ORDER_CODE 만 전송.
         * */

        message.put("DEALER_CODE", LoginUtil.getDlrCd());
        message.put("TELEPHONE", certificationVO.getTelNo());
        message.put("ZIP_CODE","");
        message.put("MOBILE",certificationVO.getHpNo());
        message.put("ORDERS_CODE", certificationVO.getOrdNo());//주문번호(수기입력)
        message.put("PARTS_CODE", certificationVO.getItemCd());
        message.put("VIN_CODE", certificationVO.getBaseVinNo());

        message.put("SEND_NAMEPLATE", "");//TODO:[InBoShim] 차체 VIN번호 분할부품 및 명패 우편발송 . 데이타 확인.

        message.put("APPLY_DESCRIPTION", certificationVO.getDetlCont());
        message.put("NEW_VIN_CD", certificationVO.getNewVinNo());
        message.put("SUBMIT_TYPE", "1");//저장유형(0:임시저장 1:전송)

        // message add
        camelClient.addSendMessage(message);

        String[] lblList = new String[1];
        try{
            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();

            if("Z".equals(ifResult)){
                //엔진(차체)등록 전송결과

                List<CertificationResultVO> certificationResultVOList = receiveData.readMessages(CertificationResultVO.class);

                if(certificationResultVOList.size() > 0){
                    CertificationResultVO certificationResultVO = certificationResultVOList.get(0);

                    //상태코드
                    String status = certificationResultVO.getStatus();
                    //엔진합격증신청서코드
                    String applyCode = certificationResultVO.getApply_code();
                    certificationSaveVO.getCertificationVO().setCertReqNo(applyCode);

                    if("1".equals(status)){//success

                    }else{//error

                        if("0".equals(status)){//사용자ID 또는 패스워드 미입력
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMsg00", null, LocaleContextHolder.getLocale());
                        }else if("-1".equals(status)){//사용자ID 패스워드 오류
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg01", null, LocaleContextHolder.getLocale());
                        }else if("-2".equals(status)){//xml해석실패，xml양식 Encapsulation 부정확
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg02", null, LocaleContextHolder.getLocale());
                        }else if("-3".equals(status)){//딜러정보 오류，딜러코드 체크 바람
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg03", null, LocaleContextHolder.getLocale());
                        }else if("-4".equals(status)){//해당 차체합격증 존재안함. 체크바람.
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg04", null, LocaleContextHolder.getLocale());
                        }else if("-5".equals(status)){//해당 차체합격증신청서 처리중, 수정 불허가.
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg05", null, LocaleContextHolder.getLocale());
                        }else if("-7".equals(status)){//저장실패
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg08", null, LocaleContextHolder.getLocale());
                        }

                        throw processException("par.info.skillQnaIfErrMsg", lblList);
                    }
                }

            }else{
                LOGGER.error("certification Interface Failed[multiCertificationBodySend]",receiveData.getFooter().getIfFailMsg());
                lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
                throw processException("par.info.skillQnaIfErrMsg", lblList);
            }
        }catch(Exception ex){
            LOGGER.error("certification Interface Failed[multiCertificationBodySend]",ex);
            throw ex;
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationInterfaceService#multiCertificationSendBodyUpdate(chn.bhmc.dms.par.pmm.vo.CertificationSaveVO)
     */
    @Override
    public void multiCertificationSendBodyUpdate(CertificationSaveVO certificationSaveVO) throws Exception {

        CertificationVO certificationVO = certificationSaveVO.getCertificationVO();

        CamelClient camelClient = camelClientFactory.createCamelClient();

        /*
         * 신규 차체, 엔진 IF_ID 리스트
         * PTS518 차체합격증 정보 수정

         * PTS617 차체 합격증 심사 정보
         * PTS618 차체 합격증 처리 결과
         * */

        camelClient.setIfId("PTS518");//Cerification Body Interface Code
        camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd

        Map<String, Object> message = new HashMap<String, Object>();

        message.put("DEALER_CODE", LoginUtil.getDlrCd());
        message.put("TELEPHONE", certificationVO.getTelNo());
        message.put("ZIP_CODE","");
        message.put("MOBILE",certificationVO.getHpNo());
        message.put("ORDERS_CODE", certificationVO.getOrdNo());//주문번호(수기입력)
        message.put("CODE", certificationVO.getCertReqNo());//차체합격증신청서코드
        message.put("PARTS_CODE", certificationVO.getItemCd());
        message.put("VIN_CODE", certificationVO.getBaseVinNo());

        message.put("SEND_NAMEPLATE", "");//TODO:[InBoShim] 차체 VIN번호 분할부품 및 명패 우편발송 . 데이타 확인.

        message.put("APPLY_DESCRIPTION", certificationVO.getDetlCont());
        message.put("NEW_VIN_CD", certificationVO.getNewVinNo());
        message.put("SUBMIT_TYPE", "1");//저장유형(0:임시저장 1:전송)

        // message add
        camelClient.addSendMessage(message);

        String[] lblList = new String[1];
        try{
            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();

            if("Z".equals(ifResult)){
                //엔진(차체)등록 전송결과

                List<CertificationResultVO> certificationResultVOList = receiveData.readMessages(CertificationResultVO.class);

                if(certificationResultVOList.size() > 0){
                    CertificationResultVO certificationResultVO = certificationResultVOList.get(0);

                    //상태코드
                    String status = certificationResultVO.getStatus();
                    //엔진합격증신청서코드
                    String applyCode = certificationResultVO.getApply_code();
                    certificationSaveVO.getCertificationVO().setCertReqNo(applyCode);

                    if("1".equals(status)){//success

                    }else{//error

                        if("0".equals(status)){//사용자ID 또는 패스워드 미입력
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMsg00", null, LocaleContextHolder.getLocale());
                        }else if("-1".equals(status)){//사용자ID 패스워드 오류
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg01", null, LocaleContextHolder.getLocale());
                        }else if("-2".equals(status)){//xml해석실패，xml양식 Encapsulation 부정확
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg02", null, LocaleContextHolder.getLocale());
                        }else if("-3".equals(status)){//딜러정보 오류，딜러코드 체크 바람
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg03", null, LocaleContextHolder.getLocale());
                        }else if("-4".equals(status)){//해당 차체합격증 존재안함. 체크바람.
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg04", null, LocaleContextHolder.getLocale());
                        }else if("-5".equals(status)){//해당 차체합격증신청서 처리중, 수정 불허가.
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg05", null, LocaleContextHolder.getLocale());
                        }else if("-7".equals(status)){//저장실패
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg08", null, LocaleContextHolder.getLocale());
                        }

                        throw processException("par.info.skillQnaIfErrMsg", lblList);
                    }
                }

            }else{
                LOGGER.error("certification Interface Failed[multiCertificationSendBodyUpdate]",receiveData.getFooter().getIfFailMsg());
                lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
                throw processException("par.info.skillQnaIfErrMsg", lblList);
            }
        }catch(Exception ex){
            LOGGER.error("certification Interface Failed[multiCertificationSendBodyUpdate]",ex);
            throw ex;
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationInterfaceService#multiCertificationSendBodyDelete(chn.bhmc.dms.par.pmm.vo.CertificationSaveVO)
     */
    @Override
    public void multiCertificationSendBodyDelete(CertificationSaveVO certificationSaveVO) throws Exception {

        CertificationVO certificationVO = certificationSaveVO.getCertificationVO();

        CamelClient camelClient = camelClientFactory.createCamelClient();

        /*
         * 신규 차체, 엔진 IF_ID 리스트
         * PTS519 차체합격증정보 삭제
         *
         * PTS617 차체 합격증 심사 정보
         * PTS618 차체 합격증 처리 결과
         * */

        camelClient.setIfId("PTS519");//Cerification Body Interface Code
        camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd

        Map<String, Object> message = new HashMap<String, Object>();

        /*
         * 등록 : 01 시 ENGINE_APPLY_ORDER_NO 전송
         * 수정 : 04 시 ENGINE_APPLY_ORDER_NO 빼고 ENGINE_APPLY_ORDER_CODE 합격신청코드 전송.
         * 수정 : 05 시 ENGINE_APPLY_ORDER_CODE 만 전송.
         * */

        message.put("CODE", certificationVO.getCertReqNo());//차체합격증신청서코드

        // message add
        camelClient.addSendMessage(message);

        String[] lblList = new String[1];
        try{
            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();

            if("Z".equals(ifResult)){
                //합격증 차체 삭제 전송결과

                List<CertificationResultVO> certificationResultVOList = receiveData.readMessages(CertificationResultVO.class);

                if(certificationResultVOList.size() > 0){
                    CertificationResultVO certificationResultVO = certificationResultVOList.get(0);

                    //상태코드
                    String status = certificationResultVO.getStatus();

                    if("1".equals(status)){//success

                    }else{//error

                        if("0".equals(status)){//사용자ID 또는 패스워드 미입력
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMsg00", null, LocaleContextHolder.getLocale());
                        }else if("-1".equals(status)){//사용자ID 패스워드 오류
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg01", null, LocaleContextHolder.getLocale());
                        }else if("-2".equals(status)){//xml해석실패，xml양식 Encapsulation 부정확
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg02", null, LocaleContextHolder.getLocale());
                        }else if("-3".equals(status)){//딜러정보 오류，딜러코드 체크 바람
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg03", null, LocaleContextHolder.getLocale());
                        }else if("-4".equals(status)){//해당 엔진합격증 존재하지 않음. 체크 바람
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg04", null, LocaleContextHolder.getLocale());
                        }else if("-5".equals(status)){//해당 엔진합격증신청서 처리중, 수정 불가.
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg05", null, LocaleContextHolder.getLocale());
                        }else if("-6".equals(status)){//업로드 파일용량 5MB보다 작아야 함！
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg06", null, LocaleContextHolder.getLocale());
                        }else if("-7".equals(status)){//파일양식 부정확
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg07", null, LocaleContextHolder.getLocale());
                        }else if("-8".equals(status)){//삭제실패
                            lblList[0] = messageSource.getMessage("par.lbl.certItemIfErrMinusMsg09", null, LocaleContextHolder.getLocale());
                        }

                        throw processException("par.info.skillQnaIfErrMsg", lblList);
                    }
                }

            }else{
                LOGGER.error("certification Interface Failed[multiCertificationSendBodyDelete]",receiveData.getFooter().getIfFailMsg());
                lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
                throw processException("par.info.skillQnaIfErrMsg", lblList);
            }
        }catch(Exception ex){
            LOGGER.error("certification Interface Failed[multiCertificationSendBodyDelete]",ex);
            throw ex;
        }
    }
}
