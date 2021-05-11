package chn.bhmc.dms.ser.wac.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.vo.LtsModelMappingVO;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;
import chn.bhmc.dms.ser.wac.service.PwaApproveService;
import chn.bhmc.dms.ser.wac.service.SanbaoReturnApproveService;
import chn.bhmc.dms.ser.wac.service.dao.PwaApproveDAO;
import chn.bhmc.dms.ser.wac.vo.PwaLbrVO;
import chn.bhmc.dms.ser.wac.vo.PwaPartVO;
import chn.bhmc.dms.ser.wac.vo.PwaSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoReturnVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaApproveServiceImpl.java
 * @Description : PWA 승인 구현클래스
 * @author Kwon Ki Hyun
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("pwaApproveService")
public class PwaApproveServiceImpl extends HService implements PwaApproveService{

    @Resource(name="pwaApproveDAO")
    PwaApproveDAO pwaApproveDAO;

    /**
     * LTS MODEL SERVICE
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    @Resource(name="pwaApproveNoIdgenService")
    TableIdGenService pwaApproveNoIdgenService;

    /**
     * 삼포 반품승인 서비스
     */
    @Autowired
    SanbaoReturnApproveService sanbaoReturnApproveService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * PWA 승인 상태를 수정한다.
     * Statements
     *
     * @param pwaVO
     * @return
     * @throws Exception
     */
    public PwaVO updateStatePwaApproves(PwaVO pwaVO) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        String pwaApproveNo = "";
        if(pwaVO.getPwaStatCd().equals("A")){ //승인일경우
            pwaApproveNo = pwaApproveNoIdgenService.getNextStringId();

            pwaVO.setPwaApproveNo(pwaApproveNo);
            pwaVO.setHqApproveId(LoginUtil.getUserId());
            pwaVO.setUpdtUsrId(LoginUtil.getUserId());
            pwaVO.setHqApproveNm(LoginUtil.getUserNm());

            String pattern = dateFormat + " HH:mm:ss";
            Date toDate = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);
            pwaVO.setHqApproveDt(toDate);

        }

        updateSanboRtnApprove(pwaVO);
        pwaApproveDAO.updateStatePwaApproves(pwaVO);

        return pwaVO;
    }

    public int updateSanboRtnApprove(PwaVO pwaVO)throws Exception{

        int resultCnt = 0;
        if(!StringUtil.nullConvert(pwaVO.getReturnApproveNo()).equals("")){

            /** 승인된 삼포 반품  NO 를 사용한다.**/

            SanbaoReturnVO sanbaoReturnVO = new SanbaoReturnVO();
            sanbaoReturnVO.setDlrCd(pwaVO.getDlrCd());
            sanbaoReturnVO.setVinNo(pwaVO.getVinNo());
            sanbaoReturnVO.setReturnApproveNo( pwaVO.getReturnApproveNo() );
          //  sanbaoReturnVO.setPwaUseYn( (pwaVO.getReturnApproveNo().equals("") ? "N" : "Y"));
            sanbaoReturnVO.setPwaUseYn("N");
            sanbaoReturnVO.setPwaApproveNo(pwaVO.getPwaApproveNo());
            sanbaoReturnVO.setUpdtUsrId(pwaVO.getUpdtUsrId());
            resultCnt = sanbaoReturnApproveService.updateSanbaoReturnApprovePWA(sanbaoReturnVO);
        }

        return resultCnt;
    }


    /**
     *
     * PWA 승인 데이터 목록수 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
     * @return PWA 승인 데이터 목록수
     * @throws Exception
     */
    public int selectPwaApproveMainsByConditionCnt(PwaSearchVO searchVO) throws Exception {

        return pwaApproveDAO.selectPwaApproveMainsByConditionCnt(searchVO);
    }

    /**
    *
    * PWA 승인 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 승인 목록 데이터
    * @throws Exception
    */
    public List<PwaVO> selectPwaApproveMainsByCondition(PwaSearchVO searchVO) throws Exception {

        return pwaApproveDAO.selectPwaApproveMainsByCondition(searchVO);
    }


   /**
    *
    * PWA 상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 상세 정보 데이터
    * @throws Exception
    */
    public PwaVO selectPwaApproveByKey(PwaSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        //searchVO.setsLtsModelCd(ltsModelMappingService.selectLtsModelMapping(searchVO.getsVinNo()));
        LtsModelSearchVO ltsModelsearchVO = new LtsModelSearchVO();
        ltsModelsearchVO.setsVinNo(searchVO.getsVinNo());
        LtsModelMappingVO ltsMappingVO =  ltsModelMappingService.selectMappingLtsModelCdByKey(ltsModelsearchVO);
        searchVO.setsLtsModelCd(ltsMappingVO.getLtsModelCd());


        return pwaApproveDAO.selectPwaApproveByKey(searchVO);
    }

    /**
    *
    * PWA 공임 정보 데이터 갯수 를  조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터 갯수
    * @throws Exception
    */
    public int selectPwaApproveLbrsByConditionCnt(PwaSearchVO searchVO) throws Exception {

        return pwaApproveDAO.selectPwaApproveLbrsByConditionCnt(searchVO);
    }

    /**
    *
    * PWA 공임 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터
    * @throws Exception
    */
    public List<PwaLbrVO> selectPwaApproveLbrsByCondition(PwaSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return pwaApproveDAO.selectPwaApproveLbrsByCondition(searchVO);
    }

    /**
    *
    * PWA 부품 정보 데이터 갯수 를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터 갯수
    * @throws Exception
    */
    public int selectPwaApprovePartsByConditionCnt(PwaSearchVO searchVO) throws Exception {

        return pwaApproveDAO.selectPwaApprovePartsByConditionCnt(searchVO);
    }

    /**
    *
    * PWA 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터
    * @throws Exception
    */
    public List<PwaPartVO> selectPwaApprovePartsByCondition(PwaSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return pwaApproveDAO.selectPwaApprovePartsByCondition(searchVO);
    }


    /**
     * 클레임에서 사용된 RO NO를  승인된 PWA 에 등록한다.
     * Statements
     *
     * @param pwaVO
     * @return
     * @throws Exception
     */
    public int updatePwaApproveNoInClaim(PwaVO pwaVO) throws Exception {

        return pwaApproveDAO.updatePwaApproveNoInClaim(pwaVO);
    }


    /**
    *
    * 승인 PWA 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return 승인 PWA  정보 데이터
    * @throws Exception
    */
    public List<PwaVO> selectPwaApproveClaimByCondition(PwaSearchVO searchVO) throws Exception {

        return pwaApproveDAO.selectPwaApproveClaimByCondition(searchVO);
    }






}
