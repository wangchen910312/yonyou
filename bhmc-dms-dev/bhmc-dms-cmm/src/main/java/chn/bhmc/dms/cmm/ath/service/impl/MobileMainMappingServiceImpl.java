package chn.bhmc.dms.cmm.ath.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.ath.service.MobileMainMappingService;
import chn.bhmc.dms.cmm.ath.service.dao.MobileMainMappingDAO;
import chn.bhmc.dms.cmm.ath.vo.MobileMainMappingVO;

/**
 * <pre>
 * 모바일메인화면-사용자 매핑 서비스 구현
 * </pre>
 *
 * @ClassName   : MobileMainMappingServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 5. 18.   Kang Seok Han    최초 생성
 * </pre>
 */

@Service("mobileMainMappingService")
public class MobileMainMappingServiceImpl implements MobileMainMappingService {

    @Resource(name="mobileMainMappingDAO")
    MobileMainMappingDAO mobileMainMappingDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertMobileMainMapping(MobileMainMappingVO mobleMainMappingVO) throws Exception {
        return mobileMainMappingDAO.insertMobileMainMapping(mobleMainMappingVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateMobileMainMapping(MobileMainMappingVO mobleMainMappingVO) throws Exception {
        return mobileMainMappingDAO.updateMobileMainMapping(mobleMainMappingVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteMobileMainMapping(String usrId) throws Exception {
        return mobileMainMappingDAO.deleteMobileMainMapping(usrId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertOrUpdateMobileMainMapping(MobileMainMappingVO mobleMainMappingVO) throws Exception {
        MobileMainMappingVO oldMobileMainMappingVO = selectMobileMainMapping(mobleMainMappingVO.getUsrId());

        if(StringUtils.isBlank(mobleMainMappingVO.getMobMainTp())){
            if(oldMobileMainMappingVO == null){
                return 0;
            }
            return deleteMobileMainMapping(mobleMainMappingVO.getUsrId());
        }

        if(oldMobileMainMappingVO == null){
            return insertMobileMainMapping(mobleMainMappingVO);
        }

        return updateMobileMainMapping(mobleMainMappingVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public MobileMainMappingVO selectMobileMainMapping(String usrId) throws Exception {
        return mobileMainMappingDAO.selectMobileMainMapping(usrId);
    }

}
