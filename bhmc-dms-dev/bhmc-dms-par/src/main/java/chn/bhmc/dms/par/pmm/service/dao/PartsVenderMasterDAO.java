package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pmm.vo.PartsVenderMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderMasterVO;

/**
 * 공급처별 부품 마스터 데이타 매퍼 클래스
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

@Mapper("partsVenderMasterDAO")
public interface PartsVenderMasterDAO {

    /**     
     * 공급처별 부품 마스터 정보를 등록한다.
     * @param partsVenderMaster - 등록할 정보가 담긴 PartsVenderMasterVO
     * @return 등록된 목록수
     */
    public int insertPartsVenderMaster(PartsVenderMasterVO partsVenderMasterVO);
    
    /**     
     * 공급처별 부품 마스터 정보를 수정한다.
     * @param partsVenderMaster - 수정할 정보가 담긴 PartsVenderMasterVO
     * @return 수정된 목록수
     */
    public int updatePartsVenderMaster(PartsVenderMasterVO partsVenderMasterVO);
    
    /**     
     * 공급처별 부품 마스터 정보를 삭제한다.
     * @param partsVenderMaster - 삭제할 정보가 담긴 PartsVenderMasterVO
     * @return 삭제된 목록수
     */
    public int deletePartsVenderMaster(PartsVenderMasterVO partsVenderMasterVO);
    
    /**
     * Key에 해당하는 공급처별 부품 마스터 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param bpCd - 거래처 코드
     * @return 조회한 공급처별 부품 마스터 정보
     */
    public PartsVenderMasterVO selectPartsVenderMasterByKey(@Param("dlrCd") String dlrCd, @Param("bpCd") String bpCd);
    
    /**
     * 조회 조건에 해당하는 공급처별 부품 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderMasterSearchVO
     * @return 조회 목록
     */
    public List<PartsVenderMasterVO> selectPartsVenderMastersByCondition(PartsVenderMasterSearchVO searchVO);
    
    /**
     * 조회 조건에 해당하는 공급처별 부품 마스터 총 갯수를 조회한다.    
     * @param searchVO - 조회 조건을 포함하는 PartsVenderMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsVenderMastersByConditionCnt(PartsVenderMasterSearchVO searchVO);   
}
