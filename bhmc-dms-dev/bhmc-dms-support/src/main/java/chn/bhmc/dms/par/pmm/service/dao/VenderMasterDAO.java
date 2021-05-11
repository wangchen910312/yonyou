package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pmm.vo.VenderCustomerMasterExcelVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterExcelVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;

/**
 * 거래처 관리 데이타 매퍼 클래스
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

@Mapper("venderMasterDAO")
public interface VenderMasterDAO {

    /**
     * 거래처 정보를 등록한다.
     * @param venderMaster - 등록할 정보가 담긴 VenderMasterVO
     * @return 등록된 목록수
     */
    public int insertVenderMaster(VenderMasterVO venderMasterVO);

    /**
     * 거래처 정보를 수정한다.
     * @param venderMaster - 수정할 정보가 담긴 VenderMasterVO
     * @return 수정된 목록수
     */
    public int updateVenderMaster(VenderMasterVO venderMasterVO);

    /**
     * 액셀 거래처 정보를 추가한다.
     * @param venderMaster - 추가할 정보가 담긴 VenderMasterVO
     * @return 수정된 목록수
     */
    public int insertVenderMasterExcelDown(VenderMasterExcelVO venderMasterExcelVO);

    /**
     * 액셀 거래처 정보를 수정한다.
     * @param venderMaster - 수정할 정보가 담긴 VenderMasterVO
     * @return 수정된 목록수
     */
    public int updateVenderMasterExcelDown(VenderMasterExcelVO venderMasterExcelVO);

    /**
     * 거래처 정보를 삭제한다.
     * @param venderMaster - 삭제할 정보가 담긴 VenderMasterVO
     * @return 삭제된 목록수
     */
    public int deleteVenderMaster(VenderMasterVO venderMasterVO);

    /**
     * Key에 해당하는 거래처 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param bpCd - 거래처 코드
     * @return 조회한 거래처 정보
     */
    public VenderMasterVO selectVenderMasterByKey(@Param("dlrCd") String dlrCd, @Param("bpCd") String bpCd);

    /**
     * 거래처 유형 해당하는 거래처 키 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param bpTp - 거래처유형
     * @return 조회한 거래처 정보
     */
    public VenderMasterVO selectVenderMasterBpTpByKey(@Param("dlrCd") String dlrCd, @Param("bpTp") String bpTp);

    /**
     * BHMC에 해당하는 거래처 정보를 가져옴.
     * @param dlrCd - 딜러코드
     * @return 조회한 거래처 정보
     */
    public VenderMasterVO selectBHMCVenderMaster(@Param("dlrCd") String dlrCd);

    /**
     * 조회 조건에 해당하는 거래처 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록
     */
    public List<VenderMasterVO> selectVenderMastersByCondition(VenderMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 거래처 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록
     */
    public List<VenderMasterVO> selectAllVenderMastersByCondition(VenderMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 거래처 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록
     */
    public List<VenderMasterExcelVO> selectVenderMastersExcelDownByCondition(VenderMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 고객 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록
     */
    public List<VenderCustomerMasterExcelVO> selectVenderCustomerMastersExcelDownByCondition(VenderMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 거래처 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectVenderMastersByConditionCnt(VenderMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 거래처 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectAllVenderMastersByConditionCnt(VenderMasterSearchVO searchVO);
}
