package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.CertificationFileService;
import chn.bhmc.dms.par.pmm.service.CertificationInterfaceService;
import chn.bhmc.dms.par.pmm.service.CertificationService;
import chn.bhmc.dms.par.pmm.service.dao.CertificationDAO;
import chn.bhmc.dms.par.pmm.vo.CertificationFileVO;
import chn.bhmc.dms.par.pmm.vo.CertificationSaveVO;
import chn.bhmc.dms.par.pmm.vo.CertificationSearchVO;
import chn.bhmc.dms.par.pmm.vo.CertificationVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


/**
 * <pre>
 * 합격증 관리 서비스 구현 클래스
 * </pre>
 *
 * @ClassName   : CertificationServiceImpl
 * @author Eun Jung Jang
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Eun Jung Jang     최초 생성
 * </pre>
 */

@Service("certificationService")
public class CertificationServiceImpl extends HService implements CertificationService  {

    /**
     * 합격증 관리 DAO
     */
    @Resource(name="certificationDAO")
    CertificationDAO certificationDAO;
    /**
     * 합격증 파일 관리 서비스
     */
    @Resource(name="certificationFileService")
    CertificationFileService certificationFileService;

    /**
     * 합격증 인터페이스 서비스
     */
    @Resource(name="certificationInterfaceService")
    CertificationInterfaceService certificationInterfaceService;

    /**
     * 합격증 키젠
     */
    @Resource(name="certNoIdgenService")
    EgovIdGnrService certNoIdgenService;

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationService#selectCertListByConditionCnt(chn.bhmc.dms.par.pmm.vo.CertificationSearchVO)
     */
    @Override
    public int selectCertListByConditionCnt(CertificationSearchVO searchVO) throws Exception {
        return certificationDAO.selectCertListByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationService#selectCertListByCondition(chn.bhmc.dms.par.pmm.vo.CertificationSearchVO)
     */
    @Override
    public List<CertificationVO> selectCertListByCondition(CertificationSearchVO searchVO) throws Exception {
        return certificationDAO.selectCertListByCondition(searchVO);
    }

    /*
     * 합격증 등록한다.
     * @see chn.bhmc.dms.par.pmm.service.CertificationService#insertCertReq(chn.bhmc.dms.par.pmm.vo.CertificationVO)
     */
    @Override
    public CertificationVO insertCertReq(CertificationVO certificationVO) throws Exception {

        int    resultCnt         = 0;

        certificationVO.setDlrCd(LoginUtil.getDlrCd());
        // 1. 합격증 번호를 생성한다.
        String certNo = selectNextCertNo();
        certificationVO.setCertNo(certNo);

        // 2. 합격증 유형을 설정한다.
       certificationVO.setCertStatCd("01"); //"01" 등록상태 02: 전송 03: 완료

        // 3. 등록인
        certificationVO.setRegUsrId(LoginUtil.getUserId());

        resultCnt = certificationDAO.insertCertReq(certificationVO);

        if(resultCnt < 1){
            //합격증 등록 실패.
            throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("global.lbl.certNo", null, LocaleContextHolder.getLocale())});
        }

        certificationVO.setResultYn(true);

        return certificationVO;

    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationService#insertCertReq(chn.bhmc.dms.par.pmm.vo.CertificationListVO)
     */
    @Override
    public CertificationVO insertCertReq(CertificationSaveVO certificationSaveVO) throws Exception {

        //딜러코드
        certificationSaveVO.getCertificationVO().setDlrCd(LoginUtil.getDlrCd());
        //합격증 번호를 생성.
        String certNo = selectNextCertNo();
        certificationSaveVO.getCertificationVO().setCertNo(certNo);

        //등록자
        certificationSaveVO.getCertificationVO().setRegUsrId(LoginUtil.getUserId());

        CertificationVO certificationVO = certificationSaveVO.getCertificationVO();

        //합격증 헤더 저장.
        certificationDAO.insertCertReq(certificationVO);

        //합격증 파일 저장.
        for(CertificationFileVO certificationFileVO : certificationSaveVO.getCertificationFileList()){
            certificationFileVO.setDlrCd(LoginUtil.getDlrCd());
            certificationFileVO.setCertNo(certNo);
            certificationFileVO.setRegUsrId(LoginUtil.getUserId());
            certificationFileService.insertCertificationFile(certificationFileVO);
        }

        if("Y".equals(certificationSaveVO.getIfSendYn())){
            //BMP 합격증 엔진 처리.
            if("01".equals(certificationSaveVO.getCertificationVO().getCertTp())){//Engine

                if("04".equals(certificationSaveVO.getCertificationVO().getCertStatCd())){
                    //BMP 합격증 엔진 수정
                    certificationInterfaceService.multiCertificationSendEngineUpdate(certificationSaveVO);
                }else if("05".equals(certificationSaveVO.getCertificationVO().getCertStatCd())){
                    //BMP 합격증 엔진 삭제
                    certificationInterfaceService.multiCertificationSendEngineDelete(certificationSaveVO);
                }else if("01".equals(certificationSaveVO.getCertificationVO().getCertStatCd())){
                    //BMP 합격증 엔진 등록.
                    certificationInterfaceService.multiCertificationEngineSend(certificationSaveVO);
                    //BMP 합격증신청번호 수정처리.
                    certificationDAO.updateCertReq(certificationSaveVO.getCertificationVO());
                }

            }else{//BMP 합격증 Body(차체)처리.

                if("04".equals(certificationSaveVO.getCertificationVO().getCertStatCd())){
                    //BMP 합격증 바디 수정.
                    certificationInterfaceService.multiCertificationSendBodyUpdate(certificationSaveVO);
                }else if("05".equals(certificationSaveVO.getCertificationVO().getCertStatCd())){
                    //BMP 합격증 바디 삭제.
                    certificationInterfaceService.multiCertificationSendBodyDelete(certificationSaveVO);
                }else if("01".equals(certificationSaveVO.getCertificationVO().getCertStatCd())){
                    //BMP 합격증 바디 등록.
                    certificationInterfaceService.multiCertificationBodySend(certificationSaveVO);
                    //BMP 합격증신청번호 수정처리.
                    certificationDAO.updateCertReq(certificationSaveVO.getCertificationVO());
                }
            }
        }

        //처리결과 true 처리.
        certificationVO.setResultYn(true);

        return certificationVO;

    }


    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationService#updateCertReq(chn.bhmc.dms.par.pmm.vo.CertificationSaveVO)
     */
    @Override
    public CertificationVO updateCertReq(CertificationSaveVO certificationSaveVO) throws Exception {

        //딜러코드
        certificationSaveVO.getCertificationVO().setDlrCd(LoginUtil.getDlrCd());

        //등록자
        certificationSaveVO.getCertificationVO().setRegUsrId(LoginUtil.getUserId());
        CertificationVO certificationVO = certificationSaveVO.getCertificationVO();
        //합격증 헤더 수정.
        certificationDAO.updateCertReq(certificationVO);

        //합격증 파일 저장.
        for(CertificationFileVO certificationFileVO : certificationSaveVO.getCertificationFileList()){

            CertificationSearchVO certificationSearchVO = new CertificationSearchVO();
            certificationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            certificationSearchVO.setsCertNo(certificationFileVO.getCertNo());
            certificationSearchVO.setsFileSeq(certificationFileVO.getFileSeq());

            certificationFileVO.setDlrCd(LoginUtil.getDlrCd());

            if(certificationFileService.selectCertificationFileCnt(certificationSearchVO) == 0){
                certificationFileService.insertCertificationFile(certificationFileVO);
            }else{
                certificationFileService.updateCertificationFile(certificationFileVO);
            }
        }

        if("Y".equals(certificationSaveVO.getIfSendYn())){
          //BMP 합격증 엔진 처리.
            if("01".equals(certificationSaveVO.getCertificationVO().getCertTp())){//Engine

                if("04".equals(certificationSaveVO.getCertificationVO().getCertStatCd())){
                    //BMP 합격증 엔진 수정
                    certificationInterfaceService.multiCertificationSendEngineUpdate(certificationSaveVO);
                }else if("05".equals(certificationSaveVO.getCertificationVO().getCertStatCd())){
                    //BMP 합격증 엔진 삭제
                    certificationInterfaceService.multiCertificationSendEngineDelete(certificationSaveVO);
                }else if("01".equals(certificationSaveVO.getCertificationVO().getCertStatCd())){
                    //BMP 합격증 엔진 등록.
                    if(certificationSaveVO.getCertificationVO().getCertReqNo().equals("")){
                        certificationInterfaceService.multiCertificationEngineSend(certificationSaveVO);
                        //BMP 합격증신청번호 수정처리.
                        certificationDAO.updateCertReq(certificationSaveVO.getCertificationVO());
                    }else{
                        certificationInterfaceService.multiCertificationSendEngineUpdate(certificationSaveVO);
                    }
                }

            }else{//BMP 합격증 Body(차체)처리.

                if("04".equals(certificationSaveVO.getCertificationVO().getCertStatCd())){
                    //BMP 합격증 바디 수정.
                    certificationInterfaceService.multiCertificationSendBodyUpdate(certificationSaveVO);
                }else if("05".equals(certificationSaveVO.getCertificationVO().getCertStatCd())){
                    //BMP 합격증 바디 삭제.
                    certificationInterfaceService.multiCertificationSendBodyDelete(certificationSaveVO);
                }else if("01".equals(certificationSaveVO.getCertificationVO().getCertStatCd())){
                    //BMP 합격증 바디 등록.
                    if(StringUtils.isEmpty(certificationSaveVO.getCertificationVO().getCertReqNo())){
                        certificationInterfaceService.multiCertificationBodySend(certificationSaveVO);
                        //BMP 합격증신청번호 수정처리.
                        certificationDAO.updateCertReq(certificationSaveVO.getCertificationVO());
                    }else{
                        //BMP 합격증 바디 수정.
                        certificationInterfaceService.multiCertificationSendBodyUpdate(certificationSaveVO);
                    }
                }
            }
        }

        //처리결과 true 처리.
        certificationVO.setResultYn(true);

        return certificationVO;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationService#selectNextCertNo()
     */
    @Override
    public String selectNextCertNo() throws Exception {
        try {
            return certNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("global.lbl.ordNo", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationService#selectCertReqByKey(chn.bhmc.dms.par.pmm.vo.CertificationSearchVO)
     */
    @Override
    public CertificationVO selectCertReqByKey(CertificationSearchVO certificationSearchVO) throws Exception {
        return certificationDAO.selectCertReqByKey(certificationSearchVO);
    }




}
