package chn.bhmc.dms.dply.dms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.dply.dms.service.DmsProfileService;
import chn.bhmc.dms.dply.dms.service.dao.DmsProfileDAO;
import chn.bhmc.dms.dply.dms.vo.BundleDeployHistorySearchVO;
import chn.bhmc.dms.dply.dms.vo.BundleDeployHistoryVO;
import chn.bhmc.dms.dply.dms.vo.DmsProfileSaveVO;
import chn.bhmc.dms.dply.dms.vo.DmsProfileSearchVO;
import chn.bhmc.dms.dply.dms.vo.DmsProfileVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DmsProfile.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 21.     Kang Seok Han     최초 생성
 * </pre>
 */

@Service("dmsProfileService")
public class DmsProfileServiceImpl extends HService implements DmsProfileService, JxlsSupport {

    /**
     * 메세지소스 관리 DAO
     */
    @Resource(name="dmsProfileDAO")
    DmsProfileDAO dmsProfileDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public List<DmsProfileVO> selectDmsProfileByCondition(DmsProfileSearchVO searchVO) throws Exception {
        return dmsProfileDAO.selectDmsProfileByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectDmsProfileByConditionCnt(DmsProfileSearchVO searchVO) throws Exception {
        return dmsProfileDAO.selectDmsProfileByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        // TODO Auto-generated method stub

    }

    /*
     * @see chn.bhmc.dms.dply.dms.service.DmsProfileService#selectBundleDeployHistoryByKey(chn.bhmc.dms.dply.dms.vo.BundleDeployHistorySearchVO)
     */
    @Override
    public List<BundleDeployHistoryVO> selectBundleDeployHistoryByKey(BundleDeployHistorySearchVO searchVO) throws Exception {
        return dmsProfileDAO.selectBundleDeployHistoryByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.dms.service.DmsProfileService#updateDeployTargetYN(chn.bhmc.dms.dply.dms.vo.DmsProfileSaveVO)
     */
    @Override
    public int updateDeployTargetYN(DmsProfileSaveVO saveVO) throws Exception {
        String updtUsrId = LoginUtil.getUserId();
        if( "E".equals(saveVO.getFlag()) ) {
            for(DmsProfileVO dmsProfileVO : saveVO.getUpdateList()) {
                dmsProfileVO.setUpdtUsrId(updtUsrId);
                dmsProfileDAO.updateDeployTargetToE(dmsProfileVO);
            }
        } else if( "Y".equals(saveVO.getFlag()) ) {
            for(DmsProfileVO dmsProfileVO : saveVO.getUpdateList()) {
                dmsProfileVO.setUpdtUsrId(updtUsrId);
                dmsProfileDAO.updateDeployTargetToY(dmsProfileVO);
            }
        }

        return 0;
    }

}
