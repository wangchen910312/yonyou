package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.pmm.vo.VenderCustomerMasterExcelVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterExcelVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterSaveVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;

/**
 * 거래처 관리 서비스
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

public interface VenderMasterService {

    /**
     * 거래처 정보를 등록한다.
     * @param venderMasterVO - 등록할 정보가 담긴 VenderMasterSaveVO
     * @return 등록된 목록수
     */
    public int insertVenderMaster(VenderMasterSaveVO venderMasterSaveVO) throws Exception;

    /**
     * 거래처 정보를 수정한다.
     * @param venderMasterVO - 수정할 정보가 담긴 VenderMasterSaveVO
     * @return 수정된 목록수
     */
    public int updateVenderMaster(VenderMasterSaveVO venderMasterSaveVO) throws Exception;

    /**
     * 거래처 정보를 삭제한다.
     * @param venderMasterVO - 삭제할 정보가 담긴 VenderMasterVO
     * @return 삭제된 목록수
     */
    public int deleteVenderMaster(VenderMasterVO venderMasterVO) throws Exception;

    /**
     * Key에 해당하는 거래처 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param bpCd - 거래처코드
     * @return 조회한 거래처 정보
     */
    public VenderMasterVO selectVenderMasterByKey(String dlrCd, String bpCd) throws Exception;

    /**
     * 거래처 유형 해당하는 거래처 키 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param bpTp - 거래처유형
     * @return 조회한 거래처 정보
     */
    public VenderMasterVO selectVenderMasterBpTpByKey(String dlrCd, String bpTp) throws Exception;

    /**
     * BHMC에 해당하는 거래처 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 거래처 정보
     */
    public VenderMasterVO selectBHMCVenderMaster(String dlrCd) throws Exception;

    /**
     * 액셀 거래처 정보를 등록/수정/삭제 처리한다.
     * @param venderMasterSaveVO - 수정정보를 포함하는 VenderMasterExcelVO
     */
    public void multiVenderMastersExcelDown(BaseSaveVO<VenderMasterExcelVO> venderMasterSaveVO) throws Exception;

    /**
     * 액셀 고객 거래처 정보를 등록/수정/삭제 처리한다.
     * @param venderMasterSaveVO - 수정정보를 포함하는 VenderMasterExcelVO
     */
    public void multiVenderCustomerMastersExcelDown(BaseSaveVO<VenderMasterExcelVO> venderMasterSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 거래처 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록
     */
    public List<VenderMasterVO> selectVenderMastersByCondition(VenderMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전체 거래처 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록
     */
    public List<VenderMasterVO> selectAllVenderMastersByCondition(VenderMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 거래처 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록
     */
    public List<VenderMasterExcelVO> selectVenderMastersExcelDownByCondition(VenderMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 고객정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록
     */
    public List<VenderCustomerMasterExcelVO> selectVenderCustomerMastersExcelDownByCondition(VenderMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 거래처 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectVenderMastersByConditionCnt(VenderMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전체 거래처 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectAllVenderMastersByConditionCnt(VenderMasterSearchVO searchVO) throws Exception;
}
