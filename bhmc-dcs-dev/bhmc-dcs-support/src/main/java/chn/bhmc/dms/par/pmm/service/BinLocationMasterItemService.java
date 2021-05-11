package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterItemVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;


/**
 * 부번별 로케이션 마스터 서비스
 *
 * @author In Bo Shim
 * @since 2016. 6. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 6. 15.     In Bo Shim      최초 생성
 * </pre>
 */

public interface BinLocationMasterItemService {

    /**
     * 로케이션 마스터 최종부품정보를 등록/수정/삭제 처리한다.
     * @param binLocationMasterSaveVO - 등록/수정/삭제할 정보가 담긴 BinLocationMasterVO
     * @return
     */
    public void multiBinLocationMasterItems(BaseSaveVO<BinLocationMasterItemVO> binLocationMasterSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부번별 로케이션 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterItemVO> selectBinLocationMasterItemsByCondition(BinLocationMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부번별 로케이션 마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectBinLocationMasterItemsByConditionCnt(BinLocationMasterSearchVO searchVO) throws Exception;

}
