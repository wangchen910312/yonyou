package chn.bhmc.dms.crm.crq.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.crq.vo.VocTpCdSummeryVO;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.crm.crq.vo.VocActiveVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtSearchVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtVO;

/**
 * VOC에 관한 데이터처리 매퍼 클래스
 *
 * @author hyoung jun an
 * @since 2016. 3. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyoung jun an            최초 생성
 * </pre>
 */

@Mapper("vocMgmtDAO")
public interface VocMgmtDAO {

    /**
     * VOC 정보를 등록한다.
     * @param vocMgmtVO - 등록할 정보가 담긴 VocMgmtVO
     * @return 등록된 목록수
     */
    public int insertVocMgmt(VocMgmtVO vocMgmtVO) throws Exception;

    /**
     * VOC 정보를 수정한다.(기본정보 탭)
     * @param vocMgmtVO - 수정할 정보가 담긴 VocMgmtVO
     * @return 수정된 목록수
     */
    public int updateVocMgmt(VocMgmtVO vocMgmtVO) throws Exception;

    /**
     * SUB 유형 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    public List<CommonCodeVO> selectVocTpSubCdListByCondition(VocMgmtSearchVO searchVO);

    /**
     * 성코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    public List<CommonCodeVO> selectSungCdListByCondition(VocMgmtSearchVO searchVO);

    /**
     * 도시코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    public List<CommonCodeVO> selectCityCdListByCondition(VocMgmtSearchVO searchVO);

    /**
     * BHMC VOC 일경우 처리 결과 정보만 업데이트.
     *
     * @param vocMgmtVO
     * @return
     */
    public int updateBhmcVocProce(VocMgmtVO vocMgmtVO) throws Exception;


    /**
     * 조회 조건에 해당하는 VOC활동 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return
     */
    public int selectActivesByConditionCnt(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 VOC활동 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return 조회 목록
     */
    public List<VocActiveVO> selectActivesByCondition(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * VOC활동 정보를 수정한다.
     * @param vocMgmtVO - 수정할 정보가 담긴 VocMgmtVO
     * @return 수정된 목록수
     */
    public int updateActive(VocActiveVO vocActiveVO) throws Exception;


    /**
     * VOC 상태 변경
     *
     * @param vocMgmtVO
     * @return
     */
    public int updateVocStatCd(VocMgmtVO vocMgmtVO) throws Exception;

    /**
     * VOC 일별/월별 수량을 조회한다.
     * [일/월별 등록 수량]
     * @param VocMgmtSearchVO - sDlrCd / sDtType / sRegDt
     * @return [일/월별] 등록 수량
     */
    public int selectVocDateTpRegCnt(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 VOC 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return
     */
    public int selectVocMgmtsByConditionCnt(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 VOC 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return 조회 목록
     */
    public List<VocMgmtVO> selectVocMgmtsByCondition(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * VOC 상세 정보를 조회한다.
     * @param VocMgmtSearchVO - VOC_NO, DLR_CD
     * @return
     */
    public VocMgmtVO selectVocMgmtByKey(VocMgmtSearchVO searchVO) throws Exception;


    /**
     * VOC활동 정보를 등록한다.
     * @param vocMgmtVO - 등록할 정보가 담긴 vocActiveVO
     * @return 등록된 목록수
     */
    public int insertActive(VocActiveVO vocActiveVO) throws Exception;

    /**
     * VOC 요약정보 조회 ( 진행중인 상태의 전체 목록 / 검색조건이랑 상관없음 )
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return
     */
    public VocTpCdSummeryVO selectVocTpCdSummeryCnt(VocMgmtSearchVO searchVO) throws Exception;

    
    /**
     * 2018-11-09 add byfengdequan 添加导出功能
     * @param searchVO
     * @return
     */
	public List<VocActiveVO> selectActivesByConditionExport(VocMgmtSearchVO searchVO);




}