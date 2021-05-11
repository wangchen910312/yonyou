package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.AwayMgmtService;
import chn.bhmc.dms.cmm.sci.service.dao.AwayMgmtDAO;
import chn.bhmc.dms.cmm.sci.vo.AwayMgmtSearchVO;
import chn.bhmc.dms.cmm.sci.vo.AwayMgmtVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AwayMgmtServiceImpl.java
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

@Service("awayMgmtService")
public class AwayMgmtServiceImpl extends HService implements AwayMgmtService {
    /**
     * 자리 비움 DAO
     */
    @Resource(name = "awayMgmtDAO")
    AwayMgmtDAO awayMgmtDAO;

    @Override
    public List<AwayMgmtVO> selectAwayMgmtByCondition(AwayMgmtSearchVO searchVO) throws Exception {
        return awayMgmtDAO.selectAwayMgmtByCondition(searchVO);
    }

    @Override
    public int selectAwayMgmtByConditionCnt(AwayMgmtSearchVO searchVO) throws Exception {
        return awayMgmtDAO.selectAwayMgmtByConditionCnt(searchVO);
    }
}