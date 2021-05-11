

package chn.bhmc.dms.mob.api.part.service;

import java.util.List;

import chn.bhmc.dms.mob.api.part.vo.PartsVenderSalPriceTargetExcelDownVO;
import chn.bhmc.dms.mob.api.part.vo.PartsVenderSalPriceTargetMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.PartsVenderSalPriceTargetMasterVO;



/**
 * 판매가 대상선정 부품구매/판매가격 마스터 관리 서비스
 *
 * @author In Bo Shim
 * @since 2016. 4. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 4. 19.     In Bo Shim      최초 생성
 * </pre>
 */

public interface PartPartsVenderSalPriceTargetMasterService {

   
    /**
     * 조회 조건에 해당하는판매가 대상선정 부품구매/판매가격 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderPriceTargetMasterSearchVO
     * @return 조회 목록
     */
    public List<PartsVenderSalPriceTargetMasterVO> selectPartsVenderSalPriceTargetMastersByCondition(PartsVenderSalPriceTargetMasterSearchVO searchVO) throws Exception;

    
    /**
     * 조회 조건에 해당하는판매가 대상선정 부품구매/판매가격 마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderPriceTargetMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsVenderSalPriceTargetMastersByConditionCnt(PartsVenderSalPriceTargetMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는판매가 대상선정 부품구매/판매가격 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderPriceTargetMasterSearchVO
     * @return 조회 목록
     */
    public List<PartsVenderSalPriceTargetExcelDownVO> selectPartsVenderSalPriceTargetMastersExcelDownByCondition(PartsVenderSalPriceTargetMasterSearchVO searchVO) throws Exception;

  }
