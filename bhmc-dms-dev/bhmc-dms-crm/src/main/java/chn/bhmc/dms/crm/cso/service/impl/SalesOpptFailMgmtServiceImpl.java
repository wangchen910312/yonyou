package chn.bhmc.dms.crm.cso.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.SalesOpptFailMgmtService;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptFailMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtVO;

/**
 * 판매기회 실패관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.03.22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.22         in moon lee            최초 생성
 * </pre>
 */

@Service("salesOpptFailMgmtService")
public class SalesOpptFailMgmtServiceImpl extends HService implements SalesOpptFailMgmtService {

    /**
     * 판매기회 실패관리 DAO
     */
	@Resource(name="salesOpptFailMgmtDAO")
	SalesOpptFailMgmtDAO salesOpptFailMgmtDAO;

    /**
     * 판매기회 실패목록 수량 조회
     */
    @Override
    public int selectSalesOpptFailMgmtsByConditionCnt(SalesOpptMgmtSearchVO searchVO) throws Exception {
        return salesOpptFailMgmtDAO.selectSalesOpptFailMgmtsByConditionCnt(searchVO);
    }

    /**
     * 판매기회 실패목록 조회
     */
    @Override
    public List<SalesOpptMgmtVO> selectSalesOpptFailMgmtsByCondition(SalesOpptMgmtSearchVO searchVO) throws Exception {
        return salesOpptFailMgmtDAO.selectSalesOpptFailMgmtsByCondition(searchVO);
    }

    /**
     * 판매기회 실패 상세 목록 수량 조회
     */
    @Override
    public int selectSalesOpptFailDetlMgmtsByConditionCnt(SalesOpptMgmtSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return salesOpptFailMgmtDAO.selectSalesOpptFailDetlMgmtsByConditionCnt(searchVO);
    }

    /**
     * 판매기회 실패 상세 목록 조회
     */
    @Override
    public List<SalesOpptFailMgmtVO> selectSalesOpptFailDetlMgmtsByCondition(SalesOpptMgmtSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return salesOpptFailMgmtDAO.selectSalesOpptFailDetlMgmtsByCondition(searchVO);
    }

}
