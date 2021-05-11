package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pmm.vo.*;

/**
 * 공급처별 부품판매가격 마스터 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 16.     In Bo Shim      최초 생성
 * </pre>
 */

@Mapper("partsVenderSalPriceMasterDAO")
public interface PartsVenderSalPriceMasterDAO {

    /**
     * 공급처별 부품판매가격 마스터 정보를 등록한다.
     * @param partsVenderPriceMaster - 등록할 정보가 담긴 PartsVenderPriceMasterVO
     * @return 등록된 목록수
     */
    public int insertPartsVenderSalPriceMaster(PartsVenderSalPriceMasterVO partsVenderSalPriceMasterVO);

    /**
     * 공급처별 부품판매가격 마스터 정보를 수정한다.
     * @param partsVenderSalPriceMaster - 수정할 정보가 담긴 PartsVenderSalPriceMasterVO
     * @return 수정된 목록수
     */
    public int updatePartsVenderSalPriceMaster(PartsVenderSalPriceMasterVO partsVenderSalPriceMasterVO);

    /**
     * 판매가대상선정 부품판매가격 마스터 정보를 등록한다.
     * @param partsVenderPriceMaster - 등록할 정보가 담긴 PartsVenderPriceMasterVO
     * @return 등록된 목록수
     */
    public int insertPartsVenderSalPriceTargetMaster(PartsVenderSalPriceTargetMasterVO partsVenderSalPriceTargetMasterVO);

    /**
     * 판매가대상선정 부품판매가격 마스터 정보를 수정한다.
     * @param partsVenderSalPriceMaster - 수정할 정보가 담긴 PartsVenderSalPriceMasterVO
     * @return 수정된 목록수
     */
    public int updatePartsVenderSalPriceTargetMaster(PartsVenderSalPriceTargetMasterVO partsVenderSalPriceTargetMasterVO);


    /**
     * 공급처별 부품판매가격 마스터 정보를 삭제한다.
     * @param partsVenderSalPriceMaster - 삭제할 정보가 담긴 PartsVenderSalPriceMasterVO
     * @return 삭제된 목록수
     */
    public int deletePartsVenderSalPriceMaster(PartsVenderSalPriceMasterVO partsVenderSalPriceMasterVO);

    /**
     * Key에 해당하는 공급처별 부품판매가격 마스터 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param bpCd - 거래처코드
     * @param itemCd - 부품코드
     * @param prcTp - 가격유형
     * @param lineNo - 라인번호
     * @param delYn - 삭제유무
     * @return 조회한 공급처별 부품판매가격 마스터 정보
     */
    public PartsVenderSalPriceMasterVO selectPartsVenderSalPriceMasterByKey(@Param("dlrCd") String dlrCd, @Param("bpCd") String bpCd, @Param("itemCd") String itemCd, @Param("prcTp") String prcTp, @Param("lineNo") int lineNo, @Param("delYn") String delYn);

    /**
     * 조회 조건에 해당하는 공급처별 부품판매가격 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceMasterSearchVO
     * @return 조회 목록
     */
    public List<PartsVenderSalPriceMasterVO> selectPartsVenderSalPriceMastersByCondition(PartsVenderSalPriceMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는  부품구매가격 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceMasterSearchVO
     * @return 조회 목록
     */
    public List<PartsVenderSalPriceMasterVO> selectPartsPurcPriceMastersByKey(PartsVenderSalPriceMasterSearchVO searchVO);
    /**
     * 조회 조건에 해당하는  부품도소매가격 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceMasterSearchVO
     * @return 조회 목록
     */
    public List<PartsVenderSalPriceMasterVO> selectPartsRetailPriceMastersByKey(PartsVenderSalPriceMasterSearchVO searchVO);

    /**
     * 창고별 부품번호에 해당하는 공급처별 부품판매가격 마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsVenderSalPriceMastersByItemInfoCnt(PartsVenderSalPriceMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 공급처별 부품판매가격 마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsVenderSalPriceMastersByConditionCnt(PartsVenderSalPriceMasterSearchVO searchVO);

    /**
     * 유효시작일, 유효종료일을 확인하는 공급처별 부품판매가격 마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsVenderSalPriceMastersPeriodByConditionCnt(PartsVenderSalPriceMasterSearchVO searchVO);

    /**
     * Key에 해당하는 지불유형 별 부품 창고 가격 정보를 조회한다.
     */
    public PartsVenderSalPriceMasterVO selectPayTpPriceMasterByKey(PartsVenderSalPriceMasterSearchVO searchVO);

    /**
     * 修改维修组合中的配件价格
     * @param partsVenderSalPriceTargetMasterItemVO
     */
	public int updatePackagePar(PartsVenderSalPriceTargetMasterVO partsVenderSalPriceTargetMasterItemVO);

}
