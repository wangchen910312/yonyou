package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationDefineVO;

/**
 * 로케이션 구조 정의 서비스
 *
 * @author In Bo Shim
 * @since 2016. 1. 6.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim      최초 생성
 * </pre>
 */

public interface BinLocationDefineService {

    /**
     * 로케이션 구조 정의 정보를 등록한다.
     * @param binLocationDefineVO - 등록할 정보가 담긴 BinLocationDefineVO
     * @return 등록된 목록수
     */
    public int insertBinLocationDefine(BinLocationDefineVO binLocationDefineVO) throws Exception;

    /**
     * 로케이션 구조 정의 정보를 수정한다.
     * @param binLocationDefineVO - 수정할 정보가 담긴 BinLocationDefineVO
     * @return 수정된 목록수
     */
    public int updateBinLocationDefine(BinLocationDefineVO binLocationDefineVO) throws Exception;

    /**
     * 로케이션 구조 정의 정보를 삭제한다.
     * @param binLocationDefineVO - 삭제할 정보가 담긴 BinLocationDefineVO
     * @return 삭제된 목록수
     */
    public int deleteBinLocationDefine(BinLocationDefineVO binLocationDefineVO) throws Exception;

    /**
     * Key에 해당하는 로케이션 구조 정의 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param lvlId - 레벨ID
     * @return 조회한 로케이션 구조 정의 정보
     */
    public BinLocationDefineVO selectBinLocationDefineByKey(String dlrCd, int lvlId) throws Exception;

    /**
     * 로케이션 구조 정의 정보를 등록/수정/삭제 처리한다.
     * @param binLocationDefineSaveVO - 등록/수정/삭제할 정보가 담긴 BinLocationDefineVO
     * @return
     */
    public void multiBinLocationDefines(BaseSaveVO<BinLocationDefineVO> binLocationDefineSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 로케이션 구조 정의 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationDefineSearchVO
     * @return 조회 목록
     */
    public List<BinLocationDefineVO> selectBinLocationDefinesByCondition(BinLocationDefineSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 로케이션 구조 정의 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationDefineSearchVO
     * @return 조회 목록 수
     */
    public int selectBinLocationDefinesByConditionCnt(BinLocationDefineSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 로케이션 레벨 콤보 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationDefineSearchVO
     * @return 조회 목록
     */
    public List<BinLocationDefineVO> selectBinLocationLevelCombo(BinLocationDefineSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 로케이션 레벨 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationDefineSearchVO
     * @return 조회 목록
     */
    public int selectBinLocationLevelCount(BinLocationDefineSearchVO searchVO) throws Exception;

}
