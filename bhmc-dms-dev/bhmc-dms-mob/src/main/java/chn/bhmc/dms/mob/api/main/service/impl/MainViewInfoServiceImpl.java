package chn.bhmc.dms.mob.api.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.main.dao.MainViewInfoDAO;
import chn.bhmc.dms.mob.api.main.service.MainViewInfoService;
import chn.bhmc.dms.mob.api.main.vo.MenuVO;


/**
 * 화면정보 관리 서비스 구현 클래스 View Information Management Implementation class
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */
@Service("MainViewInfoService")
public class MainViewInfoServiceImpl extends HService implements MainViewInfoService {

    /**
     * 화면정보 관리 DAO
     */
    @Resource(name="MainViewInfoDAO")
    MainViewInfoDAO MainViewInfoDAO;

    @Override
    public List<MenuVO> selectMenuListByUser(String sysCd, String webMobileDstinCd, String usrId) throws Exception {
        return MainViewInfoDAO.selectMenuListByUser(sysCd, webMobileDstinCd, usrId);
    }

}
