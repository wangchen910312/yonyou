package chn.bhmc.dms.ser.wac.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.wac.service.SanbaoInfoService;
import chn.bhmc.dms.ser.wac.service.dao.SanbaoInfoDAO;
import chn.bhmc.dms.ser.wac.vo.SanbaoAlarmIfVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoAlarmVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoClaimInfoIfVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoClaimInfoVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoCustIfVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoCustVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSamePartIfVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSamePartVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoWorkInfoIfVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoWorkInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 7. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 25.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("sanbaoInfoService")
public class SanbaoInfoServiceImpl extends HService implements SanbaoInfoService{

    @Resource(name = "sanbaoInfoDAO")
    SanbaoInfoDAO sanbaoInfoDAO;

    @Autowired
    ServiceCommonService serviceCommonService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 삼보 알람 정보
     *
     * @param searchVO
     * @return 삼보알람 정보
     */
    public SanbaoAlarmVO selectSanbaoAlarmInfoByKey(SanbaoSearchVO searchVO) throws Exception {

        //SanbaoAlarmVO sanBaoAlarmVO = sanbaoInfoDAO.selectSanbaoAlarmInfoByKey(searchVO);
        //if( sanBaoAlarmVO == null) sanBaoAlarmVO = new SanbaoAlarmVO();

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        SanbaoAlarmVO sanBaoAlarmVO = new SanbaoAlarmVO();

        //삼포 대상 여부 체크
        int sanBaoVinCnt = sanbaoInfoDAO.selectSanbaoVinInfoChkByKey(searchVO);

        if(sanBaoVinCnt != 0){

            String pattern = dateFormat + " HH:mm:ss";

            //Carmel InterFace Header Info
            Map<String, Object> message = new HashMap<String, Object>();
            message.put("DLR_CD", LoginUtil.getDlrCd());
            message.put("VIN_NO", searchVO.getsVinNo());

            Data receiveData = serviceCommonService.executeCamelClentSearchResult(message,"SER061");


            List<SanbaoAlarmIfVO> sanbaoIfList = new ArrayList<SanbaoAlarmIfVO>();

            if (receiveData.getFooter().getIfResult().equals("Z")) {
                
				sanbaoIfList = receiveData.readMessages(SanbaoAlarmIfVO.class);
               
                for(int i = 0 ; i <  sanbaoIfList.size() ; i++){

    				if(sanbaoIfList.get(i).getDlrCd()==null) {   //tjx添加判断是否有值,解决报空错问题
    					sanBaoAlarmVO = new SanbaoAlarmVO();
                    	
	                    sanBaoAlarmVO.setVinNo(sanbaoIfList.get(i).getVinNo());//차대번호
	                    sanBaoAlarmVO.setVinNo1(sanbaoIfList.get(i).getVinNo1());//차대번호1
	                    sanBaoAlarmVO.setVinNo2(sanbaoIfList.get(i).getVinNo2());//차대번호2
	                    sanBaoAlarmVO.setSaleDlrCd(sanbaoIfList.get(i).getSaleDlrCd());//판매딜러 코드
	                    sanBaoAlarmVO.setSaleDlrNm(sanbaoIfList.get(i).getSaleDlrNm());//판매딜러 명칭
	                    sanBaoAlarmVO.setWartDt(DateUtil.convertToTimestamp(sanbaoIfList.get(i).getWartDt() ,pattern ));//보증수리일자
	                    sanBaoAlarmVO.setSaleDt(DateUtil.convertToTimestamp(sanbaoIfList.get(i).getSaleDt(),pattern ));//판매일자
	                    sanBaoAlarmVO.setCreDt(DateUtil.convertToTimestamp(sanbaoIfList.get(i).getCreDt() ,pattern));//생산일자
	                    sanBaoAlarmVO.setSanbaoRemainDay(sanbaoIfList.get(i).getSanbaoRemainDay());//삼포 남은 기간
	                    sanBaoAlarmVO.setSanbaoWartPrid(sanbaoIfList.get(i).getSanbaoWartPrid());//삼보 보증기간 년도
	                    sanBaoAlarmVO.setSanbaoWartYn(sanbaoIfList.get(i).getSanbaoWartYn());//삼포대상여부
	                    sanBaoAlarmVO.setSanbaoWartRunDistVal(sanbaoIfList.get(i).getSanbaoWartRunDistVal());//삼보 보증기간 주행거리
	                    sanBaoAlarmVO.setSanbaoWartRmPrid(sanbaoIfList.get(i).getSanbaoWartRmPrid());//삼보 보증 잔여 기간
	                    sanBaoAlarmVO.setSanbaoWartRmRunDistVal(sanbaoIfList.get(i).getSanbaoWartRmRunDistVal());//삼보 보증 잔여 주행거리
	                    sanBaoAlarmVO.setNewCarWartPrid(sanbaoIfList.get(i).getNewCarWartPrid());//신차보증 기간(일)
	                    sanBaoAlarmVO.setNewCarWartRunDistVal(sanbaoIfList.get(i).getNewCarWartRunDistVal());//신차보증 주행거리
	                    sanBaoAlarmVO.setNewCarWartRmPrid(sanbaoIfList.get(i).getNewCarWartRmPrid());//신차보증 잔여기간
	                    sanBaoAlarmVO.setNewCarWartRmRunDistVal(sanbaoIfList.get(i).getNewCarWartRmRunDistVal());//신차보증 잔여 주행거리
	                    sanBaoAlarmVO.setWorkOverPrid(sanbaoIfList.get(i).getWorkOverPrid());//작업일수초과 적용기준
	                    sanBaoAlarmVO.setWorkOverRmPrid(sanbaoIfList.get(i).getWorkOverRmPrid());//작업일수 초과 남은 일수
	                    sanBaoAlarmVO.setNewCarWartYn(sanbaoIfList.get(i).getNewCarWartYn());//신차 보증 여부
	                    sanBaoAlarmVO.setWorkOverYn(sanbaoIfList.get(i).getWorkOverYn());//작업일수 초과 여부
	                    sanBaoAlarmVO.setSanbaoWartAlarmYn(sanbaoIfList.get(i).getSanbaoWartAlarmYn());//삼보 보증 알람 여부
	                    sanBaoAlarmVO.setNewCarWartAlarmYn(sanbaoIfList.get(i).getNewCarWartAlarmYn());//신차 보증 알람 여부
	                    sanBaoAlarmVO.setWorkOverAlarmYn(sanbaoIfList.get(i).getWorkOverAlarmYn());//작업일수 초과 알람 여부
	                    sanBaoAlarmVO.setWorkDay(sanbaoIfList.get(i).getWorkDay());//작업일자
	                    sanBaoAlarmVO.setWorkOverAlarmTerm(sanbaoIfList.get(i).getWorkOverAlarmTerm());//작업일수 알람조건
	                    sanBaoAlarmVO.setNewCarWartAlarmTerm(sanbaoIfList.get(i).getNewCarWartAlarmTerm());//신차 알람조건
	                    sanBaoAlarmVO.setSanbaoWartAlarmTerm(sanbaoIfList.get(i).getSanbaoWartAlarmTerm());//삼포 알람 조건
	                    sanBaoAlarmVO.setRunDistVal(Integer.parseInt(sanbaoIfList.get(i).getRunDistVal()));//현재 주행거리
	
	                    //sanbaoList.add(sanBaoAlarmVO);
                    }else {
                    	return sanBaoAlarmVO;
                    }
                    
                }
            }
        }

        return sanBaoAlarmVO;
    }

    /**
     * 동일하자 리스트 정보
     *
     * @param searchVO
     * @return 동일하자 리스트 정보
     */
    public List<SanbaoSamePartVO> selectSanbaoItemsByCondition(SanbaoSearchVO searchVO) throws Exception {

        //String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        //String pattern = dateFormat + " HH:mm:ss";

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        //sanbaoInfoDAO.selectSanbaoItemsByCondition(searchVO);


        SanbaoSamePartVO sanbaoSamePartVO = new SanbaoSamePartVO();

        String fromDt = "";
        if( searchVO.getsFromDt() != null ){
            fromDt = DateUtil.convertToDateTimeString(searchVO.getsFromDt());
        }
        //Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();
        message.put("DLR_CD", searchVO.getsDlrCd());
        message.put("VIN_NO", searchVO.getsVinNo());
        message.put("FROM_DT", fromDt );
        message.put("ITEM_ATC_CD", searchVO.getsItemAtcCd());
        message.put("ITEM_GRP_CD", searchVO.getsItemGrpCd());
        message.put("OCCR_CNT", searchVO.getsOccrCnt());

        Data receiveData = serviceCommonService.executeCamelClentSearchResult(message,"SER062");


        List<SanbaoSamePartIfVO> sanbaoPartIfList = new ArrayList<SanbaoSamePartIfVO>();
        List<SanbaoSamePartVO> sanbaoPartList = new ArrayList<SanbaoSamePartVO>();

        if (receiveData.getFooter().getIfResult().equals("Z")) {
            sanbaoPartIfList = receiveData.readMessages(SanbaoSamePartIfVO.class);
            for(int i = 0 ; i <  sanbaoPartIfList.size() ; i++){
                sanbaoSamePartVO = new SanbaoSamePartVO();

                sanbaoSamePartVO.setVinNo(sanbaoPartIfList.get(i).getVinNo());//차대번호
                sanbaoSamePartVO.setLtsModelNm(sanbaoPartIfList.get(i).getLtsModelNm());//LTS MODEL NM
                sanbaoSamePartVO.setCarlineCd(sanbaoPartIfList.get(i).getCarlineCd());//차종코드
                sanbaoSamePartVO.setItemGrpCd(sanbaoPartIfList.get(i).getItemGrpCd());//품목그룹코드
                sanbaoSamePartVO.setItemGrpNm(sanbaoPartIfList.get(i).getItemGrpNm());//품목그룹명
                sanbaoSamePartVO.setItemAtcCd(sanbaoPartIfList.get(i).getItemAtcCd());//품목항목코드
                sanbaoSamePartVO.setSameFauExchTermVal(sanbaoPartIfList.get(i).getSameFauExchTermVal());//동일하지 교환조건
                sanbaoSamePartVO.setOccrCnt(sanbaoPartIfList.get(i).getOccrCnt());//발생건수
                sanbaoSamePartVO.setItemGrpYn(sanbaoPartIfList.get(i).getItemGrpYn());//동일하자 여부

                sanbaoPartList.add(sanbaoSamePartVO);
            }
        }

        return sanbaoPartList;
    }

    /**
     * 삼포 작업  리스트 정보
     *
     * @param searchVO
     * @return 삼포 작업  리스트 정보
     */
    @Override
    public List<SanbaoWorkInfoVO> selectSanbaoWorkInfoByCondition(SanbaoSearchVO searchVO) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String pattern = dateFormat + " HH:mm:ss";

        SanbaoWorkInfoVO sanbaoWorkInfoVO = new SanbaoWorkInfoVO();

        //Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();
        message.put("DLR_CD", LoginUtil.getDlrCd());
        message.put("VIN_NO", searchVO.getsVinNo());

        Data receiveData = serviceCommonService.executeCamelClentSearchResult(message,"SER065");


        List<SanbaoWorkInfoIfVO> sanbaoWorkIfList = new ArrayList<SanbaoWorkInfoIfVO>();
        List<SanbaoWorkInfoVO> sanbaoWorkList = new ArrayList<SanbaoWorkInfoVO>();

        if (receiveData.getFooter().getIfResult().equals("Z")) {
            sanbaoWorkIfList = receiveData.readMessages(SanbaoWorkInfoIfVO.class);
            for(int i = 0 ; i <  sanbaoWorkIfList.size() ; i++){
                sanbaoWorkInfoVO = new SanbaoWorkInfoVO();

                sanbaoWorkInfoVO.setDlrCd(sanbaoWorkIfList.get(i).getDlrCd());//딜러코드
                sanbaoWorkInfoVO.setRoDocNo(sanbaoWorkIfList.get(i).getRoDocNo());//ro 번호
                sanbaoWorkInfoVO.setRoStartDt(DateUtil.convertToTimestamp(sanbaoWorkIfList.get(i).getRoStartDt() , pattern));//ro 시작일
                sanbaoWorkInfoVO.setRoEndDt(DateUtil.convertToTimestamp(sanbaoWorkIfList.get(i).getRoEndDt(),pattern));//ro 종료일
                sanbaoWorkInfoVO.setRoWorkHm(sanbaoWorkIfList.get(i).getRoWorkHm());//작업시간

                sanbaoWorkList.add(sanbaoWorkInfoVO);
            }
        }

        return sanbaoWorkList;


    }


    /**
    *
    * 삼포 고객 조회
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
    @Override
    public List<SanbaoCustVO> selectSanbaoCustInfoByCondition(SanbaoSearchVO searchVO) throws Exception {


      //Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();
        message.put("DLR_CD", LoginUtil.getDlrCd());
        message.put("VIN_NO", searchVO.getsVinNo());

        Data receiveData = serviceCommonService.executeCamelClentSearchResult(message,"SER063");

        SanbaoCustVO sanbaoCustVO = new SanbaoCustVO();
        List<SanbaoCustIfVO> sanbaoCustIfList = new ArrayList<SanbaoCustIfVO>();
        List<SanbaoCustVO> sanbaoCustList = new ArrayList<SanbaoCustVO>();

        if (receiveData.getFooter().getIfResult().equals("Z")) {
            sanbaoCustIfList = receiveData.readMessages(SanbaoCustIfVO.class);
            for(int i = 0 ; i <  sanbaoCustIfList.size() ; i++){
                sanbaoCustVO = new SanbaoCustVO();

                sanbaoCustVO.setDlrCd(sanbaoCustIfList.get(i).getDlrCd());//딜러코드
                sanbaoCustVO.setVinNo(sanbaoCustIfList.get(i).getVinNo());//차대번호
                sanbaoCustVO.setCarOwnerId(sanbaoCustIfList.get(i).getCarOwnerId());//소유자ID
                sanbaoCustVO.setCarOwnerNm(sanbaoCustIfList.get(i).getCarOwnerNm());//소유자명
                sanbaoCustVO.setCarOwnerTelNo(sanbaoCustIfList.get(i).getCarOwnerTelNo());//소유자전화번호
                sanbaoCustVO.setCarOwnerHpNo(sanbaoCustIfList.get(i).getCarOwnerHpNo());//소유자핸드폰번호
                sanbaoCustVO.setCarOwnerEmailNm(sanbaoCustIfList.get(i).getCarOwnerEmailNm());//소유자이메일
                sanbaoCustVO.setCarOwnerSsnCrnNo(sanbaoCustIfList.get(i).getCarOwnerSsnCrnNo());//소유자주민사업자등록번호
                sanbaoCustVO.setCarOwnerZipCd(sanbaoCustIfList.get(i).getCarOwnerZipCd());//소유자우편번호
                sanbaoCustVO.setCarOwnerAddr(sanbaoCustIfList.get(i).getCarOwnerAddr());//소유자주소

                sanbaoCustList.add(sanbaoCustVO);
            }

        }

        return sanbaoCustList;
    }


    /**
     * 삼포 클레임  리스트 정보
     *
     * @param searchVO
     * @return 삼포 클레임  리스트 정보
     */
    public List<SanbaoClaimInfoVO> selectSanbaoClaimInfoByCondition(SanbaoSearchVO searchVO) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String pattern = dateFormat + " HH:mm:ss";

        //Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();
        message.put("DLR_CD", LoginUtil.getDlrCd());
        message.put("VIN_NO", searchVO.getsVinNo());

        Data receiveData = serviceCommonService.executeCamelClentSearchResult(message,"SER064");


        SanbaoClaimInfoVO sanbaoClaimInfoVO = new SanbaoClaimInfoVO();
        List<SanbaoClaimInfoIfVO> sanbaoClaimInfoIfList = new ArrayList<SanbaoClaimInfoIfVO>();
        List<SanbaoClaimInfoVO> sanbaoClaimInfoList = new ArrayList<SanbaoClaimInfoVO>();

        if (receiveData.getFooter().getIfResult().equals("Z")) {
            sanbaoClaimInfoIfList = receiveData.readMessages(SanbaoClaimInfoIfVO.class);
            for(int i = 0 ; i <  sanbaoClaimInfoIfList.size() ; i++){
                sanbaoClaimInfoVO = new SanbaoClaimInfoVO();

                sanbaoClaimInfoVO.setDlrCd(sanbaoClaimInfoIfList.get(i).getDlrCd());//딜러코드
                sanbaoClaimInfoVO.setRoDocNo(sanbaoClaimInfoIfList.get(i).getRoDocNo());//ro번호
                sanbaoClaimInfoVO.setClaimDocNo(sanbaoClaimInfoIfList.get(i).getClaimDocNo());//클레임번호
                sanbaoClaimInfoVO.setClaimTp(sanbaoClaimInfoIfList.get(i).getClaimTp());//클레임유형
                sanbaoClaimInfoVO.setRunDistVal(sanbaoClaimInfoIfList.get(i).getRunDistVal());//주행거리
                sanbaoClaimInfoVO.setCauItemCd(sanbaoClaimInfoIfList.get(i).getCauItemCd());//원인부품코드
                sanbaoClaimInfoVO.setCauItemNm(sanbaoClaimInfoIfList.get(i).getCauItemNm());//원인부품명
                sanbaoClaimInfoVO.setCauCd(sanbaoClaimInfoIfList.get(i).getCauCd());//원인코드
                sanbaoClaimInfoVO.setCauNm(sanbaoClaimInfoIfList.get(i).getCauNm());//원인코드명
                sanbaoClaimInfoVO.setPhenCd(sanbaoClaimInfoIfList.get(i).getPhenCd());//현상코드
                sanbaoClaimInfoVO.setPhenNm(sanbaoClaimInfoIfList.get(i).getPhenNm());//현상코드명
                sanbaoClaimInfoVO.setRoStartDt(DateUtil.convertToTimestamp(sanbaoClaimInfoIfList.get(i).getRoStartDt(),pattern));//ro 시작일
                sanbaoClaimInfoVO.setRoEndDt(DateUtil.convertToTimestamp(sanbaoClaimInfoIfList.get(i).getRoEndDt(),pattern));//ro 종료일
                sanbaoClaimInfoVO.setRoWorkHm(sanbaoClaimInfoIfList.get(i).getRoWorkHm());//작업시간

                sanbaoClaimInfoList.add(sanbaoClaimInfoVO);
            }

        }

        return sanbaoClaimInfoList;
    }




}
