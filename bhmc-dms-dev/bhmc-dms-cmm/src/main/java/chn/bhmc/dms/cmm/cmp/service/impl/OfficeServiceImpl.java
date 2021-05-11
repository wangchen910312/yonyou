package chn.bhmc.dms.cmm.cmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.service.OfficeService;
import chn.bhmc.dms.cmm.cmp.service.dao.OfficeDAO;
import chn.bhmc.dms.cmm.cmp.vo.OfficeSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.OfficeSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.OfficeVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 사무소 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("officeService")
public class OfficeServiceImpl extends HService implements OfficeService {

    /**
     * 사무소 관리 DAO
     */
    @Resource(name="officeDAO")
    OfficeDAO officeDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertOffice(OfficeVO officeVO) throws Exception {

        OfficeVO obj = selectOfficeByKey(officeVO.getDiviCd(), officeVO.getOffCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return officeDAO.insertOffice(officeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateOffice(OfficeVO officeVO) throws Exception {
        return officeDAO.updateOffice(officeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteOffice(OfficeVO officeVO) throws Exception {
        return officeDAO.deleteOffice(officeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiOffices(OfficeSaveVO officeSaveVO)  throws Exception {

        String usrId = LoginUtil.getUserId();

        for(OfficeVO officeVO : officeSaveVO.getInsertList()){
            officeVO.setRegUsrId(usrId);
            insertOffice(officeVO);
        }

        for(OfficeVO officeVO : officeSaveVO.getUpdateList()){
            officeVO.setUpdtUsrId(usrId);
            updateOffice(officeVO);
        }

        for(OfficeVO officeVO : officeSaveVO.getDeleteList()){
            deleteOffice(officeVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public OfficeVO selectOfficeByKey(String diviCd, String offCd) throws Exception {
        return officeDAO.selectOfficeByKey(diviCd, offCd);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<OfficeVO> selectOfficesByCondition(OfficeSearchVO searchVO) throws Exception {
        return officeDAO.selectOfficesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectOfficesByConditionCnt(OfficeSearchVO searchVO) throws Exception {
        return officeDAO.selectOfficesByConditionCnt(searchVO);
    }


}
