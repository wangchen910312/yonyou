package chn.bhmc.dms.ser.wac.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
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
        
        
        if(sanbaoVO.getStatCd().equals("A")){
            approveNo = sanbaoApproveNoIdGenService.getNextStringId();
            sanbaoVO.setApproveNo(approveNo);
        }
        sanbaoApproveDAO.updateSanbaoApprove(sanbaoVO);
        
        
        return approveNo;
    }
    
    

}
