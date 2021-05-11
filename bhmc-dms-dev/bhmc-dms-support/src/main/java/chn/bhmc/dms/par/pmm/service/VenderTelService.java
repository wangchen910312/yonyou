package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.par.pmm.vo.VenderTelSearchVO;
import chn.bhmc.dms.par.pmm.vo.VenderTelVO;

/**
 * 거래처 연락처 서비스
 *
 * @author In Bo Shim
 * @since 2016. 4. 21.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 4. 21.     In Bo Shim      최초 생성
 * </pre>
 */

public interface VenderTelService {
    /**
     * 거래처 연락처 정보를 등록한다.
     * @param venderTelVO - 등록할 정보가 담긴 VenderTelVO
     * @return 등록된 목록수
     */
    public int insertVenderTel(VenderTelVO venderTelVO) throws Exception;

    /**
     * 거래처 연락처 정보를 수정한다.
     * @param venderTelVO - 수정할 정보가 담긴 VenderTelVO
     * @return 수정된 목록수
     */
    public int updateVenderTel(VenderTelVO venderTelVO) throws Exception;

    /**
     * 거래처 연락처 정보를 삭제한다.
     * @param venderTelVO - 삭제할 정보가 담긴 VenderTelVO
     * @return 삭제된 목록수
     */
    public int deleteVenderTel(VenderTelVO venderTelVO) throws Exception;

    /**
     * 조회 조건에 해당하는 거래처 연락처 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록
     */
    public List<VenderTelVO> selectVenderTelsByCondition(VenderTelSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 거래처 연락처 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectVenderTelsByConditionCnt(VenderTelSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 거래처 연락처 정보를 최대 2개를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록
     */
    public List<VenderTelVO> selectVenderTelsMaxTwoRowByCondition(VenderTelSearchVO searchVO) throws Exception;

}
