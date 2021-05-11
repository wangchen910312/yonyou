package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.AwayCustomerService;
import chn.bhmc.dms.cmm.sci.service.dao.AwayCustomerDAO;
import chn.bhmc.dms.cmm.sci.vo.AwayCustomerSaveVO;
import chn.bhmc.dms.cmm.sci.vo.AwayCustomerSearchVO;
import chn.bhmc.dms.cmm.sci.vo.AwayCustomerVO;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AwayCustomerServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Service("awayCustomerService")
public class AwayCustomerServiceImpl extends HService implements AwayCustomerService {
    /**
     * 자리 비움 DAO
     */
    @Resource(name = "awayCustomerDAO")
    AwayCustomerDAO awayCustomerDAO;

    @Override
    public int insertAwayCustomer(AwayCustomerVO awayCustomerVO) throws Exception {
        awayCustomerVO.setUsrId(LoginUtil.getUserId());
        awayCustomerVO.setRegUsrId(LoginUtil.getUserId());
        awayCustomerVO.setUpdtUsrId(LoginUtil.getUserId());

        return awayCustomerDAO.insertAwayCustomer(awayCustomerVO);
    }

    @Override
    public int updateAwayCustomer(AwayCustomerVO awayCustomerVO) throws Exception {
        awayCustomerVO.setUsrId(LoginUtil.getUserId());
        awayCustomerVO.setUpdtUsrId(LoginUtil.getUserId());

        return awayCustomerDAO.updateAwayCustomer(awayCustomerVO);
    }

    @Override
    public boolean deleteAwayCustomer(AwayCustomerVO awayCustomerVO) throws Exception {
        boolean result = false;

        AwayCustomerSearchVO searchVO = new AwayCustomerSearchVO();

        searchVO.setsUsrId(LoginUtil.getUserId());
        searchVO.setsRevDt(awayCustomerVO.getRevNewDt());

        if (this.selectAwayCustomerDelByConditionCnt(searchVO) == 0) {
            result = true;

            awayCustomerVO.setUsrId(LoginUtil.getUserId());
            awayCustomerDAO.deleteAwayCustomer(awayCustomerVO);
        }

        return result;
    }

    @Override
    public List<AwayCustomerVO> selectAwayCustomerByCondition(AwayCustomerSearchVO searchVO) throws Exception {
        String sRevEndDt = "";

        if (!"".equals(searchVO.getsRevEndDt())) {
            sRevEndDt = DateUtil.getDate(DateUtil.convertToDate(searchVO.getsRevEndDt(), "yyyy-MM-dd"), "yyyy-MM-dd", Calendar.DATE, 1);
            searchVO.setsRevEndDt(sRevEndDt);
        }

        searchVO.setsUsrId(LoginUtil.getUserId());

        return awayCustomerDAO.selectAwayCustomerByCondition(searchVO);
    }

    @Override
    public int selectAwayCustomerByConditionCnt(AwayCustomerSearchVO searchVO) throws Exception {
        String sRevEndDt = "";

        if (!"".equals(searchVO.getsRevEndDt())) {
            sRevEndDt = DateUtil.getDate(DateUtil.convertToDate(searchVO.getsRevEndDt(), "yyyy-MM-dd"), "yyyy-MM-dd", Calendar.DATE, 1);
            searchVO.setsRevEndDt(sRevEndDt);
        }

        searchVO.setsUsrId(LoginUtil.getUserId());

        return awayCustomerDAO.selectAwayCustomerByConditionCnt(searchVO);
    }

    @Override
    public AwayCustomerVO selectAwayCustomerByPk(AwayCustomerSearchVO searchVO) throws Exception {
        searchVO.setsUsrId(LoginUtil.getUserId());

        return awayCustomerDAO.selectAwayCustomerByPk(searchVO);
    }

    @Override
    public int selectAwayCustomerByOverLap(AwayCustomerSearchVO searchVO) throws Exception {
        searchVO.setsUsrId(LoginUtil.getUserId());

        return awayCustomerDAO.selectAwayCustomerByOverLap(searchVO);
    }

    @Override
    public int selectAwayCustomerDelByConditionCnt(AwayCustomerSearchVO searchVO) throws Exception {
        searchVO.setsUsrId(LoginUtil.getUserId());

        return awayCustomerDAO.selectAwayCustomerDelByConditionCnt(searchVO);
    }

    @Override
    public boolean multiAwayCustomer(AwayCustomerSaveVO saveVO) throws Exception {
        boolean result = false;
        int cnt = 0;

        String userId = LoginUtil.getUserId();

        AwayCustomerSearchVO searchVO = new AwayCustomerSearchVO();

        // 삭제 조건 Select
        for(AwayCustomerVO awayCustomerVO : saveVO.getDeleteList()) {
            searchVO.setsUsrId(userId);
            searchVO.setsRevDt(awayCustomerVO.getRevOldDt());

            cnt = this.selectAwayCustomerDelByConditionCnt(searchVO);

            if (cnt > 0) {
                break;
            }
        }

        if (cnt == 0) {
            result = true;

            // Multi 삭제
            for(AwayCustomerVO awayCustomerVO : saveVO.getDeleteList()) {
                awayCustomerVO.setUsrId(userId);
                awayCustomerVO.setRevOldStartHm("");

                this.deleteAwayCustomer(awayCustomerVO);
            }
        }

        return result;
    }
}