package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.ZipCodeSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ZipCodeVO;

/**
 * 우편번호에 관한 데이터처리 매퍼 클래스
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

@Mapper("CrmzipCodeDAO")
public interface CrmZipCodeDAO {

    /**
     * 조회 조건에 해당하는 우편번호정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ZipCodeSearchVO
     * @return 조회 목록
     */
    public List<ZipCodeVO> selectZipCodesByCondition(ZipCodeSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 우편번호총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ZipCodeSearchVO
     * @return
     */
    public int selectZipCodesByConditionCnt(ZipCodeSearchVO searchVO);
}
