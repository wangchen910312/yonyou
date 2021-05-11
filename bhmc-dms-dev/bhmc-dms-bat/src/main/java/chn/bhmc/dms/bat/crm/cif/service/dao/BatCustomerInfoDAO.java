package chn.bhmc.dms.bat.crm.cif.service.dao;

import java.util.HashMap;
import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerInfoSearchVO;
import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerInfoVO;

//import chn.bhmc.dms.bat.par.pcm.vo.BatInvcSearchVO;
//import chn.bhmc.dms.bat.par.pcm.vo.BatInvcVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatCustomerInfoDAO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin LEE
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kyo Jin LEE     최초 생성
 * </pre>
 */

@Mapper("batCustomerInfoDAO")
public interface BatCustomerInfoDAO {

    /**
     * DMS - DCS로 전송하기위한 고객정보 수집
     * @param null
     * @return Count
     */
    public void selectCustomerInfoDmsDcs(HashMap<String, Object> map) throws Exception;

    /**
     * DMS - DCS로 전송하기위한 고객정보 주소 수집
     * @param null
     * @return Count
     */
    public void selectCustomerInfoAddrDmsDcs(HashMap<String, Object> map) throws Exception;

    /**
     * DMS - DCS로 전송하기위한 고객정보 연계인 수집
     * @param null
     * @return Count
     */
    public void selectCustomerInfoRelCustDmsDcs(HashMap<String, Object> map) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<BatCustomerInfoVO> selectCustomerInfoDmsOriginalByCondition();

    public int selectCustomerRowId(BatCustomerInfoVO batCustomerInfoVO);

    public int updateCustomerRowId(BatCustomerInfoVO batCustomerInfoVO);



    public int selectCustomerInfoByConditionCnt(BatCustomerInfoSearchVO searchVO);

    public int selectMasterCustomerInfoByConditionCnt(BatCustomerInfoSearchVO searchVO);

    public int selectCustomerInfoHistoryByConditionCnt(BatCustomerInfoSearchVO searchVO);

    public List<BatCustomerInfoVO> selectCustomerInfoHistoryByCondition(BatCustomerInfoSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<BatCustomerInfoVO> selectCustomerInfoByCondition(BatCustomerInfoSearchVO searchVO);

    public List<BatCustomerInfoVO> selectMasterCustomerInfoByCondition(BatCustomerInfoSearchVO searchVO);


    /**
     * 고객정보를 입력 한다.
     *
     * @param batCustomerInfoVO - 등록 정보가 담긴 BatCustomerInfoVO
     * @return 등록된 목록수
     */
    public int insertCustomer(BatCustomerInfoVO batCustomerInfoVO);

    /**
     * 고객정보를 수정한다.
     *
     * @param batCustomerInfoVO - 등록 정보가 담긴 BatCustomerInfoVO
     * @return 등록된 목록수
     */
    public int updateCustomer(BatCustomerInfoVO batCustomerInfoVO);

    /**
     * Key에 해당하는 고객 정보 카운트를 조회한다.
     * @param dlrCd - 딜러코드
     * @param custNm - 이름
     * @param hpNo - 핸드폰번호
     * @return 조회한 고객 정보
     */
    public int selectCustDupCntByKey(@Param("dlrCd") String dlrCd, @Param("custNm") String custNm, @Param("hpNo") String hpNo);

    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * @param BatCustomerInfoVO batCustomerInfoVO (고객명 + 핸드폰)
     * @return 조회한 고객 정보
     */
    public BatCustomerInfoVO selectCustDupByKey(BatCustomerInfoSearchVO searchVO);

    /**
     * Key에 해당하는 고객 정보를 조회한다.
     * @param BatCustomerInfoVO batCustomerInfoVO (증거유형 + 증거번호)
     * @return 조회한 고객 정보
     */
    public BatCustomerInfoVO selectCustMathDocDupByKey(BatCustomerInfoSearchVO searchVO);

    public BatCustomerInfoVO selectMasterCustDupByKey(@Param("dlrCd") String dlrCd, @Param("custNm") String custNm, @Param("hpNo") String hpNo);

    /**
     * 고객번호를 채번한다.
     *
     * @param null
     * @return 고객번호
     */
    public String selectNextCustNo();
    /**
     * liuxueying 客户接口表生成业务表
     */
    public void insertCustInfoDmsDcs() throws Exception;
}
