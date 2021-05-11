package chn.bhmc.dms.cmm.cmp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.cmp.vo.OfficeSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.OfficeVO;

/**
 * 사무소 관리 DAO
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */
@Mapper("officeDAO")
public interface OfficeDAO {

    /**
     * 사무소 정보를 등록한다.
     * @param officeVO - 등록할 정보가 담긴 OfficeVO
     * @return 등록된 목록수
     */
    public int insertOffice(OfficeVO officeVO);

    /**
     * 사무소 정보를 수정한다.
     * @param officeVO - 수정할 정보가 담긴 OfficeVO
     * @return 수정된 목록수
     */
    public int updateOffice(OfficeVO officeVO);

    /**
     * 사무소 정보를 삭제한다.
     * @param officeVO - 삭제할 정보가 담긴 OfficeVO
     * @return 삭제된 목록수
     */
    public int deleteOffice(OfficeVO officeVO);

    /**
     * Key에 해당하는 사무소 정보를 조회한다.
     * @param diviCd 사업부코드
     * @param offCd 사무소코드
     * @return 조회한 사무소 정보
     */
    public OfficeVO selectOfficeByKey(@Param("diviCd") String diviCd, @Param("offCd") String offCd);

    /**
     * 조회 조건에 해당하는 사무소 정보를 조회한다.
     * @param searchVO 조회 조건을 포함하는 OfficeSearchVO
     * @return 조회 목록
     */
    public List<OfficeVO> selectOfficesByCondition(OfficeSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 사무소 총 갯수를 조회한다.
     * @param searchVO 조회 조건을 포함하는 OfficeSearchVO
     * @return
     */
    public int selectOfficesByConditionCnt(OfficeSearchVO searchVO);
}
