package chn.bhmc.dms.cmm.cmp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.cmp.vo.BossSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;

/**
 * 딜러에 관한 데이터처리 매퍼 클래스
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

@Mapper("dealerDAO")
public interface DealerDAO {

    /**
     * 딜러 정보를 수정한다.
     * @param dealerVO - 수정할 정보가 담긴 DealerVO
     * @return 수정된 목록수
     */
    public int updateDealer(DealerVO dealerVO);

    /**
     * Key에 해당하는 딜러 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 딜러 정보
     */
    public DealerVO selectDealerByKey(@Param("dlrCd") String langCd);

    /**
     * 딜러코드 또는 딜러명이 query를 포함하는 목록을 조회한다.
     * @param sText 조회 텍스트
     * @param maxRows 최대 목록 수
     * @return
     */
    public List<DealerVO> selectDealersForSuggest(@Param("sText") String sText, @Param("maxRows") int maxRows);

    /**
     * 조회 조건에 해당하는 딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return 조회 목록
     */
    public List<DealerVO> selectDealersByCondition(DealerSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 딜러 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    public int selectDealersByConditionCnt(DealerSearchVO searchVO);

    /**
     * 딜러 마이그레이션 상태 수정
     * @param searchVO - 조회 조건을 포함하는 DealerVO
     * @return
     */
    public int updateDcsMigStat(DealerVO dealerVO);

    /**
     * 조회 조건에 해당하는 딜러 목록를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return 조회 목록
     */
    public List<DealerVO> selectDealerListByCondition(DealerSearchVO searchVO);
    
    /**
     * 服务业务报表 经销商表增加区域经理权限 贾明 2018-9-20
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectDealerListByConditionCnt(DealerSearchVO searchVO);

    /**
     * 根据id查询是否为大区主任(部门科长)  2020-9-20
     * @param userId
     * @return
     */
	public BossSearchVO selectTskListByCondition(String userId);
}
