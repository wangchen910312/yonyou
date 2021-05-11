package chn.bhmc.dms.sal.uco.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.uco.service.UsedCarContractService;
import chn.bhmc.dms.sal.uco.service.dao.UsedCarContractDAO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractIncVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractOptionVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractPayInfoSaveVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractPayInfoVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractSaveVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractSearchVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarContractServiceImpl
 * @Description : 중고차 계약
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.          최초 생성
 * </pre>
 */

@Service("usedCarContractService")
public class UsedCarContractServiceImpl extends HService implements UsedCarContractService {

    /**
     * 중고차 계약 DAO 선언
     */
    @Resource(name="usedCarContractDAO")
    UsedCarContractDAO usedCarContractDAO;

    /**
     * 중고차 소매판매 주문번호 생성 id gen
     */
    @Resource(name="retailUsedCarContractOrdNoIdgenService")
    TableIdGenService retailUsedCarContractOrdNoIdgenService;



    /**
     * 중고차 계약정보 갯수 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public int selectUsedCarContractsByConditionCnt(UsedCarContractSearchVO searchVO) throws Exception{
        return usedCarContractDAO.selectUsedCarContractsByConditionCnt(searchVO);
    }

    /**
     * 중고차 계약정보 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<UsedCarContractVO> selectUsedCarContractsByCondition(UsedCarContractSearchVO searchVO) throws Exception{
        return usedCarContractDAO.selectUsedCarContractsByCondition(searchVO);
    }


    /**
     * 계약을 생성/저장 한다.
     */
    @Override
    public String multiContracts(UsedCarContractSaveVO saveVO) throws Exception{
        String contractNo = "";
        UsedCarContractVO cntVO = saveVO.getUsedCarContractVO();

        cntVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
        cntVO.setUpdtUsrId(LoginUtil.getUserId());    // 수정자

        if( "create".equals(saveVO.getMultiFlag()) ){   // 생성

            /**
             * 중고차 - 계약번호(키생성)
             * TC + 년 + 14자리seq
             */
            contractNo = retailUsedCarContractOrdNoIdgenService.getNextStringId();

            // 주문번호를 넣는다.
            cntVO.setContractNo(contractNo);

            // SA_0243T : 계약 헤더 저장
            usedCarContractDAO.insertContract(cntVO);

            // SA_0245 : 계약고객 저장
            cntVO.setPartnerTp("C");          // 계약자
            usedCarContractDAO.insertContractCustomer(cntVO);

            // SA_0245 : 실운전자 저장
            cntVO.setPartnerTp("D");          // 실운전자
            cntVO.setCustNo(cntVO.getDrvCustNo());     // 고객코드
            cntVO.setCustTp(cntVO.getDrvCustTp());     // 고객유형
            cntVO.setCustNm(cntVO.getDrvCustNm());     // 고객명
            cntVO.setTelNo1(cntVO.getDrvTelNo1());     // 고객연락처1
            cntVO.setTelNo2(cntVO.getDrvTelNo2());     // 고객연락처2
            cntVO.setEmailNm(cntVO.getDrvEmailNm());   // 이메일주소

            cntVO.setSsnCrnNo( cntVO.getDrvSsnCrnNo() );    // 신분증번호
            cntVO.setZipCd(cntVO.getDrvZipCd());            // 우편번호
            cntVO.setDrvMathDocTp( cntVO.getDrvMathDocTp() );    // 신분증유형
            cntVO.setSungCd( cntVO.getDrvSungCd());         // 성코드
            cntVO.setSungNm( cntVO.getDrvSungNm());         //
            cntVO.setCityCd( cntVO.getDrvCityCd());         // 도시
            cntVO.setCityNm( cntVO.getDrvCityNm());         //
            cntVO.setDistCd( cntVO.getDrvDistCd());         // 지역
            cntVO.setDistNm( cntVO.getDrvDistNm());         //
            cntVO.setAddrNm( cntVO.getDrvAddrNm());         // 주소명
            cntVO.setAddrDetlCont( cntVO.getDrvAddrDetlCont());     // 주소상세내용
            usedCarContractDAO.insertContractCustomer(cntVO);

            // SA_0248T : 번호판등록
            if("A".equals(cntVO.getRegTp())){
                usedCarContractDAO.insertReg(cntVO);
            }


            // 보험 내역 등록
            if("A".equals(cntVO.getIncAapTp())){
                // SA_0249T : 보험헤더
                usedCarContractDAO.insertIncHead(cntVO);

                UsedCarContractSearchVO searchVO = new UsedCarContractSearchVO();
                // SA_0250T : 보험아이템
                for(UsedCarContractIncVO incVO : saveVO.getIncVO().getInsertIncList()){
                    incVO.setDlrCd(LoginUtil.getDlrCd());
                    incVO.setContractNo(contractNo);

                    searchVO.setsDlrCd(incVO.getDlrCd());
                    searchVO.setsContractNo(incVO.getContractNo());
                    searchVO.setsIncTp(incVO.getIncTp());
                    if( usedCarContractDAO.selectIncListsByConditionCnt(searchVO) > 0){
                        throw processException("global.err.duplicate");
                    }
                    incVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
                    incVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
                    usedCarContractDAO.insertInc(incVO);
                }
                for(UsedCarContractIncVO incVO : saveVO.getIncVO().getUpdateIncList()){
                    searchVO.setsDlrCd(incVO.getDlrCd());
                    searchVO.setsContractNo(incVO.getContractNo());
                    searchVO.setsIncTp(incVO.getIncTp());
                    if( usedCarContractDAO.selectIncListsByConditionCnt(searchVO) > 0){
                        throw processException("global.err.duplicate");
                    }

                    incVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
                    incVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
                    usedCarContractDAO.updateInc(incVO);
                }
                for(UsedCarContractIncVO incVO : saveVO.getIncVO().getDeleteIncList()){
                    usedCarContractDAO.deleteInc(incVO);
                }
            }

            // SA_0251T : 금융서비스
            if("Y".equals(cntVO.getFincReqYn())){
                usedCarContractDAO.insertFinc(cntVO);
            }

        }else{

            contractNo = cntVO.getContractNo();

            // SA_0243T : 계약 헤더 수정
            usedCarContractDAO.updateContract(cntVO);

            // SA_0128T : 중고차 마스터 차량상태 변경
            cntVO.setCarStatCd("10");
            usedCarContractDAO.updateUsedCarMasterStat(cntVO);

            // SA_0245 : 계약고객 수정
            cntVO.setPartnerTp("C");          // 계약자
            usedCarContractDAO.updateContractCustomer(cntVO);

            // SA_0245 : 실운전자 저장
            cntVO.setPartnerTp("D");          // 실운전자
            cntVO.setCustNo(cntVO.getDrvCustNo());     // 고객코드
            cntVO.setCustTp(cntVO.getDrvCustTp());     // 고객유형
            cntVO.setCustNm(cntVO.getDrvCustNm());     // 고객명
            cntVO.setTelNo1(cntVO.getDrvTelNo1());     // 고객연락처1
            cntVO.setTelNo2(cntVO.getDrvTelNo2());     // 고객연락처2
            cntVO.setEmailNm(cntVO.getDrvEmailNm());   // 이메일주소

            cntVO.setSsnCrnNo( cntVO.getDrvSsnCrnNo() );    // 신분증번호
            cntVO.setZipCd(cntVO.getDrvZipCd());            // 우편번호
            cntVO.setDrvMathDocTp( cntVO.getDrvMathDocTp() );    // 신분증유형
            cntVO.setSungCd( cntVO.getDrvSungCd());         // 성코드
            cntVO.setSungNm( cntVO.getDrvSungNm());         //
            cntVO.setCityCd( cntVO.getDrvCityCd());         // 도시
            cntVO.setCityNm( cntVO.getDrvCityNm());         //
            cntVO.setDistCd( cntVO.getDrvDistCd());         // 지역
            cntVO.setDistNm( cntVO.getDrvDistNm());         //
            cntVO.setAddrNm( cntVO.getDrvAddrNm());         // 주소명
            cntVO.setAddrDetlCont( cntVO.getDrvAddrDetlCont());     // 주소상세내용
            usedCarContractDAO.updateContractCustomer(cntVO);


            // SA_0248T : 번호판 수정
            if("A".equals(cntVO.getRegTp())){
                // 최초저장 시, 번호판 저장을 했을 경우.
                if(usedCarContractDAO.selectRegCnt(cntVO) > 0){
                    usedCarContractDAO.updateReg(cntVO);
                }else{
                    usedCarContractDAO.insertReg(cntVO);
                }
            }else{
                // 수정 시, 체크를 해제했을 경우 지움
                usedCarContractDAO.deleteReg(cntVO);
            }

            // 보험 내역 수정
            if("A".equals(cntVO.getIncAapTp())){
                // SA_0249T : 최초저장 시, 보험헤더 저장을 했을 경우.
                if(usedCarContractDAO.selectIncHeadCnt(cntVO) > 0){
                    usedCarContractDAO.updateIncHead(cntVO);
                }else{
                    usedCarContractDAO.insertIncHead(cntVO);
                }

                UsedCarContractSearchVO searchVO = new UsedCarContractSearchVO();
                // SA_0250T : 보험아이템
                for(UsedCarContractIncVO incVO : saveVO.getIncVO().getInsertIncList()){
                    incVO.setDlrCd(LoginUtil.getDlrCd());
                    incVO.setContractNo(contractNo);

                    searchVO.setsDlrCd(incVO.getDlrCd());
                    searchVO.setsContractNo(incVO.getContractNo());
                    searchVO.setsIncTp(incVO.getIncTp());
                    if( usedCarContractDAO.selectIncListsByConditionCnt(searchVO) > 0){
                        throw processException("global.err.duplicate");
                    }
                    incVO.setRegUsrId(LoginUtil.getUserId());
                    incVO.setUpdtUsrId(LoginUtil.getUserId());
                    usedCarContractDAO.insertInc(incVO);
                }
                for(UsedCarContractIncVO incVO : saveVO.getIncVO().getUpdateIncList()){
                    searchVO.setsDlrCd(incVO.getDlrCd());
                    searchVO.setsContractNo(incVO.getContractNo());
                    searchVO.setsIncTp(incVO.getIncTp());
                    if( usedCarContractDAO.selectIncListsByConditionCnt(searchVO) > 0){
                        throw processException("global.err.duplicate");
                    }
                    incVO.setRegUsrId(LoginUtil.getUserId());
                    incVO.setUpdtUsrId(LoginUtil.getUserId());
                    usedCarContractDAO.updateInc(incVO);
                }
                for(UsedCarContractIncVO incVO : saveVO.getIncVO().getDeleteIncList()){
                    usedCarContractDAO.deleteInc(incVO);
                }
            }else{
                usedCarContractDAO.deleteIncHead(cntVO);
                usedCarContractDAO.deleteIncAll(cntVO);
            }

            // SA_0251T : 금융서비스 수정
            if("Y".equals(cntVO.getFincReqYn())){
                // 최초저장 시, 보험헤더 저장을 했을 경우.
                if(usedCarContractDAO.selectFincCnt(cntVO) > 0){
                    usedCarContractDAO.updateFinc(cntVO);
                }else{
                    usedCarContractDAO.insertFinc(cntVO);
                }
            }else{
                // 금융서비스 신청을 체크 안했을 시.
                usedCarContractDAO.deleteFinc(cntVO);
            }
        }

        // SA_0128T : 중고차 마스터 차량상태 변경
        cntVO.setCarStatCd("20");
        usedCarContractDAO.updateUsedCarMasterStat(cntVO);

        // SA_0246T : 입출금
        for(UsedCarContractPayInfoVO payInfoVO : saveVO.getPayInfoVO().getInsertPayInfoList()){
            payInfoVO.setContractNo(contractNo);
            payInfoVO.setDlrCd(LoginUtil.getDlrCd());
            payInfoVO.setRegUsrId(LoginUtil.getUserId());
            payInfoVO.setUpdtUsrId(LoginUtil.getUserId());
            usedCarContractDAO.insertPayInfo(payInfoVO);
        }
        for(UsedCarContractPayInfoVO payInfoVO : saveVO.getPayInfoVO().getUpdatePayInfoList()){
            payInfoVO.setRegUsrId(LoginUtil.getUserId());
            payInfoVO.setUpdtUsrId(LoginUtil.getUserId());
            usedCarContractDAO.updatePayInfo(payInfoVO);
        }
        for(UsedCarContractPayInfoVO payInfoVO : saveVO.getPayInfoVO().getDeletePayInfoList()){
            usedCarContractDAO.deletePayInfo(payInfoVO);
        }

        // SA_0247T : 부가서비스
        for(UsedCarContractOptionVO optionVO : saveVO.getOptionVO().getInsertOptionList()){
            optionVO.setDlrCd(LoginUtil.getDlrCd());
            optionVO.setContractNo(contractNo);
            optionVO.setRegUsrId(LoginUtil.getUserId());
            optionVO.setUpdtUsrId(LoginUtil.getUserId());
            usedCarContractDAO.insertOption(optionVO);
        }
        for(UsedCarContractOptionVO optionVO : saveVO.getOptionVO().getUpdateOptionList()){
            optionVO.setRegUsrId(LoginUtil.getUserId());
            optionVO.setUpdtUsrId(LoginUtil.getUserId());
            usedCarContractDAO.updateOption(optionVO);
        }
        for(UsedCarContractOptionVO optionVO : saveVO.getOptionVO().getDeleteOptionList()){
            usedCarContractDAO.deleteOption(optionVO);
        }

        return contractNo;
    }



    /**
     * 계약 승인확정 한다.
     */
    public String approval (UsedCarContractVO contVO) throws Exception{
        usedCarContractDAO.approval(contVO);
        return contVO.getContractNo();
    }

    /**
     * 계약을 삭제(승인전) 한다.
     */
    public int deleteContract (UsedCarContractVO contVO) throws Exception{
        return usedCarContractDAO.deleteContract(contVO);
    }

    /**
     * 계약을 삭제(승인후) 한다.
     */
    public int cancelContract (UsedCarContractVO contVO) throws Exception{
        return usedCarContractDAO.cancelContract(contVO);
    }





















    /**
     * 계약별 입/출금내역 조회
     */
    public int selectPayInfoListsByConditionCnt(UsedCarContractSearchVO searchVO) throws Exception{
        return usedCarContractDAO.selectPayInfoListsByConditionCnt(searchVO);
    }
    public List<UsedCarContractPayInfoVO> selectPayInfoListsByCondition(UsedCarContractSearchVO searchVO) throws Exception{
        return usedCarContractDAO.selectPayInfoListsByCondition(searchVO);
    }

    /**
     * 계약별 입/출금내역 저장
     */
    public int savePayInfo (UsedCarContractPayInfoSaveVO saveVO) throws Exception{
        for(UsedCarContractPayInfoVO payinfoVO : saveVO.getInsertPayInfoList()){
            payinfoVO.setDlrCd(LoginUtil.getDlrCd());
            payinfoVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            payinfoVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
            usedCarContractDAO.insertPayInfo(payinfoVO);
        }

        for(UsedCarContractPayInfoVO payinfoVO : saveVO.getUpdatePayInfoList()){
            payinfoVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            payinfoVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
            usedCarContractDAO.updatePayInfo(payinfoVO);
        }

        for(UsedCarContractPayInfoVO payinfoVO : saveVO.getDeletePayInfoList()){
            payinfoVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            payinfoVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
            usedCarContractDAO.deletePayInfo(payinfoVO);
        }

        return 1;

    }

    /**
     * 계약별 보험내역 조회
     */
    public int selectIncListsByConditionCnt(UsedCarContractSearchVO searchVO) throws Exception{
        return usedCarContractDAO.selectIncListsByConditionCnt(searchVO);
    }
    public List<UsedCarContractIncVO> selectIncListsByCondition(UsedCarContractSearchVO searchVO) throws Exception{
        return usedCarContractDAO.selectIncListsByCondition(searchVO);
    }

    /**
     * 계약별 부가비용 조회
     */
    public int selectOptionListsByConditionCnt(UsedCarContractSearchVO searchVO) throws Exception{
        return usedCarContractDAO.selectOptionListsByConditionCnt(searchVO);
    }
    public List<UsedCarContractOptionVO> selectOptionListsByCondition(UsedCarContractSearchVO searchVO) throws Exception{
        return usedCarContractDAO.selectOptionListsByCondition(searchVO);
    }











}
