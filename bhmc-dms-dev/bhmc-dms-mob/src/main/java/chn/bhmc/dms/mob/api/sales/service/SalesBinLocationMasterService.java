package chn.bhmc.dms.mob.api.sales.service;

import java.util.List;

import chn.bhmc.dms.mob.api.sales.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.BinLocationMasterVO;




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

public interface SalesBinLocationMasterService {

 
    /**
     * 조회 조건에 해당하는 로케이션 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterVO> selectBinLocationMastersByCondition(BinLocationMasterSearchVO searchVO) throws Exception;

   



}
