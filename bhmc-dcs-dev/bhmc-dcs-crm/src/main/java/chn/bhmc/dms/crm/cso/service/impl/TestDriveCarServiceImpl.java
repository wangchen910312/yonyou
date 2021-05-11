package chn.bhmc.dms.crm.cso.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.TestDriveCarService;
import chn.bhmc.dms.crm.cso.service.dao.TestDriveCarDAO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarSaveVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarVO;

/**
 * 시승 차량 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.02.11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.11         in moon lee            최초 생성
 * </pre>
 */

@Service("testDriveCarService")
public class TestDriveCarServiceImpl extends HService implements TestDriveCarService {

    /**
     * 시승 차량 관리 DAO
     */
	@Resource(name="testDriveCarDAO")
	TestDriveCarDAO testDriveCarDAO;

    /**
     * 시승 차량 목록 수량 조회
     */
    @Override
    public int selectTestDriveCarsByConditionCnt(TestDriveCarSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return testDriveCarDAO.selectTestDriveCarsByConditionCnt(searchVO);
    }

    /**
     * 시승 차량 목록 조회
     */
    @Override
    public List<TestDriveCarVO> selectTestDriveCarsByCondition(TestDriveCarSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return testDriveCarDAO.selectTestDriveCarsByCondition(searchVO);
    }

    /**
     * 시승차량 관리 상태를 저장한다.
     */
    @Override
    public int updateTestDriveCarMgmt(TestDriveCarSaveVO saveVO) throws Exception {

        int resultCnt = 0;

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        String pltCd = LoginUtil.getPltCd();

        // 시승차량등록 테스트
//        TestDriveCarVO aa = new TestDriveCarVO();
//        aa.setDlrCd("A07AA");
//        aa.setPltCd("1000");
//        aa.setTdrvVinNo("LBEXDAEA8CX169301");
//        aa.setUseYn("N");
//        aa.setRegUsrId("admin");
//        insertTdrvCar(aa);

        for(TestDriveCarVO updateTestDriveCarVO : saveVO.getUpdateList()){

            TestDriveCarSearchVO searchVO = new TestDriveCarSearchVO();
            searchVO.setsDlrCd(dlrCd);
            searchVO.setsPltCd(pltCd);
            searchVO.setsTdrvVinNo(updateTestDriveCarVO.getTdrvVinNo());

            if ( updateTestDriveCarVO.getUseYn().equals("N") ) {

                // 시승차 - 예약이 잡혀 있는지 확인
                boolean tdrvResvCntChk = false;
                tdrvResvCntChk = selectTdrvCarByKeyCnt(searchVO);

                if ( !tdrvResvCntChk ) {

                    // [예약] 된 [시승정보]가 있습니다.
                    throw processException("global.info.stInfo"
                            , new String[]{
                                    messageSource.getMessage("global.lbl.resv", null, LocaleContextHolder.getLocale())
                                    ,messageSource.getMessage("global.lbl.tdrvInfo", null, LocaleContextHolder.getLocale())
                                }
                            );
                }

            }

            updateTestDriveCarVO.setUpdtUsrId(userId);
            updateTestDriveCarVO.setDlrCd(dlrCd);
            updateTestDriveCarVO.setPltCd(pltCd);
            resultCnt += testDriveCarDAO.updateTestDriveCarMgmt(updateTestDriveCarVO);
        }

        return resultCnt ;

    }

    /**
     * 시승차 - 예약이 있는지 확인
     * @param TestDriveCarSearchVO : dlrCd(딜러코드), pltCd(센터코드), tdrvVinNo(차대번호
     * @return 예약이 없으면 true, 예약이 있으면 false
     */
    @Override
    public boolean selectTdrvCarByKeyCnt(TestDriveCarSearchVO searchVO) throws Exception {

        boolean result = false;
        int insertCnt = 0;

        if( StringUtils.isEmpty(searchVO.getsDlrCd()) ){
            // [딜러코드]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(searchVO.getsPltCd()) ){
            // [센터코드]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.pltCd", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(searchVO.getsTdrvVinNo() ) ){
            // [시승차대번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.tdrvVinNo", null, LocaleContextHolder.getLocale())});
        };

        Calendar startCal = Calendar.getInstance();
        searchVO.setsResvDt(startCal.getTime());

        insertCnt = testDriveCarDAO.selectTdrvCarByKeyCnt(searchVO);

        if ( insertCnt == 0 ) {
            result = true;
        } else {
            result = false;
        }

        return result;
    }

    /**
     * 시승 차량 등록
     * @param TestDriveCarVO : dlrCd(딜러코드), pltCd(센터코드), tdrvVinNo(차대번호), useYn(사용유무), regUsrId(등록자)
     * @return 등록완료 : true / 등록실패 : false
     */
    @Override
    public boolean insertTdrvCar(TestDriveCarVO saveVO) throws Exception {

        boolean result = false;
        int insertCnt = 0;

        if( StringUtils.isEmpty(saveVO.getDlrCd()) ){
            // [딜러코드]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getPltCd()) ){
            // [센터코드]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.pltCd", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getTdrvVinNo() ) ){
            // [시승차대번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.tdrvVinNo", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getRegUsrId() ) ){
            // [등록자]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.regUsrId", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getUseYn() ) ){
            // [사용여부]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.useYn", null, LocaleContextHolder.getLocale())});
        };

        int tdrvCarByKeyCnt = 0;
        tdrvCarByKeyCnt = testDriveCarDAO.selectTdrvCarByKey(saveVO);

        if( tdrvCarByKeyCnt > 0 ){
            // 이미 등록 된 {시승차} 입니다.
            throw processException("global.info.alreadyCont", new String[]{messageSource.getMessage("crm.lbl.tdrvCar", null, LocaleContextHolder.getLocale())});
        };

        insertCnt = testDriveCarDAO.insertTdrvCar(saveVO);

        if ( insertCnt == 1 ) {
            result = true;
        } else {
            result = false;
        }

        return result;
    }

    /**
     * 시승차량 주행거리를 변경한다. ( 시승 관리 저장시  이후 주행거리 -> 시승테이블 주행거리 수정 )
     * @param saveVO
     * @return
     */
    @Override
    public int updateTestDriveCarRunDistVal(TestDriveCarVO saveVO) throws Exception {

        if( StringUtils.isEmpty(saveVO.getDlrCd()) ){
            // [딜러코드]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getPltCd()) ){
            // [센터코드]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.pltCd", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getTdrvVinNo() ) ){
            // [시승차대번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.tdrvVinNo", null, LocaleContextHolder.getLocale())});
        };

        if( saveVO.getRunDistVal() < 0  ){
            // [주행거리]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.runDistVal", null, LocaleContextHolder.getLocale())});
        };

        return testDriveCarDAO.updateTestDriveCarRunDistVal(saveVO);
    }




}
