package chn.bhmc.dms.sal.aap.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.aap.vo.AapInfoSearchVO;
import chn.bhmc.dms.sal.aap.vo.AapInfoVO;

/**
 * @ClassName   : AapInfoDAO
 * @Description : 클래스 설명을 기술합니다.
 * @author KimJinSuk
 * @since 2016. 3. 3
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 3      KimJinSuk              최초 생성
 * </pre>
 */

@Mapper("aapInfoDAO")
public interface AapInfoDAO {

    
    /**
     * 계약 대행업무 이력 갯수조회 
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAapInfoSearchsByConditionCnt(AapInfoSearchVO searchVO) throws Exception;
    
    /**
     * 계약 대행업무 이력조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AapInfoVO> selectAapInfoSearchsByCondition(AapInfoSearchVO searchVO) throws Exception;
    
    /**
     * 계약 대행업무 삭제한다.
     * @param saveVO
     * @throws Exception
     */    
    public int deleteContractAapInfo(AapInfoVO saveVO) throws Exception;
    
    /**
     * 계약 대행업무 저장한다.
     * @param saveVO
     * @throws Exception
     */
    public int insertContractAapInfo(AapInfoVO saveVO) throws Exception;
}
