package chn.bhmc.dms.ser.wac.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.wac.service.SanbaoTechApproveService;
import chn.bhmc.dms.ser.wac.service.dao.SanbaoTechApproveDAO;
import chn.bhmc.dms.ser.wac.vo.SanbaoTechSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoTechVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoTechApproveServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 10.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("sanbaoTechApproveService")
public class SanbaoTechApproveServiceImpl extends HService implements SanbaoTechApproveService{


    @Resource(name="sanbaoTechApproveDAO")
    SanbaoTechApproveDAO sanbaoTechApproveDAO;

    /**
     * 삼보 기술제출 승인번호 SEQ
     */
    @Resource(name="sanbaoTechApproveNoIdGenService")
    TableIdGenService sanbaoTechApproveNoIdGenService;

    @Autowired
    ServiceCommonService serviceCommonService;

    /**
    *
    * 삼보 기술처리 목록수 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
    * @return 삼보 기술처리 목록 데이터
    * @throws Exception
    */
    public int selectSanbaoTechApproveByConditionCnt(SanbaoTechSearchVO searchVO)throws Exception {

        return sanbaoTechApproveDAO.selectSanbaoTechApproveByConditionCnt(searchVO);
    }

    /**
     *
     * 삼보 기술처리 목록 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
     * @return 삼보 기술처리 목록 데이터
     * @throws Exception
     */
    public List<SanbaoTechVO> selectSanbaoTechApproveByCondition(SanbaoTechSearchVO searchVO) throws Exception {

        return sanbaoTechApproveDAO.selectSanbaoTechApproveByCondition(searchVO);
    }

    /**
    *
    * 삼보 기술처리  상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
    * @return 삼보 기술처리 상세 정보 데이터
    * @throws Exception
    */
    public SanbaoTechVO selectSanbaoTechRequestByKey(SanbaoTechSearchVO searchVO) throws Exception {

        return sanbaoTechApproveDAO.selectSanbaoTechRequestByKey(searchVO);
    }


    /**
    *
    * 삼보 기술처리 정보를 수정 한다.
    *
    * @param saveVO - 삼보 기술처리 수정 목록을 포함하는 SanbaoTechVO
    * @return bindingResult
    * @throws Exception
    */
    public String updateSanbaoTechApprove(SanbaoTechVO sanbaoTechVO)throws Exception{

        String approveNo = "";
        String userId = LoginUtil.getUserId();

        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date toDate = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);


        sanbaoTechVO.setUpdtUsrId(userId);
        sanbaoTechVO.setUpdtDt(toDate);
        sanbaoTechVO.setJudgId(userId);
        sanbaoTechVO.setJudgNm(LoginUtil.getUserNm());

        if( sanbaoTechVO.getStatCd().equals("A") ){
            approveNo = sanbaoTechApproveNoIdGenService.getNextStringId();
            sanbaoTechVO.setJudgDt(toDate);
            sanbaoTechVO.setApproveNo(approveNo);
        }

        int resultCnt = sanbaoTechApproveDAO.updateSanbaoTechApprove(sanbaoTechVO);

        if(resultCnt > 0 ){
          //DCS-DMS EAI InterFace Header Info
            Map<String, Object> message = new HashMap<String, Object>();

            message.put("DLR_CD", sanbaoTechVO.getDlrCd());
            message.put("VIN_NO", sanbaoTechVO.getVinNo());
            message.put("DOC_NO",sanbaoTechVO.getDocNo());
            message.put("STAT_CD", sanbaoTechVO.getStatCd());
            message.put("JUDG_DT", DateUtil.convertToDateTimeString(sanbaoTechVO.getJudgDt()));
            message.put("JUDG_NM", LoginUtil.getUserNm());
            message.put("JUDG_ID", LoginUtil.getUserId());
            message.put("PBLM_ERR_CD", sanbaoTechVO.getPblmErrCd());
            message.put("EMGC_ALRT_CD", sanbaoTechVO.getEmgcAlrtCd());
            message.put("OPN_TP", sanbaoTechVO.getOpnTp());
            message.put("APPROVE_NO", sanbaoTechVO.getApproveNo());
            message.put("BMP_PROC_CONT", sanbaoTechVO.getBmpProcCont());
            message.put("USE_YN", sanbaoTechVO.getUseYn());
            message.put("UPDT_USR_ID", LoginUtil.getUserId());
            message.put("UPDT_DT", DateUtil.convertToDateTimeString(sanbaoTechVO.getUpdtDt()));


            serviceCommonService.executeEaiCall(sanbaoTechVO.getDlrCd(),"SER036",message,"Y");
        }

        return approveNo;
    }



    /**
    *
    * 삼보 기술처리 사용여부 수정
    *
    * @param saveVO - 삼보 기술처리 사용여부 수정 목록을 포함하는 SanbaoTechVO
    * @return bindingResult
    * @throws Exception
    */
    public int updateSanbaoTechApproveUseYn(SanbaoTechVO sanbaoTechVO) throws Exception {

        if( StringUtil.nullConvert(sanbaoTechVO.getDlrCd()).equals("")){
            sanbaoTechVO.setDlrCd(LoginUtil.getDlrCd());
        }

        return sanbaoTechApproveDAO.updateSanbaoTechApproveUseYn(sanbaoTechVO);
    }


}
