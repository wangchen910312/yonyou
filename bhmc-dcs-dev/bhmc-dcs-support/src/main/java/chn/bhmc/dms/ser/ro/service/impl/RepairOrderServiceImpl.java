package chn.bhmc.dms.ser.ro.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.ro.service.RepairOrderLaborService;
import chn.bhmc.dms.ser.ro.service.RepairOrderPartService;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.dao.RepairOrderDAO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSaveVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderStatusVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
import chn.bhmc.dms.ser.svi.service.BayCalendarService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderServiceImpl.java
 * @Description : RO ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.   KyungMok Kim     최초 생성
 *  2018.06.21.     Jin JUNG        add method - selectROCntByConditionCnt(), selectROCntByCondition()
 * </pre>
 */

@Service("repairOrderService")
public class RepairOrderServiceImpl extends HService implements RepairOrderService, JxlsSupport {

    /**
     * 예약접수 DAO
     */
    @Resource(name="repairOrderDAO")
    RepairOrderDAO repairOrderDAO;

    /**
     * RO부품 Service
     */
    @Resource(name="repairOrderPartService")
    RepairOrderPartService repairOrderPartService;

    /**
     * RO공임 Service
     */
    @Resource(name="repairOrderLaborService")
    RepairOrderLaborService repairOrderLaborService;

    /**
     * 예약접수 Service
     */
   /* @Resource(name="reservationReceiptService")
    ReservationReceiptService reservationReceiptService;
*/
    /**
     * Bay캘린더 Service
     */
    @Resource(name="bayCalendarService")
    BayCalendarService bayCalendarService;


    @Resource(name="roDocNoIdGenService")
    TableIdGenService roDocNoIdGenService;

    @Resource(name="roGrpNoIdGenService")
    TableIdGenService roGrpNoIdGenService;

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectRepairOrderByConditionCnt(RepairOrderSearchVO searchVO) throws Exception {
        return repairOrderDAO.selectRepairOrderByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<RepairOrderVO> selectRepairOrderByCondition(RepairOrderSearchVO searchVO) throws Exception {

        List<RepairOrderVO> resvList = repairOrderDAO.selectRepairOrderByCondition(searchVO);

        return resvList;
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public String multiRepairOrder(RepairOrderSaveVO repairOrderSaveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        String roDocNo = repairOrderSaveVO.getRepairOrderVO().getRoDocNo();
        String roGrpNo = repairOrderSaveVO.getRepairOrderVO().getRoGrpNo();

        if(!StringUtil.isEmpty(roDocNo)) {
            repairOrderSaveVO.getRepairOrderVO().setUpdtUsrId(userId);
            repairOrderDAO.updateRepairOrder(repairOrderSaveVO.getRepairOrderVO());
        } else {

            // 차량접수가 안됐을 경우 자동 차량접수
            if(StringUtil.isEmpty(repairOrderSaveVO.getRepairOrderVO().getRoGrpNo())){
                /**
                 * RO그룹번호(키생성)
                 */
             /*   roGrpNo = roGrpNoIdGenService.getNextStringId();

                ReservationReceiptVO resvVO = new ReservationReceiptVO();

                resvVO.setResvStatCd("I");
                resvVO.setRoGrpNo(roGrpNo);
                resvVO.setResvDocNo(repairOrderSaveVO.getRepairOrderVO().getResvDocNo());
                resvVO.setUpdtUsrId(userId);

                reservationReceiptService.updateReservationReceipt(resvVO);*/
            }

            /**
             * RO번호(키생성)
             */
            synchronized (roDocNoIdGenService) {
                ((RoDocNoIdGenStrategy)roDocNoIdGenService.getStrategy()).setRoGrpNo(roGrpNo);
                roDocNo = roDocNoIdGenService.getNextStringId();
            }

            repairOrderSaveVO.getRepairOrderVO().setRegUsrId(userId);
            repairOrderSaveVO.getRepairOrderVO().setRoDocNo(roDocNo);
            repairOrderSaveVO.getRepairOrderVO().setRoGrpNo(roGrpNo);
            repairOrderSaveVO.getRepairOrderVO().setDlrCd(dlrCd);
            repairOrderDAO.insertRepairOrder(repairOrderSaveVO.getRepairOrderVO());
        }

        // 부품 추가/수정/삭제
        repairOrderPartService.multiRepairOrderPart(repairOrderSaveVO.getRepairOrderPartSaveVO(), repairOrderSaveVO.getRepairOrderVO());

        // 공임 추가/수정/삭제
        repairOrderLaborService.multiRepairOrderLabor(repairOrderSaveVO.getRepairOrderLaborSaveVO(), roDocNo);

        return roDocNo;
    }

    /*
     * {@inheritDoc}
     */
    public RepairOrderVO selectRepairOrderByKey(RepairOrderSearchVO searchVO) throws Exception {
        return repairOrderDAO.selectRepairOrderByKey(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public String updateRepairOrder(RepairOrderVO repairOrderVO) throws Exception {
        repairOrderVO.setUpdtUsrId(LoginUtil.getUserId());

        repairOrderDAO.updateRepairOrder(repairOrderVO);
        return repairOrderVO.getRoDocNo();
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public String selectRepairOrderCheckByKey(RepairOrderSearchVO repairOrderVO) throws Exception {

        return repairOrderDAO.selectRepairOrderCheckByKey(repairOrderVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<RepairOrderVO> selectPreRepairOrderByCondition(RepairOrderSearchVO searchVO) throws Exception {

        return repairOrderDAO.selectPreRepairOrderByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectRepairOrderListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return repairOrderDAO.selectRepairOrderListByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<RepairOrderVO> selectRepairOrderListByCondition(RepairOrderSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<RepairOrderVO> resvList = repairOrderDAO.selectRepairOrderListByCondition(searchVO);

        return resvList;
    }

    /**
     * 조회 조건에 해당하는 공임이력 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectLbrHistListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectLbrHistListByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 공임이력을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderVO> selectLbrHistListByCondition(RepairOrderSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectLbrHistListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        RepairOrderSearchVO searchVO = new RepairOrderSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<RepairOrderVO> list = null;
        String sListType = (String)params.get("sListType");

        if(StringUtil.nullConvert(sListType).equals("RS")){
            if(!StringUtils.isBlank(params.get("sExpcDlToDt").toString())){
                String sExpcDlToDt = params.get("sExpcDlToDt").toString();
                Date dExpcDlToDt = DateUtil.convertToDate(sExpcDlToDt);
                searchVO.setsExpcDlToDt(dExpcDlToDt);
            }
            if(!StringUtils.isBlank(params.get("sExpcDlFromDt").toString())){
                String sExpcDlFromDt = params.get("sExpcDlFromDt").toString();
                Date dExpcDlFromDt = DateUtil.convertToDate(sExpcDlFromDt);
                searchVO.setsExpcDlFromDt(dExpcDlFromDt);
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
            if(!StringUtils.isBlank(params.get("sRoTpList").toString())){
                String[] result = params.get("sRoTpList").toString().split(",");
                List<String> sRoTpList = new ArrayList<String>();
                for(int i=0;i<result.length;i++){
                    sRoTpList.add(i, result[i]);
                }
                searchVO.setsRoTpList(sRoTpList);
            }
            if(!StringUtils.isBlank(params.get("sCustSaleFromDt").toString())){
                String sCustSaleFromDt = params.get("sCustSaleFromDt").toString();
                Date dCustSaleFromDt = DateUtil.convertToDate(sCustSaleFromDt);
                searchVO.setsCustSaleFromDt(dCustSaleFromDt);
            }
            if(!StringUtils.isBlank(params.get("sCustSaleToDt").toString())){
                String sCustSaleToDt = params.get("sCustSaleToDt").toString();
                Date dCustSaleToDt = DateUtil.convertToDate(sCustSaleToDt);
                searchVO.setsCustSaleToDt(dCustSaleToDt);
            }
            if(!StringUtils.isBlank(params.get("sPayEndFromDt").toString())){
                String sPayEndFromDt = params.get("sPayEndFromDt").toString();
                Date dPayEndFromDt = DateUtil.convertToDate(sPayEndFromDt);
                searchVO.setsPayEndFromDt(dPayEndFromDt);
            }
            if(!StringUtils.isBlank(params.get("sPayEndToDt").toString())){
                String sPayEndToDt = params.get("sPayEndToDt").toString();
                Date dPayEndToDt = DateUtil.convertToDate(sPayEndToDt);
                searchVO.setsPayEndToDt(dPayEndToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            list = selectRepairOrderListByCondition(searchVO);

        }else if(StringUtil.nullConvert(sListType).equals("LH")){

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
            if(!StringUtils.isBlank(params.get("sCalcFromDt").toString())){
                String sCalcFromDt = params.get("sCalcFromDt").toString();
                Date dCalcFromDt = DateUtil.convertToDate(sCalcFromDt);
                searchVO.setsCalcFromDt(dCalcFromDt);
            }
            if(!StringUtils.isBlank(params.get("sCalcToDt").toString())){
                String sCalcToDt = params.get("sCalcToDt").toString();
                Date dCalcToDt = DateUtil.convertToDate(sCalcToDt);
                searchVO.setsCalcToDt(dCalcToDt);
            }
            if(!StringUtils.isBlank(params.get("sPayFromDt").toString())){
                String sPayFromDt = params.get("sPayFromDt").toString();
                Date dPayFromDt = DateUtil.convertToDate(sPayFromDt);
                searchVO.setsPayFromDt(dPayFromDt);
            }
            if(!StringUtils.isBlank(params.get("sPayToDt").toString())){
                String sPayToDt = params.get("sPayToDt").toString();
                Date dPayToDt = DateUtil.convertToDate(sPayToDt);
                searchVO.setsPayToDt(dPayToDt);
            }
            searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            list = selectLbrHistListByCondition(searchVO);

        }
        context.putVar("items", list);
    }

    /**
     * 조회 조건에 해당하는 딜러별 RO count 이력 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectROCntByConditionCnt(RepairOrderSearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectROCntByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 딜러별 RO count 이력을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<RepairOrderStatusVO> selectROCntByCondition(RepairOrderSearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return repairOrderDAO.selectROCntByCondition(searchVO);
    }

}