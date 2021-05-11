package chn.bhmc.dms.ser.ro.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.ObjectUtil;

import chn.bhmc.dms.core.support.excel.JxlsSupport;

import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.rev.service.ReservationReceiptService;
import chn.bhmc.dms.ser.ro.service.CarCheckService;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.dao.CarCheckDAO;
import chn.bhmc.dms.ser.ro.vo.CarCheckDetailVO;
import chn.bhmc.dms.ser.ro.vo.CarCheckSaveVO;
import chn.bhmc.dms.ser.ro.vo.CarCheckSearchVO;
import chn.bhmc.dms.ser.ro.vo.CarCheckVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarCheckServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 29.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("carCheckService")
public class CarCheckServiceImpl extends HService implements CarCheckService, JxlsSupport {

    @Resource(name="carCheckDAO")
    CarCheckDAO carCheckDAO;

    @Resource(name="reservationReceiptService")
    ReservationReceiptService reservationReceiptService;

    @Resource(name="carCheckIdGenService")
    TableIdGenService carCheckIdGenService;

    @Resource(name="repairOrderService")
    RepairOrderService repairOrderService;

    /**
     * 고객요구사항 및 고장설명
     */
    @Autowired
    ServiceCommonService serviceCommonService;


    /**
     * 차량점검 내역 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public CarCheckVO selectCarCheckByKey(CarCheckSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        CarCheckVO carCheckVO = new CarCheckVO();

        carCheckVO = carCheckDAO.selectCarCheckByKey(searchVO);
        if(carCheckVO == null){
            carCheckVO = new CarCheckVO();
        }

        return carCheckVO;
    }

    /**
     * 차량점검 내역 리스트 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<CarCheckVO> selectCarCheckListByCondition(CarCheckSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return carCheckDAO.selectCarCheckListByCondition(searchVO);
    }

    /**
     * 차량점검 내역 리스트 건수 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCarCheckListByConditionCnt(CarCheckSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return carCheckDAO.selectCarCheckListByConditionCnt(searchVO);
    }

    /**
     * 차량점검 상세 내역 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<CarCheckDetailVO> selectCarCheckDetails(CarCheckSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        return carCheckDAO.selectCarCheckDetails(searchVO);
    }

    /**
    *
    * 차량점검 항목 정보를 등록한다.
    *
    * @param saveVO - 차량점검 항목 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public String multiCarChecks(CarCheckSaveVO saveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        CarCheckVO carCheckVO = saveVO.getCarCheckVO();
        carCheckVO.setDlrCd(LoginUtil.getDlrCd());

        if(carCheckVO.getCarChkDocNo().equals("")){
            String carChkDocNo = carCheckIdGenService.getNextStringId();
            carCheckVO.setRegUsrId(userId);
            carCheckVO.setCarChkDocNo(carChkDocNo);
            insertCarCheck(carCheckVO);
        }else{
            carCheckVO.setUpdtUsrId(userId);
            updateCarCheck(carCheckVO);
        }

        if(!StringUtil.isEmpty(carCheckVO.getRoDocNo())){
            RepairOrderVO repairOrderVO = new RepairOrderVO();
            repairOrderVO.setDlrCd(LoginUtil.getDlrCd());
            repairOrderVO.setRoDocNo(carCheckVO.getRoDocNo());
            repairOrderVO.setPdiYn("Y");
            repairOrderService.updateRepairOrder(repairOrderVO);
        }

        deleteCarCheckDetail(carCheckVO);
        insertCarCheckDetail(saveVO);
        return carCheckVO.getCarChkDocNo();
    }

    /**
     *
     * 차량점검 항목을 등록한다.
     *
     * @param carCheckVO
     * @throws Exception
     */
    public int insertCarCheck(CarCheckVO carCheckVO)throws Exception{

        return carCheckDAO.insertCarCheck(carCheckVO);
    }

    /**
     *
     * 차량점검 항목을 수정한다.
     *
     * @param carCheckVO
     * @throws Exception
     */
    public int updateCarCheck(CarCheckVO carCheckVO)throws Exception{

        if(StringUtil.nullConvert(carCheckVO.getDlrCd()).equals("") ){
            carCheckVO.setDlrCd(LoginUtil.getDlrCd());
        }
        return carCheckDAO.updateCarCheck(carCheckVO);
    }

    /**
    *
    * 차량점검 항목을 취소한다.
    *
    * @param carCheckVO
    * @throws Exception
    */
    public int updateCarCheckCancel(CarCheckVO carCheckVO)throws Exception{

        if(StringUtil.nullConvert(carCheckVO.getDlrCd()).equals("") ){
            carCheckVO.setDlrCd(LoginUtil.getDlrCd());
        }
        carCheckVO.setUpdtUsrId(LoginUtil.getUserId());
        carCheckVO.setCarChkCancPrsnId(LoginUtil.getUserId());
        carCheckVO.setCarChkCancPrsnNm(LoginUtil.getUserNm());
        return carCheckDAO.updateCarCheckCancel(carCheckVO);
    }

    /**
    *
    * 차량점검 인쇄일자 수정
    *
    * @param carCheckVO
    * @throws Exception
    */
    public int updateCarCheckPrint(CarCheckVO carCheckVO)throws Exception{

        if(StringUtil.nullConvert(carCheckVO.getDlrCd()).equals("") ){
            carCheckVO.setDlrCd(LoginUtil.getDlrCd());
        }
        return carCheckDAO.updateCarCheckPrint(carCheckVO);
    }

    /**
     *
     * 차량점검 항목을 삭제한다.
     *
     * @param carCheckVO
     * @throws Exception
     */
    public int deleteCarCheck(CarCheckVO carCheckVO)throws Exception{


        carCheckVO.setDlrCd(LoginUtil.getDlrCd());
        int delCnt = carCheckDAO.deleteCarCheck(carCheckVO);

        if(delCnt > 0)
           deleteCarCheckDetail(carCheckVO);

        return delCnt;
    }

    /**
     *
     * 차량점검 상세 항목을 등록한다.
     *
     * @param carCheckDetailVO
     * @return
     * @throws Exception
     */
    public int insertCarCheckDetail(CarCheckSaveVO saveVO) throws Exception{

        List<CarCheckDetailVO> objVO  = saveVO.getCarCheckDetailVO();

        int inCnt=0;
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        if(objVO.size() > 0){
            for(CarCheckDetailVO carCheckDetailVO : objVO ){
                carCheckDetailVO.setDlrCd(dlrCd);
                carCheckDetailVO.setCarChkDocNo(saveVO.getCarCheckVO().getCarChkDocNo());
                carCheckDetailVO.setRegUsrId(userId);
                inCnt +=  carCheckDAO.insertCarCheckDetail(carCheckDetailVO);
            }
        }
        return inCnt;
    }


    /**
     *
     * 차량점검 상세 항목을 삭제한다.
     *
     * @param carCheckDetailVO
     * @return
     * @throws Exception
     */
    public int deleteCarCheckDetail(CarCheckVO carCheckVO) throws Exception{

        return carCheckDAO.deleteCarCheckDetail(carCheckVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        CarCheckSearchVO searchVO = new CarCheckSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<CarCheckVO> list = null;

        if(!StringUtils.isBlank(params.get("sRegFromDt").toString())){
            String sRegFromDt = params.get("sRegFromDt").toString();
            Date dRegFromDt = DateUtil.convertToDate(sRegFromDt);
            searchVO.setsRegFromDt(dRegFromDt);
        }
        if(!StringUtils.isBlank(params.get("sRegToDt").toString())){
            String sRegToDt = params.get("sRegToDt").toString();
            Date dRegToDt = DateUtil.convertToDate(sRegToDt);
            searchVO.setsRegToDt(dRegToDt);
        }
        if(!StringUtils.isBlank(params.get("sCompleteFromDt").toString())){
            String sCompleteFromDt = params.get("sCompleteFromDt").toString();
            Date dCompleteFromDt = DateUtil.convertToDate(sCompleteFromDt);
            searchVO.setsCompleteFromDt(dCompleteFromDt);
        }
        if(!StringUtils.isBlank(params.get("sCompleteToDt").toString())){
            String sCompleteToDt = params.get("sCompleteToDt").toString();
            Date dCompleteToDt = DateUtil.convertToDate(sCompleteToDt);
            searchVO.setsCompleteToDt(dCompleteToDt);
        }
        if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
            String sRoFromDt = params.get("sRoFromDt").toString();
            Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
            searchVO.setsRoFromDt(dRoFromDt);
        }
        if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
            String sRoToDt = params.get("sRoToDt").toString();
            Date dRoToDt = DateUtil.convertToDate(sRoToDt);
            searchVO.setsRoToDt(dRoToDt);
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        list = selectCarCheckListByCondition(searchVO);

        context.putVar("items", list);
    }

}
