package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pmm.vo.BinLocationMasterItemVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;

/**
 * 부번별 로케이션 마스터 데이타 매퍼 클래스
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

@Mapper("binLocationMasterItemDAO")
public interface BinLocationMasterItemDAO {

    /**
     * 부번별 로케이션 마스터 정보를 등록한다.(콤보용)
     * @param binLocationMasterVO - 등록할 정보가 담긴 BinLocationMasterVO
     * @return 등록된 목록수
     */
    public int insertBinLocationMasterItem(BinLocationMasterItemVO binLocationMasterVO);

    /**
     * 부번별 로케이션 마스터 정보를 등록한다.
     * @param binLocationMasterVO - 등록할 정보가 담긴 BinLocationMasterVO
     * @return 등록된 목록수
     */
    public int insertRealBinLocationMasterItem(BinLocationMasterItemVO binLocationMasterVO);

    /**
     * 부번별 로케이션 마스터 정보를 수정한다.(콤보용)
     * @param binLocationMasterVO - 수정할 정보가 담긴 BinLocationMasterVO
     * @return 수정된 목록수
     */
    public int updateBinLocationMasterItem(BinLocationMasterItemVO binLocationMasterVO);

    /**
     * 부번별 로케이션 마스터 정보를 수정한다.
     * @param binLocationMasterVO - 수정할 정보가 담긴 BinLocationMasterVO
     * @return 수정된 목록수
     */
    public int updateRealBinLocationMasterItem(BinLocationMasterItemVO binLocationMasterVO);

    /**
     * 부번별 로케이션 마스터 정보를 삭제한다.(콤보용)
     * @param binLocationMasterVO - 삭제할 정보가 담긴 BinLocationMasterVO
     * @return 삭제된 목록수
     */
    public int deleteBinLocationMasterItem(BinLocationMasterItemVO binLocationMasterVO);

    /**
     * 부번별 로케이션 마스터 정보를 삭제한다.
     * @param binLocationMasterVO - 삭제할 정보가 담긴 BinLocationMasterVO
     * @return 삭제된 목록수
     */
    public int deleteRealBinLocationMasterItem(BinLocationMasterItemVO binLocationMasterVO);


    /**
     * 조회 조건에 해당하는 부번별 로케이션 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterItemVO> selectBinLocationMasterItemsByCondition(BinLocationMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부번별 로케이션 마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectBinLocationMasterItemsByConditionCnt(BinLocationMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부번,창고별 로케이션 마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectBinLocationMasterItemsByKeyCnt(BinLocationMasterItemVO binLocationMasterVO);



}
