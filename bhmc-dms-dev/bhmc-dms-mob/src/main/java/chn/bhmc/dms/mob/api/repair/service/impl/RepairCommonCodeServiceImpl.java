package chn.bhmc.dms.mob.api.repair.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import able.com.service.HService;
import chn.bhmc.dms.mob.api.repair.dao.RepairCommonCodeDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairCommonCodeService;
import chn.bhmc.dms.mob.api.repair.vo.CommonCodeSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.CommonCodeVO;

/**
 * 공통코드 관리 서비스 구현 클래스
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

@Service("RepairCommonCodeService")
public class RepairCommonCodeServiceImpl extends HService implements RepairCommonCodeService {

	@Resource(name="RepairCommonCodeDAO")
	RepairCommonCodeDAO RepairCommonCodeDAO;

    @Override
    @Cacheable(value="commonCodeCache")
    public List<CommonCodeVO> selectCommonCodesByCmmGrpCd(String cmmGrpCd, String useYn, String langCd) throws Exception {
        CommonCodeSearchVO searchVO = new CommonCodeSearchVO();
        searchVO.setsCmmGrpCd(cmmGrpCd);
        searchVO.setsUseYn(useYn);
        searchVO.setsLangCd(langCd);

        return selectCommonCodesByCmmGrpCd(searchVO);
    }

    @Cacheable(value="commonCodeCache")
    public List<CommonCodeVO> selectCommonCodesByCmmGrpCd(CommonCodeSearchVO searchVO) throws Exception {
        return RepairCommonCodeDAO.selectCommonCodesByCmmGrpCd(searchVO);
    }

}
