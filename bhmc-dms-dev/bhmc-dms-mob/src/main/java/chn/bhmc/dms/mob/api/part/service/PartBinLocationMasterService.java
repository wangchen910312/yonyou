package chn.bhmc.dms.mob.api.part.service;

import java.util.List;

import chn.bhmc.dms.mob.api.part.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.BinLocationMasterVO;




/**
 * 로케이션 마스터 서비스
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

public interface PartBinLocationMasterService {

   
    /**
     * 조회 조건에 해당하는 로케이션 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterVO> selectBinLocationMastersByCondition(BinLocationMasterSearchVO searchVO) throws Exception;
//
//    /**
//     * 조회 조건에 해당하는 로케이션 마스터 총 갯수를 조회한다.
//     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
//     * @return 조회 목록 수
//     */
//    public int selectBinLocationMastersByConditionCnt(BinLocationMasterSearchVO searchVO) throws Exception;

    /**
     * 로케이션 레벨에 해당하는 로케이션 마스터 콤보 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterVO> selectBinLocationMasterComboByLevel(BinLocationMasterSearchVO searchVO) throws Exception;

    /**
     * 부품 조건에 해당하는 로케이션 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public int selectBinLocationMasterByItemCdCnt(BinLocationMasterSearchVO searchVO) throws Exception;

    /**
     * 부품 조건에 해당하는 로케이션 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterVO> selectBinLocationMasterByItemCd(BinLocationMasterSearchVO searchVO) throws Exception;

}
