package chn.bhmc.dms.ser.ro.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.ser.ro.vo.DcsCampaignOfVinIfVO;

import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;

import chn.bhmc.dms.core.support.camel.Data;

import chn.bhmc.dms.ser.ro.service.DcsVehicleCampaginInfoService;

import chn.bhmc.dms.ser.ro.vo.DcsCampaignOfVinSearchVO;
import chn.bhmc.dms.ser.ro.vo.DcsCampaignOfVinVO;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PreCheckService.java
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
@Service("DcsVehicleCampaginInfoService")
public class DcsVehicleCampaginInfoServiceImpl extends HService implements DcsVehicleCampaginInfoService{


    /**
     * 고객요구사항 및 고장설명
     */
    @Autowired
    ServiceCommonService serviceCommonService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 켐페인 사용 이력 조회 (dcs)
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<DcsCampaignOfVinVO> dcsVehicleCampaginInfo(DcsCampaignOfVinSearchVO searchVO) throws Exception {

        List<DcsCampaignOfVinVO> vinList = new ArrayList<DcsCampaignOfVinVO>();
        List<DcsCampaignOfVinIfVO> vinIfList = new ArrayList<DcsCampaignOfVinIfVO>();

        // Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();

        message.put("VIN_NO", searchVO.getsVinNo());
        message.put("CR_NO", searchVO.getsCrNo());
        message.put("LBR_CD", searchVO.getsLbrCd());

        Data receiveData = serviceCommonService.executeCamelClentSearchResult(message, "SER115");

        if (receiveData.getFooter().getIfResult().equals("Z")) {
            vinIfList = receiveData.readMessages(DcsCampaignOfVinIfVO.class);
            DcsCampaignOfVinVO dcsCampaignOfVinVO = new DcsCampaignOfVinVO();

            for (int i = 0; i < vinIfList.size(); i++) {

                dcsCampaignOfVinVO.setDlrCd(vinIfList.get(i).getDlrCd());
                dcsCampaignOfVinVO.setCrNo(vinIfList.get(i).getCrNo());
                dcsCampaignOfVinVO.setLbrCd(vinIfList.get(i).getLbrCd());
                dcsCampaignOfVinVO.setVinNo(vinIfList.get(i).getVinNo());
                dcsCampaignOfVinVO.setCrTp(vinIfList.get(i).getCrTp());
                dcsCampaignOfVinVO.setRegUsrId(vinIfList.get(i).getRegUsrId());
                dcsCampaignOfVinVO.setRegDt(vinIfList.get(i).getRegDt());
                dcsCampaignOfVinVO.setUpdtUsrId(vinIfList.get(i).getUpdtUsrId());
                dcsCampaignOfVinVO.setUpdtDt(vinIfList.get(i).getUpdtDt());

                vinList.add(dcsCampaignOfVinVO);
            }
        } else {
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg()});
        }
        return vinList;
    }
}