package chn.bhmc.dms.sal.usc.service;

import java.util.List;

import chn.bhmc.dms.sal.usc.vo.PurcEvalImageVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalSaveVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalSearchVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalVO;

/**
 * 중고차매입평가관리
 *
 * @author Kimyewon
 * @since 2016. 6. 9.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                     수정자                       수정내용
 *  ----------------    ------------    ---------------------------
 *   2016. 6. 9.       Kim yewon         최초 생성
 * </pre>
 */

public interface PurcEvalService {

	/**
     * 조회 조건에 해당하는 중고차매입관리 인증정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcEvalSearchVO
     * @return 조회 목록
     */
	public List<PurcEvalVO> selectPurcByCondition(PurcEvalSearchVO searchVO) throws Exception;


	/**
     * 조회 조건에 해당하는  중고차매입관리 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TopSelectionSearchVO
     * @return
     */
    public int selectPurcByConditionCnt(PurcEvalSearchVO searchVO);


    //중고차평가매입(단건) 조회
    public PurcEvalVO selectPurcEvalInfo(PurcEvalSearchVO searchVO) throws Exception;

    //중고차경매(위탁)(단건) 조회
    public PurcEvalVO selectAuctInfo(String purcNo) throws Exception;


    //중고차평가매입 - 경매(위탁)목록 조회
    public List<PurcEvalVO> selectAuctInfoByCondition(PurcEvalSearchVO searchVO) throws Exception;
    //중고차평가매입 - 경매(위탁)목록 총 갯수 조회
    public int selectAuctInfoByConditionCnt(PurcEvalSearchVO searchVO);


    /**
     * 중고차평가매입내용 저장한다.
     * @param saveVO
     */
    public String savePurcEvalMng(PurcEvalVO saveVO) throws Exception;



    /**
     * 중고차평가관리 - 경매정보 신규등록/수정를 한꺼번에 수행한다.
     *
     * @param saveVO - 입력, 수정 데이터가 포함된 CommonCodeSaveVO
     * @return
     */
    public void multiSaveAuctInfo(PurcEvalSaveVO saveVO) throws Exception;


    /**
     * 중고차평가관리 - 경매정보를 등록한다.
     * @param PurcEvalVO - 등록할 정보가 담긴 PurcEvalVO
     * @return 등록된 목록수
     */
    public int insertAuctInfo(PurcEvalVO vo) throws Exception;

    /**
     * 중고차평가관리 - 경매정보를 수정한다.
     * @param PurcEvalVO - 수정할 정보가 담긴 PurcEvalVO
     * @return 수정된 목록수
     */
    public int updateAuctInfo(PurcEvalVO vo) throws Exception;

    /**
     *
     * 중고차평가매입 정보를 저장한다.
     *
     * @param vo
     * @return
     * @throws Exception
     */
    public int updatePurcEvalMng(PurcEvalVO vo) throws Exception;


    /**
     * Key에 해당하는 경매정보를를 조회한다.
     * @param PurcEvalVO - 딜러,매입번호,경매코드
     * @return 조회한 마감시간 정보
     */
    public PurcEvalVO selectAuctInfoByKey(PurcEvalVO vo) throws Exception;


    /**
     * 중고차평가관리 - 경매정보를 삭제한다.
     * @param PurcEvalVO - 수정할 정보가 담긴 PurcEvalVO
     * @return 수정된 목록수
     */
    public int deleteAuctInfo(PurcEvalVO vo) throws Exception;


    //중고차매입/평가관리 - 평가용 이미지 데이터 조회.
    public PurcEvalImageVO selectImageEvalVal(PurcEvalSearchVO searchVO) throws Exception;

    //중고차매입/평가관리 - 평가용 이미지 데이터 조회.(초기값)
    public PurcEvalImageVO selectImageEvalInitVal(PurcEvalSearchVO searchVO) throws Exception;

    //중고차매입/평가관리 - 평가용 이미지 데이터 조회.
    public int selectImageEvalValCnt(PurcEvalSearchVO searchVO);


    //중고차매입/평가관리 - 평가용 이미지의 평가데이터를 저장.
    public String saveImageEval(PurcEvalImageVO saveVO) throws Exception;


    /**
     * 중고차평가관리 - 계약에서생성수정한치환판매데이터처리
     * @param PurcEvalVO
     * @return 중고차계약번호
     */
    public int saveContractPurcEval(PurcEvalVO vo) throws Exception;

    /**
     * 중고차평가관리 - 계약에서 수정했던 내역을 초기화 해준다.
     * @param PurcEvalVO
     * @return 중고차계약번호
     */
    public int initContractPurcEval(PurcEvalVO vo) throws Exception;

    /**
     * 중고차평가관리 - 계약에서 수정했던 내역을 초기화 해준다. (계약번호)
     * @param PurcEvalVO
     * @return 중고차계약번호
     */
    public int deleteContractPurcEval(PurcEvalVO vo) throws Exception;

    /* 브랜드 조회 */
    //public List<UsedCarBrandListVO> searchUsedCarBrand() throws Exception;

    /* 차종 조회 */
    //public List<UsedCarModelListVO> SearchUsedCarCarLine(CarInfoSearchVO searchVO) throws Exception;

    /* 모델 조회 */
    //public List<CarInfoVO> SearchUsedCarModel(CarInfoSearchVO searchVO) throws Exception;

    /*저장되는 빈의 중복체크*/
    public String checkingVinNoDupWhether(PurcEvalSearchVO searchVO) throws Exception;

    /*중고차매입취소*/
    public int purchaseCancel(PurcEvalVO vo) throws Exception;
}