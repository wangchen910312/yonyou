package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.ZipCodeService;
import chn.bhmc.dms.cmm.sci.service.dao.ZipCodeDAO;
import chn.bhmc.dms.cmm.sci.vo.ZipCodeSaveVO;
import chn.bhmc.dms.cmm.sci.vo.ZipCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.ZipCodeVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 우편번호 관리 서비스 구현 클래스
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

@Service("zipCodeService")
public class ZipCodeServiceImpl extends HService implements ZipCodeService {

    /**
     * 우편번호 관리 DAO
     */
	@Resource(name="zipCodeDAO")
	ZipCodeDAO zipCodeDAO;

	/**
	 * {@inheritDoc}
	 */
    @Override
    public int insertZipCode(ZipCodeVO zipCodeVO) throws Exception {
        ZipCodeVO obj = selectZipCodeByKey(zipCodeVO.getSungCd(), zipCodeVO.getCityCd(), zipCodeVO.getDistCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return zipCodeDAO.insertZipCode(zipCodeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateZipCode(ZipCodeVO zipCodeVO) throws Exception {
        return zipCodeDAO.updateZipCode(zipCodeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteZipCode(ZipCodeVO zipCodeVO) throws Exception {

        return zipCodeDAO.deleteZipCode(zipCodeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public ZipCodeVO selectZipCodeByKey(String sungCd, String cityCd, String distCd) throws Exception {
        return zipCodeDAO.selectZipCodeByKey(sungCd, cityCd, distCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiZipCodes(ZipCodeSaveVO obj) throws Exception {
        String userId = LoginUtil.getUserId();

        for(ZipCodeVO zipCodeVO : obj.getInsertList()){
            zipCodeVO.setRegUsrId(userId);
            insertZipCode(zipCodeVO);
        }

        for(ZipCodeVO zipCodeVO : obj.getUpdateList()){
            zipCodeVO.setUpdtUsrId(userId);
            updateZipCode(zipCodeVO);
        }

        for(ZipCodeVO zipCodeVO : obj.getDeleteList()){
            deleteZipCode(zipCodeVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<ZipCodeVO> selectZipCodesByCondition(ZipCodeSearchVO searchVO) throws Exception {
        return zipCodeDAO.selectZipCodesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectZipCodesByConditionCnt(ZipCodeSearchVO searchVO) throws Exception {
        return zipCodeDAO.selectZipCodesByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<ZipCodeVO> selectSungList( ) throws Exception {
        return zipCodeDAO.selectSungList();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<ZipCodeVO> selectCityList( ) throws Exception {
        return zipCodeDAO.selectCityList();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<ZipCodeVO> selectDistList( ) throws Exception {
        return zipCodeDAO.selectDistList();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void insertZipCodeBatchUpload(List<ZipCodeVO> list) throws Exception {

        String userId = LoginUtil.getUserId();

        for(ZipCodeVO zipCodeVO : list){
            zipCodeVO.setRegUsrId(userId);

            ZipCodeVO obj = selectZipCodeByKey(zipCodeVO.getSungCd(), zipCodeVO.getCityCd(), zipCodeVO.getDistCd());

            if(obj == null) {
                insertZipCode(zipCodeVO);
            }else{
                updateZipCode(zipCodeVO);
            }
        }
    }

    /**
     * DIST_CD 목록을 조회한다
     */
    @Override
    public List<ZipCodeVO> selectDistCdsByCondition(ZipCodeSearchVO searchVO) throws Exception {
        return zipCodeDAO.selectDistCdsByCondition(searchVO);
    }
}
