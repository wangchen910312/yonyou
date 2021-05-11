package chn.bhmc.dms.sal.cnt.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ProgressStsDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 2. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 18      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("progressStsDAO")
public interface ProgressStsDAO {

    /**
      * 조회 조건에 해당하는 계약품의현황을 조회한다.
      */
    public List<ContractVO> selectProgressStsByCondition(ContractSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 계약품의현황 총 갯수를 조회한다.
     */
    public int selectProgressStsByConditionCnt(ContractSearchVO searchVO);
}
