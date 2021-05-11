package chn.bhmc.dms.sal.aap.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.aap.service.AapMngService;
import chn.bhmc.dms.sal.aap.service.dao.AapMngDAO;
import chn.bhmc.dms.sal.aap.vo.AapMngSearchVO;
import chn.bhmc.dms.sal.aap.vo.AapMngVO;
import chn.bhmc.dms.sal.cnt.service.ContractReService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AapMngServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 4. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 15.      Kim yewon              최초 생성
 * </pre>
 */

@Service("aapMngService")
public class AapMngServiceImpl extends HService implements AapMngService{

    /**
     * 배정관리 DAO 선언
     */
    @Resource(name="aapMngDAO")
    AapMngDAO aapMngDAO;

    /**
     * 계약 서비스
     */
    @Resource(name="contractReService")
    private ContractReService contractReService;


    /**
     * 조회 조건에 해당하는 배정 정보를 조회한다.
     */
    @Override
    public List<AapMngVO> selectAapMngByCondition(AapMngSearchVO searchVO) throws Exception {
        return aapMngDAO.selectAapMngByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 배정목록 총 갯수를 조회한다.
     */
    @Override
    public int selectAapMngByConditionCnt(AapMngSearchVO searchVO) throws Exception {
        return aapMngDAO.selectAapMngByConditionCnt(searchVO);
    }


    /**
     * 대행업무를 저장한다.
     */
    @Override
    public String saveAapMng(AapMngVO saveVO) throws Exception{
        saveVO.setUpdtUsrId(LoginUtil.getUserId());         // 수정자
        saveVO.setRegUsrId(LoginUtil.getUserId());          // 등록자

        if(saveVO.getSeq() > 0 ){
            aapMngDAO.updateAapMng(saveVO);
        }else {
            aapMngDAO.insertAapMng(saveVO);
        }

        if( saveVO.getContractNo() != null && !"".equals(saveVO.getContractNo()) ){
            // SA_0201T(계약) , SA_0220T(계약-대행) 저장
            contractReService.contractAapMngApply(saveVO);
        }

        return saveVO.getSeq()+"";
    }

    /**
     * 대행업무를 신규 등록
     */
    @Override
    public int insertAapMng(AapMngVO saveVO) throws Exception{
        return aapMngDAO.insertAapMng(saveVO);
    }

    /**
     * 대행업무 삭제한다.
     * @param saveVO
     * @throws Exception
     */
    @Override
    public int deleteContractAapMng(AapMngVO saveVO) throws Exception{
        return aapMngDAO.deleteContractAapMng(saveVO);
    }


}
