package chn.bhmc.dms.sal.dlv.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.dlv.service.ReleaseCancelHistoryService;
import chn.bhmc.dms.sal.dlv.service.dao.ReleaseCancelHistoryDAO;
import chn.bhmc.dms.sal.dlv.vo.ReleaseCancelHistoryListVO;
import chn.bhmc.dms.sal.dlv.vo.ReleaseCancelHistoryVO;

/**
*
* @ClassName   : ReleaseCancelHistoryServiceImpl.java
* @Description : 출고취소 이력을 조회한다.
* @author
* @since 2016. 10. 22.
* @version 1.0
* @see
* @Modification Information
* <pre>
*       수정일                            수정자                              수정내용
*  ----------------    ------------    ---------------------------
*   2016.10.22         Yoon Se Ran          최초 생성
* </pre>
*/

@Service("releaseCancelHistoryService")
public class ReleaseCancelHistoryServiceImpl extends HService implements ReleaseCancelHistoryService {

    /**
     * 출고취소 이력 DAO 선언
     */
    @Resource(name="releaseCancelHistoryDAO")
    ReleaseCancelHistoryDAO releaseCancelHistoryDAO;

    /**
     * 조회 조건에 해당하는 출고취소이력을 조회한다.
     */
    @Override
    public List<ReleaseCancelHistoryListVO> selectReleaseCancelHistoryByCondition(ReleaseCancelHistoryVO searchVO) throws Exception {
        return releaseCancelHistoryDAO.selectReleaseCancelHistoryByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 출고취소 심사결과 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectReleaseCancelHistoryByConditionCnt(ReleaseCancelHistoryVO searchVO) throws Exception {
        return releaseCancelHistoryDAO.selectReleaseCancelHistoryByConditionCnt(searchVO);
    }
}
