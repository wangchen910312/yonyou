package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.crm.vo.ZipCodeSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ZipCodeVO;
import chn.bhmc.dms.mob.api.crm.dao.CrmZipCodeDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmZipCodeService;

/**
 * 우편번호 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("CrmzipCodeService")
public class CrmZipCodeServiceImpl extends HService implements CrmZipCodeService {

    /**
     * 우편번호 관리 DAO
     */
	@Resource(name="CrmzipCodeDAO")
	CrmZipCodeDAO CrmzipCodeDAO;

	/**
     * {@inheritDoc}
     */
    @Override
    public List<ZipCodeVO> selectZipCodesByCondition(ZipCodeSearchVO searchVO) throws Exception {
        return CrmzipCodeDAO.selectZipCodesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectZipCodesByConditionCnt(ZipCodeSearchVO searchVO) throws Exception {
        return CrmzipCodeDAO.selectZipCodesByConditionCnt(searchVO);
    }
}
