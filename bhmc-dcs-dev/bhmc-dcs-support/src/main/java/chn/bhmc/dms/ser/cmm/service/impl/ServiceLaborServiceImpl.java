package chn.bhmc.dms.ser.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceLaborService;
import chn.bhmc.dms.ser.cmm.service.dao.ServiceLaborDAO;
import chn.bhmc.dms.ser.cmm.vo.ServiceCmmVO;
import chn.bhmc.dms.ser.cmm.vo.ServiceLaborVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceLaborServiceImpl.java
 * @Description : 공통 공임 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 8. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 23.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("serviceLaborService")
public class ServiceLaborServiceImpl extends HService implements ServiceLaborService {

    /**
     * RO접수 공임 DAO
     */
    @Resource(name="serviceLaborDAO")
    ServiceLaborDAO serviceLaborDAO;

    /**
     * 조회 조건에 해당하는 공임 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectServiceLaborsByConditionCnt(TabInfoSearchVO searchVO) throws Exception {
        if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return serviceLaborDAO.selectServiceLaborsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 공임을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServiceLaborVO> selectServiceLaborsByCondition(TabInfoSearchVO searchVO) throws Exception {
        if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return serviceLaborDAO.selectServiceLaborsByCondition(searchVO);
    }

    /**
     * RO접수 공임을 등록/수정/삭제한다.
     * @param serviceLaborSaveVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void multiServiceLabor(List<ServiceLaborVO> serviceLaborSaveVO, ServiceCmmVO serviceCmmVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        ServiceLaborVO laborVO = new ServiceLaborVO();
        laborVO.setPreFixId(serviceCmmVO.getPreFixId());
        laborVO.setDocNo(serviceCmmVO.getDocNo());
        laborVO.setDlrCd(dlrCd);
        serviceLaborDAO.deleteServiceLabor(laborVO);

        int lineNo = 1;

        for(ServiceLaborVO serviceLaborVO : serviceLaborSaveVO){
            serviceLaborVO.setRegUsrId(userId);
            serviceLaborVO.setDlrCd(dlrCd);
            serviceLaborVO.setPreFixId(serviceCmmVO.getPreFixId());
            serviceLaborVO.setDocNo(serviceCmmVO.getDocNo());
            serviceLaborVO.setLineNo(lineNo++);
            serviceLaborDAO.insertServiceLabor(serviceLaborVO);
        }
    }

    public void deleteServiceLabor(ServiceLaborVO serviceLaborVO) throws Exception {

        if( StringUtil.nullConvert(serviceLaborVO.getDlrCd()).equals("")){
            serviceLaborVO.setDlrCd(LoginUtil.getDlrCd());
        }
        serviceLaborDAO.deleteServiceLabor(serviceLaborVO);
    }

    /**
     * 조회 조건에 해당하는 공임 히스토리 (DCS)을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServiceLaborVO> selectServiceLaborsHistByCondition(TabInfoSearchVO searchVO) throws Exception {
        return serviceLaborDAO.selectServiceLaborsByCondition(searchVO);
    }

}