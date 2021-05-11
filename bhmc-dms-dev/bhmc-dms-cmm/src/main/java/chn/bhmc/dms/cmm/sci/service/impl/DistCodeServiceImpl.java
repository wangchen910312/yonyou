package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.DistCodeService;
import chn.bhmc.dms.cmm.sci.service.dao.DistCodeDAO;
import chn.bhmc.dms.cmm.sci.vo.DistCodeSaveVO;
import chn.bhmc.dms.cmm.sci.vo.DistCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.DistCodeVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 지역코드 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("distCodeService")
public class DistCodeServiceImpl extends HService implements DistCodeService {

    /**
     * 지역코드 관리 DAO
     */
	@Resource(name="distCodeDAO")
	DistCodeDAO distCodeDAO;

	/**
	 * {@inheritDoc}
	 */
    @Override
    public int insertDistCode(DistCodeVO distCodeVO)  throws Exception {

        DistCodeVO obj = selectDistCodeByKey(distCodeVO.getDistCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return distCodeDAO.insertDistCode(distCodeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateDistCode(DistCodeVO distCodeVO)  throws Exception {
        return distCodeDAO.updateDistCode(distCodeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public DistCodeVO selectDistCodeByKey(String distCd)  throws Exception {
        return distCodeDAO.selectDistCodeByKey(distCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiDistCodes(DistCodeSaveVO obj)  throws Exception {

        String userId = LoginUtil.getUserId();

        for(DistCodeVO distCodeVO : obj.getInsertList()){
            distCodeVO.setRegUsrId(userId);
            insertDistCode(distCodeVO);
        }

        for(DistCodeVO distCodeVO : obj.getUpdateList()){
            distCodeVO.setUpdtUsrId(userId);
            updateDistCode(distCodeVO);
        }
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<DistCodeVO> selectDistCodesByCondition(DistCodeSearchVO searchVO)  throws Exception {
        return distCodeDAO.selectDistCodesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectDistCodesByConditionCnt(DistCodeSearchVO searchVO)  throws Exception {
        return distCodeDAO.selectDistCodesByConditionCnt(searchVO);
    }

}
