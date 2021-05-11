package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationDefineVO;

/**
 * 로케이션 구조 정의 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 1. 6.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim     최초 생성
 * </pre>
 */

@Mapper("binLocationDefineDAO")
public interface BinLocationDefineDAO {

    /**
     * 로케이션 구조 정의 정보를 등록한다.
     * @param binLocationDefineVO - 등록할 정보가 담긴 BinLocationDefineVO
     * @return 등록된 목록수
     */
    public int insertBinLocationDefine(BinLocationDefineVO binLocationDefineVO);

    /**
     * 로케이션 구조 정의 정보를 수정한다.
     * @param binLocationDefineVO - 수정할 정보가 담긴 BinLocationDefineVO
     * @return 수정된 목록수
     */
    public int updateBinLocationDefine(BinLocationDefineVO binLocationDefineVO);

    /**
     * 로케이션 구조 정의 정보를 삭제한다.
     * @param binLocationDefineVO - 삭제할 정보가 담긴 BinLocationDefineVO
     * @return 삭제된 목록수
     */
    public int deleteBinLocationDefine(BinLocationDefineVO binLocationDefineVO);

    /**
     * Key에 해당하는 로케이션 구조 정의 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param lvlId - 레벨ID
     * @return 조회한 로케이션 구조 정의 정보
     */
    public BinLocationDefineVO selectBinLocationDefineByKey(@Param("dlrCd") String dlrCd, @Param("lvlId") int lvlId);

    /**
     * 조회 조건에 해당하는 로케이션 구조 정의 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationDefineSearchVO
     * @return 조회 목록
     */
    public List<BinLocationDefineVO> selectBinLocationDefineByCondition(BinLocationDefineSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 로케이션 구조 정의 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationDefineSearchVO
     * @return 조회 목록 수
     */
    public int selectBinLocationDefineByConditionCnt(BinLocationDefineSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 로케이션 레벨 콤보 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationDefineSearchVO
     * @return 조회 목록
     */
    public List<BinLocationDefineVO> selectBinLocationLevelCombo(BinLocationDefineSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 로케이션 레벨 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationDefineSearchVO
     * @return 조회 목록
     */
    public int selectBinLocationLevelCount(BinLocationDefineSearchVO searchVO);
}
