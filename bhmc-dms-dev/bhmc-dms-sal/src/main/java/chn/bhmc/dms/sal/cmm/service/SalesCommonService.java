package chn.bhmc.dms.sal.cmm.service;

import java.util.List;

import chn.bhmc.dms.sal.veh.vo.CarInfoVO;

import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoVO;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.sal.cmm.vo.MobileSumSrchVO;
import chn.bhmc.dms.sal.cmm.vo.MobileSumVO;


/**
 * sales 공통서비스
 *
 * @author KIM YEWON
 * @since 2016. 09. 26.
 * @version 1.0
 * @see <pre>
 *
 *       수정일                         수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016. 09. 26.       KIM YEWON            최초 생성
 * </pre>
 */

public interface SalesCommonService {

    //로그인된 딜러로 사업부,사업소,성,시를 조회.
    public DealerVO selectDealerInfo(DealerSearchVO searchVO) throws Exception;


    //딜러마스터의 사업부를 그룹핑해서 조회.
    public int selectDealerSdptCnt(DealerSearchVO searchVO) throws Exception;
    public List<DealerVO> selectDealerSdpt(DealerSearchVO searchVO) throws Exception;


    //딜러마스터의 사무소를 그룹핑해서 조회.
    public int selectDealerOfficeCnt(DealerSearchVO searchVO) throws Exception;
    public List<DealerVO> selectDealerOffice(DealerSearchVO searchVO) throws Exception;


    //딜러마스터의 성을 그룹핑해서 조회.
    public int selectDealerSungCnt(DealerSearchVO searchVO) throws Exception;
    public List<DealerVO> selectDealerSung(DealerSearchVO searchVO) throws Exception;


    //딜러마스터의 도시를 그룹핑해서 조회.
    public int selectDealerCityCnt(DealerSearchVO searchVO) throws Exception;
    public List<DealerVO> selectDealerCity(DealerSearchVO searchVO) throws Exception;


    //딜러마스터의 딜러를  조회.
    public int selectDealerCnt(DealerSearchVO searchVO) throws Exception;
    public List<DealerVO> selectDealer(DealerSearchVO searchVO) throws Exception;

    //로그인한 USER의 심사등급을 가져온다.
    public String selectUserEvalGrade(String dlrCd,String usrId, String wrkDstinCd) throws Exception;

    //모바일메인화면 조회
    public List<MobileSumVO> selectMobileMainSum(MobileSumSrchVO searchVO) throws Exception;

    //타사차량 고객등록
    public String multiVehOfCustInfo(VehOfCustInfoVO vehOfCustInfoVO) throws Exception;

    //차종 조건으로 차관(모델명) 검색
    public List<CarInfoVO> selectCarLooksFscListForCom(CarInfoSearchVO carInfoSearchVO) throws Exception;

    //모델 조건으로 OCN 검색 - 전체
    public List<CarInfoVO> selectOcnListForCom(CarInfoSearchVO carInfoSearchVO) throws Exception;

    //모델 조건으로 OCN 검색 - 정규오더
    public List<CarInfoVO> selectBtoOcnListForCom(CarInfoSearchVO carInfoSearchVO) throws Exception;

    //모델 조건으로 OCN 검색 - 전략오더
    public List<CarInfoVO> selectStrOcnListForCom(CarInfoSearchVO carInfoSearchVO) throws Exception;

    //OCN 조건으로 외장색 검색
    public List<CarInfoVO> selectExtColorListForCom(CarInfoSearchVO carInfoSearchVO) throws Exception;

    //외장색 조건으로 내장색 검색
    public List<CarInfoVO> selectIntColorListForCom(CarInfoSearchVO carInfoSearchVO) throws Exception;

}
