package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationItemVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterTreeListVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterVO;


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

public interface BinLocationMasterService {

    /**
     * 로케이션 마스터 정보를 등록한다.
     * @param binLocationMasterVO - 등록할 정보가 담긴 BinLocationMasterVO
     * @return 등록된 목록수
     */
    public int insertBinLocationMaster(BinLocationMasterVO binLocationMasterVO) throws Exception;

    /**
     * 로케이션 품목 재고 정보를 수정한다.
     * @param binLocationMasterVO - 수정할 정보가 담긴 BinLocationMasterVO
     * @return 수정된 목록수
     */
    public int updateBinLocationItemStock(BinLocationMasterVO binLocationMasterVO) throws Exception;

    /**
     * 로케이션 마스터 정보를 수정한다.
     * @param binLocationMasterVO - 수정할 정보가 담긴 BinLocationMasterVO
     * @return 수정된 목록수
     */
    public int updateBinLocationMaster(BinLocationMasterVO binLocationMasterVO) throws Exception;

    /**
     * 로케이션 마스터 정보를 삭제한다.
     * @param binLocationMasterVO - 삭제할 정보가 담긴 BinLocationMasterVO
     * @return 삭제된 목록수
     */
    public int deleteBinLocationMaster(BinLocationMasterVO binLocationMasterVO) throws Exception;

    /**
     * Key에 해당하는 로케이션 마스터 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param fullCd - 로케이션 코드
     * @return 조회한 로케이션 정보
     */
    public BinLocationMasterVO selectBinLocationMasterByKey(String dlrCd, String fullCd) throws Exception;

    /**
     * 로케이션 마스터 계층정보를 등록/수정/삭제 처리한다.
     * @param binLocationMasterSaveVO - 등록/수정/삭제할 정보가 담긴 BinLocationMasterVO
     * @return
     */
    public void multiBinLocationMasters(BaseSaveVO<BinLocationMasterVO> binLocationMasterSaveVO) throws Exception;

    /**
     * 로케이션 마스터 최종부품정보를 등록/수정/삭제 처리한다.
     * @param binLocationMasterSaveVO - 등록/수정/삭제할 정보가 담긴 BinLocationMasterVO
     * @return
     */
    public void multiBinLocationMasterItems(BaseSaveVO<BinLocationMasterVO> binLocationMasterSaveVO) throws Exception;

    /**
     * 조회조건에 해당하는 로케이션 마스터 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터 코드
     * @param strgeCd - 창고 코드
     * @param locCd - 로케이션 코드
     * @param itemCd - 품목 코드
     * @return 조회한 로케이션 정보
     */
    public BinLocationMasterVO selectBinLocationItemInfo(String dlrCd, String pltCd, String strgeCd, String locCd, String itemCd) throws Exception;

    /**
     * 조회 조건에 해당하는 로케이션 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationItemVO> selectBinLocationItemsByCondition(BinLocationMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 로케이션 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterVO> selectBinLocationMastersByCondition(BinLocationMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 로케이션 마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectBinLocationMastersByConditionCnt(BinLocationMasterSearchVO searchVO) throws Exception;

    /**
     * 부품 조건에 해당하는 로케이션 마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterVO> selectBinLocationMasterByItemCd(BinLocationMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 로케이션 마스터 트리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterTreeListVO> selectBinLocationMastersTreeListByCondition(BinLocationMasterSearchVO searchVO) throws Exception;

    /**
     * 로케이션 레벨에 해당하는 로케이션 마스터 콤보 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return 조회 목록
     */
    public List<BinLocationMasterVO> selectBinLocationMasterComboByLevel(BinLocationMasterSearchVO searchVO) throws Exception;




}
