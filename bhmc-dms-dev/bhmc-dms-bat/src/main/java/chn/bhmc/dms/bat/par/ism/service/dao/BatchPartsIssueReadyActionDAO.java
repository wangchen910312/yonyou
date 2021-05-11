package chn.bhmc.dms.bat.par.ism.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.bat.par.ism.vo.BatIssueReqDetailVO;
import chn.bhmc.dms.bat.par.ism.vo.BatIssueReqSearchVO;
import chn.bhmc.dms.bat.par.ism.vo.BatIssueReqVO;
import chn.bhmc.dms.bat.par.ism.vo.BatMovementTypeVO;
import chn.bhmc.dms.bat.par.ism.vo.BatMvtDocItemVO;
import chn.bhmc.dms.bat.par.ism.vo.BatMvtDocVO;
import chn.bhmc.dms.bat.par.ism.vo.BatStockInOutVO;
import chn.bhmc.dms.bat.par.ism.vo.BatSysOwnerDealerVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsIssueReadyActionDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2017. 1. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 14.     In Bo Shim     최초 생성
 * </pre>
 */
@Mapper("batchPartsIssueReadyActionDAO")
public interface BatchPartsIssueReadyActionDAO {

    /**
     * 부품예류정보를 조회한다.
     * @return 조회한 부품예류정보
     */

    public List<BatIssueReqDetailVO> selectIssueReqDetailResvsBatByCondition(BatIssueReqSearchVO searchVO) throws Exception;

    /**
     * 부품요청 헤더 정보를 수정한다.
     * @param issueReq - 수정할 정보가 담긴 IssueReqVO
     * @return 수정된 목록수
     */
    public int updateIssueReqBat(BatIssueReqVO issueReqVO);

    /**
     * 부품요청상세 정보를 수정한다.
     * @param issueReqDetail - 수정할 정보가 담긴 IssueReqDetail
     * @return 수정된 목록수
     */
    public int updateIssueReqDetailBat(BatIssueReqDetailVO issueReqDetailVO);

    /**
     * 수불유형 조회.
     * @param dlrCd - 딜러코드
     * @param mvtTp - 수불유형
     * @return MovementTypeVO
     */
    public BatMovementTypeVO selectMovementTypeBatByKey(@Param("dlrCd") String dlrCd, @Param("mvtTp") String mvtTp);

    /**
     * 취소수불유형 조회.
     * @param dlrCd - 딜러코드
     * @param mvtTp - 수불유형
     * @return MovementTypeVO
     */
    public BatMovementTypeVO selectCombiMovementTypeByKey(@Param("dlrCd") String dlrCd, @Param("mvtTp") String mvtTp);

    /**
     * 수불헤더 정보를 등록한다.
     * @param mvtDocVO - 등록할 정보가 담긴 MvtDocVO
     * @return 등록된 목록수
     */
    public int insertMvtDocBat(BatMvtDocVO mvtDocVO);

    /**
     * 수불아이템 정보를 등록한다.
     * @param mvtDocVO - 등록할 정보가 담긴 MvtDocVO
     * @return 등록된 목록수
     */
    public int insertMvtDocItemBat(BatMvtDocItemVO mvtDocItemVO);

    /**
     * Key에 해당하는 현재고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param strgeCd - 창고코드
     * @param itemCd - 부품코드
     * @return 조회한 재고정보
     */
    public BatStockInOutVO selectStockInOutBatByKey(@Param("dlrCd") String dlrCd, @Param("pltCd")  String pltCd, @Param("strgeCd") String strgeCd, @Param("itemCd") String itemCd);

    /**
     * 현재고 정보를 등록한다.
     * @param stockInOutVO - 등록할 정보가 담긴 StockInOutVO
     * @return 등록된 목록수
     */
    public int insertStockInOutBat(BatStockInOutVO stockInOutVO);

    /**
     * 현재고 정보를 수정한다.
     * @param stockInOutVO - 수정할 정보가 담긴 StockInOutVO
     * @return 수정된 목록수
     */
    public int updateStockInOutBat(BatStockInOutVO stockInOutVO);

    /**
     * 참조번호에 해당하는 수불문서품목 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param refDocNo - 참조번호
     * @param refDocLineNo - 참조라인번호
     * @return 조회한 수불문서품목 정보
     */
    public BatMvtDocItemVO selectMvtDocItemByRefInfo(@Param("dlrCd") String dlrCd, @Param("refDocNo") String refDocNo, @Param("refDocLineNo") int refDocLineNo);


    /**
     * 시스템 딜러 정보를 조회한다.
     * @param sysOwnerYn - 시스템딜러여부
     * @return 조회한 딜러정보
     */
    public List<BatSysOwnerDealerVO> selectSysOwnerDealerByCondition(@Param("sysOwnerYn") String sysOwnerYn);

    /**
     * 수불문서 키 가져오기.
     * @param dlrCd - 딜러코드
     * @return MovementTypeVO
     */
    public BatMvtDocVO selectMvtDocNoBatByKey(@Param("dlrCd") String dlrCd);

}
