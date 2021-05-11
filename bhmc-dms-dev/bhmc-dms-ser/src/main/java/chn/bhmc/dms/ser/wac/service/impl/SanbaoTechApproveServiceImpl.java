package chn.bhmc.dms.ser.wac.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
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

        sanbaoTechVO.setUpdtUsrId(userId);
        sanbaoTechVO.setJudgId(userId);
        sanbaoTechVO.setJudgNm(LoginUtil.getUserNm());

        if( sanbaoTechVO.getStatCd().equals("A") ){
            approveNo = sanbaoTechApproveNoIdGenService.getNextStringId();
        }
        sanbaoTechVO.setApproveNo(approveNo);
        sanbaoTechApproveDAO.updateSanbaoTechApprove(sanbaoTechVO);

        return sanbaoTechVO.getApproveNo();
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
