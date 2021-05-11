package chn.bhmc.dms.sal.aap.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.aap.vo.AapMngSearchVO;
import chn.bhmc.dms.sal.aap.vo.AapMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AssignMngDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 3. 3
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 3      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("aapMngDAO")
public interface AapMngDAO {

    /**
      * 조회 조건에 해당하는 배정 정보를 조회한다.
      */
    public List<AapMngVO> selectAapMngByCondition(AapMngSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 배정목록 총 갯수를 조회한다.
     */
    public int selectAapMngByConditionCnt(AapMngSearchVO searchVO);

    /**
     * 대행업무 수정한다.
     */
    public void updateAapMng(AapMngVO saveVO) throws Exception;

    /**
     * 대행업무를 신규 등록
     */
    public int insertAapMng(AapMngVO vo) throws Exception;

    /**
     * 대행업무 삭제한다.
     * @param saveVO
     * @throws Exception
     */
    public int deleteContractAapMng(AapMngVO saveVO) throws Exception;

}
