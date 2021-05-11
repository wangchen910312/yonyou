package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmContactHistoryDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmContactHistoryService;
import chn.bhmc.dms.mob.api.crm.vo.ContactHistorySearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ContactHistoryVO;

/**
 * 영업 스케줄 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.02.24.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.24         in moon lee            최초 생성
 * </pre>
 */

@Service("CrmcontactHistoryService")
public class CrmContactHistoryServiceImpl extends HService implements CrmContactHistoryService {

    /**
     * 컨택히스토리 등록 DAO
     */
	@Resource(name="CrmcontactHistoryDAO")
	CrmContactHistoryDAO CrmcontactHistoryDAO;


	/**
     * 컨택히스토리 목록 수량
     */
    @Override
    public int selectMsgHistorysByConditionCnt(ContactHistorySearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}

        return CrmcontactHistoryDAO.selectMsgHistorysByConditionCnt(searchVO);
    }


    /**
     * 컨택히스토리 목록
     */
    @Override
    public List<ContactHistoryVO> selectMsgHistorysByCondition(ContactHistorySearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}

        return CrmcontactHistoryDAO.selectMsgHistorysByCondition(searchVO);
    }


}
