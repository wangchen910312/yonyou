package chn.bhmc.dms.mob.api.main.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.mob.api.main.dao.MainMobileMainMappingDAO;
import chn.bhmc.dms.mob.api.main.service.MainMobileMainMappingService;
import chn.bhmc.dms.mob.api.main.vo.MobileMainMappingVO;


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

@Service("MainMobileMainMappingService")
public class MainMobileMainMappingServiceImpl implements MainMobileMainMappingService {

    @Resource(name="MainMobileMainMappingDAO")
    MainMobileMainMappingDAO MainMobileMainMappingDAO;

    @Override
    public MobileMainMappingVO selectMobileMainMapping(String usrId) throws Exception {
        return MainMobileMainMappingDAO.selectMobileMainMapping(usrId);
    }

}
