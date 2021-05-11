package chn.bhmc.dms.mob.api.repair.service;

import java.util.List;
import chn.bhmc.dms.mob.api.repair.vo.CommonCodeSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.CommonCodeVO;



/**
 * 공통코드 관리 서비스
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

public interface RepairCommonCodeService {


	 public List<CommonCodeVO> selectCommonCodesByCmmGrpCd(String cmmGrpCd, String useYn, String langCd) throws Exception;

	 public List<CommonCodeVO> selectCommonCodesByCmmGrpCd(CommonCodeSearchVO searchVO) throws Exception;

}
