package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.ChangeHistoryService;
import chn.bhmc.dms.cmm.sci.service.dao.ChangeHistoryDAO;
import chn.bhmc.dms.cmm.sci.vo.ChangeHistorySearchVO;
import chn.bhmc.dms.cmm.sci.vo.ChangeHistoryVO;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ChangeHistoryServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Service("changeHistoryService")
public class ChangeHistoryServiceImpl extends HService implements ChangeHistoryService {
    /**
     * 이력 정보 DAO
     */
    @Resource(name = "changeHistoryDAO")
    ChangeHistoryDAO changeHistoryDAO;

    @Override
    public int insertChangeHistory(ChangeHistoryVO changeHistoryVO) throws Exception {
        return changeHistoryDAO.insertChangeHistory(changeHistoryVO);
    }

    @Override
    public List<ChangeHistoryVO> selectChangeHistoryByCondition(ChangeHistorySearchVO searchVO) throws Exception {
        String sChgEndDt = "";

        if (!"".equals(searchVO.getsChgEndDt())) {
            sChgEndDt = DateUtil.getDate(DateUtil.convertToDate(searchVO.getsChgEndDt(), "yyyy-MM-dd"), "yyyy-MM-dd", Calendar.DATE, 1);
            searchVO.setsChgEndDt(sChgEndDt);
        }

        return changeHistoryDAO.selectChangeHistoryByCondition(searchVO);
    }

    @Override
    public int selectChangeHistoryByConditionCnt(ChangeHistorySearchVO searchVO) throws Exception {
        String sChgEndDt = "";

        if (!"".equals(searchVO.getsChgEndDt())) {
            sChgEndDt = DateUtil.getDate(DateUtil.convertToDate(searchVO.getsChgEndDt(), "yyyy-MM-dd"), "yyyy-MM-dd", Calendar.DATE, 1);
            searchVO.setsChgEndDt(sChgEndDt);
        }

        return changeHistoryDAO.selectChangeHistoryByConditionCnt(searchVO);
    }

    @Override
    public ChangeHistoryVO selectChangeHistoryByKey(ChangeHistorySearchVO searchVO) throws Exception {
        return changeHistoryDAO.selectChangeHistoryByKey(searchVO);
    }
}