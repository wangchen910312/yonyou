package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.wac.vo.SanbaoPartVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSaveVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoRequestService.java
 * @Description : 삼보 요청 서비스
 * @author Kwon Ki Hyun
 * @since 2016. 3. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 21.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface SanbaoRequestService {

    /**
    *
    * 삼보 요청 목록 데이터 갯수를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 요청 목록 데이터 갯수
    * @throws Exception
    */
    public int selectSanbaoRequestByConditionCnt(SanbaoSearchVO searchVO) throws Exception;

    /**
    *
    * 삼보 요청 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 요청 목록 데이터
    * @throws Exception
    */
    public List<SanbaoVO> selectSanbaoRequestByCondition(SanbaoSearchVO searchVO)throws Exception;

    /**
    *
    * 삼보요청  상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 상세 정보 데이터
    * @throws Exception
    */
    public SanbaoVO selectSanbaoRequestByKey(SanbaoSearchVO searchVO) throws Exception;

    /**
    *
    * 삼보요청 부품 정보 데이터 갯수를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return 삼보요청 부품  정보 데이터 갯수
    * @throws Exception
    */
    public int selectSanbaoRequestPartsByConditionCnt(SanbaoSearchVO searchVO) throws Exception;

    /**
    *
    * 삼보요청 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return 삼보요청 부품  정보 데이터
    * @throws Exception
    */
    public List<SanbaoPartVO> selectSanbaoRequestPartsByCondition(SanbaoSearchVO searchVO)throws Exception;

    /**
    *
    * 삼보요청 정보를 등록/수정/삭제 한다.
    *
    * @param saveVO - 삼보 요청 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public String multiSanbaoRequests(SanbaoSaveVO saveVO)throws Exception;

    /**
    *
    * 삼보요청 정보를 등록  한다.
    *
    * @param saveVO - 삼보 요청 등록  목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int insertSanbaoRequests(SanbaoVO sanbaoVO)throws Exception;

    /**
    *
    * 삼보요청 정보를 수정 한다.
    *
    * @param saveVO - 삼보 요청 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int updateSanbaoRequests(SanbaoVO sanbaoVO)throws Exception;

    /**
    *
    * 삼보요청 정보를 삭제 한다.
    *
    * @param saveVO - 삼보 요청 삭제 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int deleteSanbaoRequests(SanbaoVO sanbaoVO)throws Exception;

    /**
    *
    * 삼보요청 부품정보를 등록 한다.
    *
    * @param saveVO - 삼보 요청 등록 부품 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int insertSanbaoRequestParts(SanbaoPartVO sanbaoPartVO)throws Exception;

    /**
    *
    * 삼보요청 부품정보를 수정 한다.
    *
    * @param saveVO - 삼보 요청 수정 부품 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int updateSanbaoRequestParts(SanbaoPartVO sanbaoPartVO)throws Exception;

    /**
    *
    * 삼보요청 부품정보를 삭제 한다.
    *
    * @param saveVO - 삼보 요청 삭제 부품 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int deleteSanbaoRequestParts(SanbaoPartVO sanbaoPartVO)throws Exception;


    //public int deleteSanbaoRequestFiles(SanbaoVO sanbaoVO)throws Exception;


    /**
     *
     * 삼보요청을 Temp로 저장.
     *
     * @param sanbaoVO - 삼보 요청 삭제 부품 목록을 포함하는 sanbaoVO
     * @return bindingResult
     * @throws Exception
     */
    public int insertSanBaoRequestToIf(SanbaoVO sanbaoVO) throws Exception;

    /**
    *
    * 삼보요청  I/F 정보 조회
    *
    * @param sanbaoVO - 삼보요청  I/F 정보 조회 sanbaoVO
    * @return bindingResult
    * @throws Exception
    */
    public int selectSanbaoRequestIfSendByConditionCnt(SanbaoVO sanbaoVO) throws Exception;

    /**
     *
     * 삼보요청  헤더  I/F 정보 삭제
     *
     * @param sanbaoVO - 삼보요청  헤더  I/F 정보 삭제  sanbaoVO
     * @return bindingResult
     * @throws Exception
    */
    public int deleteSanbaoRequestsIf(SanbaoVO sanbaoVO) throws Exception;

   /**
    *
    * 삼보요청  부품  I/F 정보 삭제
    *
    * @param sanbaoVO - 삼보요청  부품  I/F 정보 삭제
    * @return bindingResult
    * @throws Exception
    */
    public int deleteSanbaoRequestPartsIf(SanbaoVO sanbaoVO) throws Exception;

    /**
     * VAT 조회
     */
    public String selectVATSearch(String sApplyDate, String sTypeCd) throws Exception;

}
