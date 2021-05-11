package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.AwayMgmtSearchVO;
import chn.bhmc.dms.cmm.sci.vo.AwayMgmtVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AwayMgmtDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 29.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Mapper("awayMgmtDAO")
public interface AwayMgmtDAO {
    public List<AwayMgmtVO> selectAwayMgmtByCondition(AwayMgmtSearchVO searchVO);

    public int selectAwayMgmtByConditionCnt(AwayMgmtSearchVO searchVO);
}