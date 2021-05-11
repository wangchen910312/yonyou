package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pmm.vo.PartsVenderPriceMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderPriceMasterVO;

/**
 * 공급처별 부품구매가격 마스터 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 11.     In Bo Shim      최초 생성
 * </pre>
 */

@Mapper("partsVenderPriceMasterDAO")
public interface PartsVenderPriceMasterDAO {

    /**
     * 공급처별 부품구매가격 마스터 정보를 등록한다.
     * @param partsVenderPriceMaster - 등록할 정보가 담긴 PartsVenderPriceMasterVO
     * @return 등록된 목록수
     */
    public int insertPartsVenderPriceMaster(PartsVenderPriceMasterVO partsVenderPriceMasterVO);

    /**
     * 공급처별 부품구매가격 마스터 정보를 수정한다.
     * @param partsVenderPriceMaster - 수정할 정보가 담긴 PartsVenderPriceMasterVO
     * @return 수정된 목록수
     */
    public int updatePartsVenderPriceMaster(PartsVenderPriceMasterVO partsVenderPriceMasterVO);

    /**
     * 공급처별 부품구매가격 마스터 정보를 삭제한다.
     * @param partsVenderPriceMaster - 삭제할 정보가 담긴 PartsVenderPriceMasterVO
     * @return 삭제된 목록수
     */
    public int deletePartsVenderPriceMaster(PartsVenderPriceMasterVO partsVenderPriceMasterVO);

    /**
     * Key에 해당하는 공급처별 부품구매가격 마스터 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param bpCd - 거래처코드
     * @param itemCd - 부품코드
     * @param prcTp - 가격유형
     * @param lineNo - 라인번호
     * @param delYn - 삭제유무
     * @return 조회한 공급처별 부품구매가격 마스터 정보
     */
    public PartsVenderPriceMasterVO selectPartsVenderPriceMasterByKey(@Param("dlrCd") String dlrCd, @Param("bpCd") String bpCd, @Param("itemCd") String itemCd, @Param("prcTp") String prcTp, @Param("lineNo") int lineNo, @Param("delYn") String delYn);

    /**
     * 조회 조건에 해당하는 공급처별 부품구매가격 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderPriceMasterSearchVO
     * @return 조회 목록
     */
    public List<PartsVenderPriceMasterVO> selectPartsVenderPriceMastersByCondition(PartsVenderPriceMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 공급처별 부품구매가격 마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderPriceMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsVenderPriceMastersByConditionCnt(PartsVenderPriceMasterSearchVO searchVO);

    /**
     * 유효시작일, 유효종료일을 확인하는 공급처별 부품구매가격 마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderPriceMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsVenderPriceMastersPeriodByConditionCnt(PartsVenderPriceMasterSearchVO searchVO);
}
