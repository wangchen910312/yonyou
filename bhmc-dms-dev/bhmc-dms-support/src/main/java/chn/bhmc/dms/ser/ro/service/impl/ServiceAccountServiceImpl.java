package chn.bhmc.dms.ser.ro.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.ro.service.ServiceAccountService;
import chn.bhmc.dms.ser.ro.service.dao.ServiceAccountDAO;
import chn.bhmc.dms.ser.ro.vo.ServiceAccountSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceAccountServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 10. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 22.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("serviceAccountService")
public class ServiceAccountServiceImpl extends HService implements ServiceAccountService {


    @Resource(name="serviceAccountDAO")
    ServiceAccountDAO serviceAccountDAO;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    @Override
    public HMap selectServiceRoByConditionCnt(ServiceAccountSearchVO searchVO) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        if( searchVO.getsRegDt() == null){
            searchVO.setsRegDt(DateUtil.convertToDate(DateUtil.getDate(dateFormat)));
        }

        HMap hmap = serviceAccountDAO.selectServiceRoByConditionCnt(searchVO);

        return hmap;
    }

    @Override
    public int selectServiceRcvByConditionCnt(ServiceAccountSearchVO searchVO) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        if( searchVO.getsRegDt() == null){
            searchVO.setsRegDt(DateUtil.convertToDate(DateUtil.getDate(dateFormat)));
        }

        Integer n=serviceAccountDAO.selectServiceRcvByConditionCnt(searchVO);
        if(n==null){
            return 0;
        }else{
            return n;
        }
        //return serviceAccountDAO.selectServiceRcvByConditionCnt(searchVO);
    }


    @Override
    public HMap selectServiceClaimByConditionCnt(ServiceAccountSearchVO searchVO) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        if( searchVO.getsRegDt() == null){
            searchVO.setsRegDt(DateUtil.convertToDate(DateUtil.getDate(dateFormat)));
        }


        if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        if( searchVO.getsRegDt() == null){
            searchVO.setsRegDt(DateUtil.convertToDate(DateUtil.getDate(dateFormat)));
        }

        HMap hmap = serviceAccountDAO.selectServiceClaimByConditionCnt(searchVO);

        return hmap;
    }

}
