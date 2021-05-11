package chn.bhmc.dms.cva.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cva.cmm.service.CvaCommonService;
import chn.bhmc.dms.cva.cmm.service.dao.CvaCommonDAO;
import chn.bhmc.dms.cva.cmm.vo.CvaDealerSearchVO;
import chn.bhmc.dms.cva.cmm.vo.CvaDealerVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CvaCommonServiceImpl
 * @Description : 공통
 * @author
 * @since 2016. 11. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 28.    Yoon SE Ran            최초 생성
 * </pre>
 */

@Service("cvaCommonService")
public class CvaCommonServiceImpl extends HService implements CvaCommonService {

    /**
     * 공통 DAO 선언
     */
    @Resource(name="cvaCommonDAO")
    CvaCommonDAO cvaCommonDAO;

    /**
     * 딜러마스터에서 딜러를  조회(COUNT).
     */
    @Override
    public int selectCvaDealerCnt(CvaDealerSearchVO searchVO) throws Exception {
        return cvaCommonDAO.selectCvaDealerCnt(searchVO);
    }
    /**
     * 딜러마스터에서 딜러를 그룹핑하여 조회.
     */
    @Override
    public List<CvaDealerVO> selectCvaDealer(CvaDealerSearchVO searchVO) throws Exception {
        return cvaCommonDAO.selectCvaDealer(searchVO);
    }
}
