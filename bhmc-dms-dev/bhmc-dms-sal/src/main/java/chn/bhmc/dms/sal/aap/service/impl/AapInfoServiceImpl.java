package chn.bhmc.dms.sal.aap.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.aap.service.AapInfoService;
import chn.bhmc.dms.sal.aap.service.dao.AapInfoDAO;
import chn.bhmc.dms.sal.aap.vo.AapInfoSearchVO;
import chn.bhmc.dms.sal.aap.vo.AapInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AapInfoServiceImpl
 * @Description : 클래스 설명을 기술합니다.
 * @author KimJinSuk
 * @since 2016. 4. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 22.      KimJinSuk              최초 생성
 * </pre>
 */

@Service("aapInfoService")
public class AapInfoServiceImpl extends HService implements AapInfoService{

    /**
     * 계약대행업무 DAO 선언
     */
    @Resource(name="aapInfoDAO")
    AapInfoDAO aapInfoDAO;
    

    /**
     * 계약 대행업무 이력 갯수조회 
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAapInfoSearchsByConditionCnt(AapInfoSearchVO searchVO) throws Exception{
        return aapInfoDAO.selectAapInfoSearchsByConditionCnt(searchVO);
    }
    
    /**
     * 계약 대행업무 이력조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AapInfoVO> selectAapInfoSearchsByCondition(AapInfoSearchVO searchVO) throws Exception{
        return aapInfoDAO.selectAapInfoSearchsByCondition(searchVO);
    }

    /**
     * 계약 대행업무 삭제한다.
     * @param saveVO
     * @throws Exception
     */
    @Override
    public int deleteContractAapInfo(AapInfoVO saveVO) throws Exception{
        return aapInfoDAO.deleteContractAapInfo(saveVO);
    }
    
    /**
     * 계약 대행업무 저장한다.
     * @param saveVO
     * @throws Exception
     */
    @Override    
    public int insertContractAapInfo(AapInfoVO saveVO) throws Exception{
        return aapInfoDAO.insertContractAapInfo(saveVO);
    }
    
    
}
