package chn.bhmc.dms.par.ism.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.ism.vo.PartCalculateVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdItemVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO;

/**
 * 부품판매 데이타 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 2. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 23.     Ju Won Lee      최초 생성
 * </pre>
 */

@Mapper("partsSaleOrdDAO")
public interface PartsSaleOrdDAO {

    /**
     * 부품판매 헤더 정보를 등록한다.
     * @param issuePartsOut - 등록할 정보가 담긴 IssuePartsOutVO
     * @return 등록된 목록수
     */
    public int insertPartsSaleOrd(PartsSaleOrdVO partsSaleOrdVO);

    /**
     * 부품판매 부품 정보를 등록한다.
     * @param issuePartsOut - 등록할 정보가 담긴 IssuePartsOutVO
     * @return 등록된 목록수
     */
    public int insertPartsSaleOrdItem(PartsSaleOrdItemVO partsSaleOrdItemVO);

    /**
     *부품판매  정보를 확정처리한다.
     * @param partsSaleOrdVO - 등록할 정보가 담긴 PartsSaleOrdVO
     * @return 등록된 목록수
     */
    public int updateCalculateInfo(PartsSaleOrdVO partsSaleOrdVO);

    /**
     * Key에 해당하는 부품판매  정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public PartsSaleOrdVO selectPartsSaleOrdByKey(PartsSaleOrdSearchVO partsSaleOrdSearchVO);

    /**
     * Key에 해당하는 부품판매 부품 정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleOrdItemVO> selectPartsSaleOrdItemByKey(PartsSaleOrdSearchVO partsSaleOrdSearchVO);

    /**
     * Key에 해당하는 부품판매 부품 정보를 조회한다.(정산용)
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartCalculateVO> selectPartsSaleOrdCalcItemByKey(PartsSaleOrdSearchVO partsSaleOrdSearchVO);

    /**
     * 조건에 해당하는 부품판매 리스트 정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleOrdVO> selectPartsSaleOrdList(PartsSaleOrdSearchVO partsSaleOrdSearchVO);

    /**
     * 조건에 해당하는 부품판매 리스트 정보 Count를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleOrdListCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO);

    /**
     * 조건에 해당하는 부품판매(팝업) 리스트 정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleOrdVO> selectPartsSaleOrdPopList(PartsSaleOrdSearchVO partsSaleOrdSearchVO);

    /**
     * 조건에 해당하는 부품판매(팝업) 리스트 정보 Count를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleOrdPopListCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO);

    /**
     * 조건에 해당하는 부품판매 리스트(정산위주) 정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleOrdVO> selectPartsSaleOrdForCalcList(PartsSaleOrdSearchVO partsSaleOrdSearchVO);

    /**
     * 조건에 해당하는 부품판매 리스트(정산위주) 정보 Count를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleOrdForCalcListCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO);

    /**
     * 조건에 해당하는 부품판매 품목리스트 정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleOrdItemVO> selectPartsSaleOrdItemList(PartsSaleOrdSearchVO partsSaleOrdSearchVO);

    /**
     * 조건에 해당하는 부품판매 품목리스트 정보 Count를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleOrdItemListCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO);

    /**
     * 조건에 해당하는 부품판매 명세 정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleOrdItemVO> selectPartsSaleOrdItemByCondition(PartsSaleOrdSearchVO partsSaleOrdSearchVO);

    /**
     * 조건에 해당하는 부품판매 명세 정보 Count를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleOrdItemByConditionCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO);


    /**
     * 키에 해당하는 부품판매 등록 정보 Count를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleOrdItemRegCnt(PartsSaleOrdVO partsSaleOrdVO);

    /**
     * 판매번호에 해당하는 판매라인 Max값을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsSaleOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsSaleOrdMaxLineNo(PartsSaleOrdVO partsSaleOrdVO);

    /**
     * 견적Key에 해당하는 부품판매  정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public PartsSaleOrdVO selectPartsSaleOrdByEstimateKey(@Param("dlrCd") String dlrCd, @Param("estimateDocNo") String estimateDocNo);

    /**
     * 견적Key에 해당하는 부품판매 부품 정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleOrdItemVO> selectPartsSaleOrdItemByEstimateKey(@Param("dlrCd") String dlrCd, @Param("estimateDocNo") String estimateDocNo);

    /**
     * 부품판매 정보를 수정한다.
     * @param PartsSaleOrdItemVO - 수정할 정보가 담긴 PartsSaleOrdVO
     * @return 수정된 목록수
     */
    public int updatePartsSaleOrd(PartsSaleOrdVO partsSaleOrdVO);


    /**
     * 부품판매 부품 정보를 수정한다.
     * @param partsSaleOrdItemVO - 등록할 정보가 담긴 PartsSaleOrdItemVO
     * @return 수정된 목록수
     */
    public int updatePartsSaleOrdItem(PartsSaleOrdItemVO partsSaleOrdItemVO);

    /**
     * 부품판매 부품 정보(할인율)를 수정한다.
     * @param partsSaleOrdItemVO - 등록할 정보가 담긴 PartsSaleOrdItemVO
     * @return 수정된 목록수
     */
    public int updatePartsSaleOrdItemDcRate(PartCalculateVO partCalculateVO);


    /**
     * 부품판매 부품 정보를 삭제한다.
     * @param partsSaleOrdItemVO - 전송할 정보가 담긴 PartsSaleOrdItemVO
     * @return 삭제된 목록수
     */
    public int deletePartsSaleOrdItem(PartsSaleOrdItemVO partsSaleOrdItemVO);

    /**
     * 헤더 번호에 해당하는 모든 부품 정보를 삭제한다.
     * @param partsSaleOrdVO - 전송할 정보가 담긴 PartsSaleOrdVO
     * @return 삭제된 목록수
     */
    public int cancelPartsSaleOrd(PartsSaleOrdVO partsSaleOrdVO);

    /**
     * 헤더 번호에 해당하는 모든 부품 정보를 삭제한다.
     * @param partsSaleOrdVO - 전송할 정보가 담긴 PartsSaleOrdVO
     * @return 삭제된 목록수
     */
    public int cancelPartsSaleOrdItem(PartsSaleOrdItemVO partsSaleOrdItemVO);

    /**
     * 부품판매 정보 상태를 변경한다.
     * @param partsSaleOrdVO - 전송할 정보가 담긴 PartsSaleOrdVO
     * @return 변경된 목록수
     */
    public int modifyPartsSaleOrdStat(PartsSaleOrdVO partsSaleOrdVO);

    /**
     * 부품판매 정보를 확정한다.
     * @param partsSaleOrdVO - 전송할 정보가 담긴 PartsSaleOrdVO
     * @return 변경된 목록수
     */
    public int confirmPartsSaleOrdStat(PartsSaleOrdVO partsSaleOrdVO);

    /**
     * 부품판매 정보를 수정한다.(수정일시정보)
     * @param partsSaleOrdVO - 전송할 정보가 담긴 PartsSaleOrdVO
     * @return 변경된 목록수
     */
    public int updatePartsSaleUpdateDt(PartsSaleOrdVO partsSaleOrdVO);

    /**
     * 부품판매 부품 정보를 확정한다.
     * @param partsSaleOrdItemVO - 확정할 정보가 담긴 PartsSaleOrdItemVO
     * @return 수정된 목록수
     */
    public int cnfmPartsSaleOrdItem(PartsSaleOrdItemVO partsSaleOrdItemVO);

    /**
     * 부품판매 부품 정보를 수정한다.(수불정보)
     * @param partsSaleOrdItemVO - 등록할 정보가 담긴 PartsSaleOrdItemVO
     * @return 수정된 목록수
     */
    public int updateParSaleOrdItemMvtInfo(PartsSaleOrdItemVO partsSaleOrdItemVO);

    /**
     * 부품판매  정보를 수정한다.(수불정보)
     * @param partsSaleOrdVO - 등록할 정보가 담긴 PartsSaleOrdVO
     * @return 수정된 목록수
     */
    public int updateParSaleOrdMvtInfo(PartsSaleOrdVO partsSaleOrdVO);

    /**
     * Key에 해당하는 업로드 등록용 판매 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsSaleOrdItemVO
     * @return 조회한 판매 부품정보
     */
    public PartsSaleOrdItemVO selectPartsSaleOrdItemExcelUploadByKey(PartsSaleOrdItemVO partsSaleOrdItemVO);


    /**
     * 부품판매Key에 해당하는 부품판매  정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public PartsSaleOrdVO chkStatusPartsSaleOrdByKey(@Param("dlrCd") String dlrCd, @Param("parSaleOrdNo") String parSaleOrdNo);


    /**
     * 부품판매Key에 해당하는 부품판매  정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public PartsSaleOrdItemVO chkStatusPartsSaleOrdItemByKey(@Param("dlrCd") String dlrCd, @Param("parSaleOrdNo") String parSaleOrdNo, @Param("parSaleOrdLineNo") int parSaleOrdLineNo);


    /**
     * 부품판매Key에 해당하는 수정일자  정보를 조회한다.
     * @param partsSaleOrdVO - 조회할 정보가 담긴 PartsSaleOrdVO
     * @return 조회한 부품판매  정의 정보
     */
    public String selectPartsSaleOrdUpdtDtByKey(PartsSaleOrdVO partsSaleOrdVO);


}
