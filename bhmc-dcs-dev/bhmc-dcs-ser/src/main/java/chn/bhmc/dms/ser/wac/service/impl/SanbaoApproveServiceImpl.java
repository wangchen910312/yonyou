package chn.bhmc.dms.ser.wac.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.wac.service.SanbaoApproveService;
import chn.bhmc.dms.ser.wac.service.dao.SanbaoApproveDAO;
import chn.bhmc.dms.ser.wac.vo.SanbaoPartVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoApproveServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 6.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("sanbaoApproveService")
public class SanbaoApproveServiceImpl extends HService implements SanbaoApproveService {



    @Resource(name="sanbaoApproveDAO")
    SanbaoApproveDAO sanbaoApproveDAO;

    /**
     * 삼보 SEQ
     */
    @Resource(name="sanbaoApproveNoIdGenService")
    TableIdGenService sanbaoApproveNoIdGenService;

    @Autowired
    ServiceCommonService serviceCommonService;


    /**
     *
     * 삼보승인  목록수 정보 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
     * @return 삼보승인 정보 데이터
     * @throws Exception
     */
    public int selectSanbaoApproveByConditionCnt(SanbaoSearchVO searchVO)throws Exception{

        return sanbaoApproveDAO.selectSanbaoApproveByConditionCnt(searchVO);
    };

    /**
    *
    * 삼보승인  목록 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoSearchVO
    * @return 삼보승인 정보 데이터
    * @throws Exception
    */
    public List<SanbaoVO> selectSanbaoApproveByCondition(SanbaoSearchVO searchVO) throws Exception {

        return sanbaoApproveDAO.selectSanbaoApproveByCondition(searchVO);
    }

    /**
    *
    * 삼보승인  상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoSearchVO
    * @return 삼보승인 상세 정보 데이터
    * @throws Exception
    */
    public SanbaoVO selectSanbaoApproveByKey(SanbaoSearchVO searchVO) throws Exception {

        return sanbaoApproveDAO.selectSanbaoApproveByKey(searchVO);
    }

    /**
    *
    * 삼보승인 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoSearchVO
    * @return 삼보승인 부품  정보 데이터
    * @throws Exception
    */
    public List<SanbaoPartVO> selectSanbaoApprovePartsByCondition(SanbaoSearchVO searchVO) throws Exception{

        return sanbaoApproveDAO.selectSanbaoApprovePartsByCondition(searchVO);
    }

    /**
    *
    * 삼보승인 정보를 수정 한다.
    *
    * @param saveVO - 삼보승인 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public String updateSanbaoApprove(SanbaoVO sanbaoVO) throws Exception {

        String approveNo = "";
        String userId =LoginUtil.getUserId();
        String userNm = LoginUtil.getUserNm();

        sanbaoVO.setUpdtUsrId(userId);
        sanbaoVO.setJudgId(userId);
        sanbaoVO.setJudgNm(userNm);


        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date toDate = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);
        sanbaoVO.setJudgDt(toDate);


        if(sanbaoVO.getStatCd().equals("A")){
            approveNo = sanbaoApproveNoIdGenService.getNextStringId();
            sanbaoVO.setApproveNo(approveNo);
        }
       int resultCnt =  sanbaoApproveDAO.updateSanbaoApprove(sanbaoVO);

        if(resultCnt > 0){

             //DCS-DMS EAI InterFace Header Info
             Map<String, Object> message = new HashMap<String, Object>();

             message.put("DLR_CD", sanbaoVO.getDlrCd());
             message.put("VIN_NO",sanbaoVO.getVinNo());
             message.put("DOC_NO", sanbaoVO.getDocNo());
             message.put("STAT_CD", sanbaoVO.getStatCd());
             message.put("JUDG_DT", DateUtil.convertToDateTimeString(sanbaoVO.getJudgDt()));
             message.put("JUDG_NM", sanbaoVO.getJudgNm());
             message.put("APPROVE_NO", sanbaoVO.getApproveNo());
             message.put("BMP_PROC_CONT", sanbaoVO.getBmpProcCont());
             message.put("ITEM_CHK_DT", DateUtil.convertToDateTimeString(sanbaoVO.getItemChkDt()));
             message.put("UPDT_USR_ID", sanbaoVO.getUpdtUsrId());
             message.put("UPDT_DT", DateUtil.convertToDateTimeString(toDate));
             message.put("JUDG_ID", sanbaoVO.getJudgId());

             serviceCommonService.executeEaiCall(sanbaoVO.getDlrCd(),"SER034",message,"Y");

        }


        return approveNo;
    }



}
