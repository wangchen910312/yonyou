package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pmm.vo.BinLocationItemVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterTreeListVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterVO;

/**
 * 로케이션 마스터 데이타 매퍼 클래스
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

@Mapper("binLocationMasterDAO")
public interface BinLocationMasterDAO {

    /**
     * 로케이션 마스터 정보를 등록한다.
     * @param binLocationMasterVO - 등록할 정보가 담긴 BinLocationMasterVO
     * @return 등록된 목록수
     */
    public int insertBinLocationMaster(BinLocationMasterVO binLocationMasterVO);

    /**
     * 로케이션 품목재고 정보를 수정한다.
     * @param binLocationMasterVO - 수정할 정보가 담긴 BinLocationMasterVO
     * @return 수정된 목록수
     */
    public int updateBinLocationItemStock(BinLocationMasterVO binLocationMasterVO);

    /**
     * 로케이션 마스터 하위 정보를 수정한다.
     * @param binLocationMasterVO - 수정할 정보가 담긴 BinLocationMasterVO
     * @return 수정된 목록수
     */
    public int updateBinLocationMasterChild(BinLocationMasterVO binLocationMasterVO);

    /**
     * 로케이션 마스터 정보를 수정한다.
     * @param binLocationMasterVO - 수정할 정보가 담긴 BinLocationMasterVO
     * @return 수정된 목록수
     */
    public int updateBinLocationMaster(BinLocationMasterVO binLocationMasterVO);

    /**
     * 로케이션 마스터 정보를 삭제한다.
     * @param binLocationMasterVO - 삭제할 정보가 담긴 BinLocationMasterVO
     * @return 삭제된 목록수
     */
    public int deleteBinLocationMaster(BinLocationMasterVO binLocationMasterVO);

    /**
     * Key에 해당하는 로케이션 마스터 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param fullCd - 로케이션 코드
     * @return 조회한 로케이션 정보
     */
    public BinLocationMasterVO selectBinLocationMasterByKey(@Param("dlrCd") String dlrCd, @Param("fullCd") String fullCd);

    /**
     * 조회조건에 해당하는 로케이션 마스터 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터 코드
     * @param strgeCd - 창고 코드
     * @param locCd - 로케이션 코드
     * @param itemCd - 품목 코드
     * @return 조회한 로케이션 정보
     */
    public BinLocationMasterVO selectBinLocationItemInfo(@Param("dlrCd") String dlrCd, @Param("pltCd") String pltCd, @Param("strgeCd") String strgeCd, @Param("locCd") String locCd, @Param("itemCd") String itemCd);

    /**
     * 조회 조건에 해당하는 로케이션 마스터 하위 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterVO> selectBinLocationMasterChildByCondition(BinLocationMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 로케이션 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterVO> selectBinLocationMasterByCondition(BinLocationMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 로케이션 마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectBinLocationMasterByConditionCnt(BinLocationMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 로케이션 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationItemVO> selectBinLocationItemsByCondition(BinLocationMasterSearchVO searchVO) throws Exception;

    /**
     * 부품 조건에 해당하는 로케이션 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterVO> selectBinLocationMasterByItemCd(BinLocationMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 로케이션 마스터 트리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterTreeListVO> selectBinLocationMasterTreeListByCondition(BinLocationMasterSearchVO searchVO);

    /**
     * 로케이션 레벨에 해당하는 로케이션 마스터 콤보 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterVO> selectBinLocationMasterComboByLevel(BinLocationMasterSearchVO searchVO);

}
