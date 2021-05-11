package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.dao.CommonCodeDAO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupTxtSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupTxtSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupTxtVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.cmm.sci.vo.PcaVo;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 공통코드 관리 서비스 구현 클래스
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

@Service("commonCodeService")
public class CommonCodeServiceImpl extends HService implements CommonCodeService {

    /**
     * 공통코드 관리 DAO
     */
	@Resource(name="commonCodeDAO")
	CommonCodeDAO commonCodeDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="commonCodeCache", allEntries=true)
    public int insertCommonCodeGroup(CommonCodeGroupVO codeVO) throws Exception {

        CommonCodeGroupVO obj = selectCommonCodeGroupByKey(codeVO.getCmmGrpCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return commonCodeDAO.insertCommonCodeGroup(codeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="commonCodeCache", allEntries=true)
    public int updateCommonCodeGroup(CommonCodeGroupVO codeVO) throws Exception {
        return commonCodeDAO.updateCommonCodeGroup(codeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="commonCodeCache", allEntries=true)
    public int deleteCommonCodeGroup(CommonCodeGroupVO codeVO) throws Exception {
        return commonCodeDAO.deleteCommonCodeGroup(codeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="commonCodeCache", allEntries=true)
    public void multiCommonCodeGroups(CommonCodeGroupSaveVO obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(CommonCodeGroupVO codeGroupVO : obj.getInsertList()){
            codeGroupVO.setRegUsrId(userId);
            insertCommonCodeGroup(codeGroupVO);
        }

        for(CommonCodeGroupVO codeGroupVO : obj.getUpdateList()){
            codeGroupVO.setUpdtUsrId(userId);
            updateCommonCodeGroup(codeGroupVO);
        }

        for(CommonCodeGroupVO codeGroupVO : obj.getDeleteList()){
            codeGroupVO.setUpdtUsrId(userId);
            deleteCommonCodeGroup(codeGroupVO);
        }

    }

    /**
     * {@inheritDoc}
     */
    @Override
    public CommonCodeGroupVO selectCommonCodeGroupByKey(String cmmGrpCd) throws Exception {
        return commonCodeDAO.selectCommonCodeGroupByKey(cmmGrpCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectCommonCodeGroupsByConditionCnt(CommonCodeGroupSearchVO searchVO) throws Exception {
        return commonCodeDAO.selectCommonCodeGroupsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<CommonCodeGroupVO> selectCommonCodeGroupsByCondition(CommonCodeGroupSearchVO searchVO) throws Exception {
        return commonCodeDAO.selectCommonCodeGroupsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @CacheEvict(value="commonCodeCache", allEntries=true)
    private int insertCommonCodeGroupTxt(CommonCodeGroupTxtVO codeGroupVO) throws Exception {

        CommonCodeGroupTxtVO obj = selectCommonCodeGroupTxtByKey(codeGroupVO.getCmmGrpCd(), codeGroupVO.getLangCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return commonCodeDAO.insertCommonCodeGroupTxt(codeGroupVO);
    }

    /**
     * {@inheritDoc}
     */
    @CacheEvict(value="commonCodeCache", allEntries=true)
    private int updateCommonCodeGroupTxt(CommonCodeGroupTxtVO codeGroupVO) throws Exception {
        return commonCodeDAO.updateCommonCodeGroupTxt(codeGroupVO);
    }

    /**
     * {@inheritDoc}
     */
    @CacheEvict(value="commonCodeCache", allEntries=true)
    private int deleteCommonCodeGroupTxt(CommonCodeGroupTxtVO codeGroupVO) throws Exception {
        return commonCodeDAO.deleteCommonCodeGroupTxt(codeGroupVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="commonCodeCache", allEntries=true)
    public void multiCommonCodeGroupTxts(CommonCodeGroupTxtSaveVO obj) throws Exception {
        String userId = LoginUtil.getUserId();

        for(CommonCodeGroupTxtVO codeGroupVO : obj.getInsertList()){
            codeGroupVO.setRegUsrId(userId);
            insertCommonCodeGroupTxt(codeGroupVO);
        }

        for(CommonCodeGroupTxtVO codeGroupVO : obj.getUpdateList()){
            codeGroupVO.setUpdtUsrId(userId);
            updateCommonCodeGroupTxt(codeGroupVO);
        }

        for(CommonCodeGroupTxtVO codeGroupVO : obj.getDeleteList()){
            codeGroupVO.setUpdtUsrId(userId);
            deleteCommonCodeGroupTxt(codeGroupVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    private CommonCodeGroupTxtVO selectCommonCodeGroupTxtByKey(String cmmGrpCd, String langCd) throws Exception {
        return commonCodeDAO.selectCommonCodeGroupTxtByKey(cmmGrpCd,langCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectCommonCodeGroupTxtsByConditionCnt(CommonCodeGroupTxtSearchVO searchVO) throws Exception {
        return commonCodeDAO.selectCommonCodeGroupTxtsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<CommonCodeGroupTxtVO> selectCommonCodeGroupTxtsByCondition(CommonCodeGroupTxtSearchVO searchVO)  throws Exception  {
        return commonCodeDAO.selectCommonCodeGroupTxtsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="commonCodeCache", allEntries=true)
    public int insertCommonCode(CommonCodeVO codeVO) throws Exception {
        CommonCodeVO obj = selectCommonCodeByKey(codeVO.getCmmGrpCd(), codeVO.getCmmCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return commonCodeDAO.insertCommonCode(codeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="commonCodeCache", allEntries=true)
    public int updateCommonCode(CommonCodeVO codeVO) throws Exception {
        return commonCodeDAO.updateCommonCode(codeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="commonCodeCache", allEntries=true)
    public int deleteCommonCode(CommonCodeVO codeVO) throws Exception {
        return commonCodeDAO.deleteCommonCode(codeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="commonCodeCache", allEntries=true)
    public void multiCommonCodes(CommonCodeSaveVO obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(CommonCodeVO codesVO : obj.getInsertList()){
            codesVO.setRegUsrId(userId);
            insertCommonCode(codesVO);
        }

        for(CommonCodeVO codesVO : obj.getUpdateList()){
            codesVO.setUpdtUsrId(userId);
            updateCommonCode(codesVO);
        }

        for(CommonCodeVO codesVO : obj.getDeleteList()){
            codesVO.setUpdtUsrId(userId);
            deleteCommonCode(codesVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="commonCodeCache")
    public CommonCodeVO selectCommonCodeByKey(String cmmGrpCd, String cmmCd) throws Exception {
        return commonCodeDAO.selectCommonCodeByKey(cmmGrpCd, cmmCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="commonCodeCache")
    public CommonCodeVO selectCommonCodeByService(String cmmGrpCd, String remark10) throws Exception {
        return commonCodeDAO.selectCommonCodeByService(cmmGrpCd, remark10);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="commonCodeCache")
    public String selectCommonCodeName(String cmmGrpCd, String cmmCd, String langCd) throws Exception {
        return commonCodeDAO.selectCommonCodeName(cmmGrpCd, cmmCd, langCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectCommonCodesByConditionCnt(CommonCodeSearchVO searchVO) throws Exception {
        return commonCodeDAO.selectCommonCodesByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<CommonCodeVO> selectCommonCodesByCondition(CommonCodeSearchVO searchVO) throws Exception {
        return commonCodeDAO.selectCommonCodesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="commonCodeCache")
    public List<CommonCodeVO> selectCommonCodesByCmmGrpCd(String cmmGrpCd, String useYn, String langCd) throws Exception {
        CommonCodeSearchVO searchVO = new CommonCodeSearchVO();
        searchVO.setsCmmGrpCd(cmmGrpCd);
        searchVO.setsUseYn(useYn);
        searchVO.setsLangCd(langCd);

        return selectCommonCodesByCmmGrpCd(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="commonCodeCache")
    public List<CommonCodeVO> selectCommonCodesByCmmGrpCd(CommonCodeSearchVO searchVO) throws Exception {
        return commonCodeDAO.selectCommonCodesByCmmGrpCd(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @CacheEvict(value="commonCodeCache", allEntries=true)
    private int insertCommonCodeTxt(CommonCodeTxtVO codeVO) throws Exception {
        CommonCodeGroupTxtVO obj = selectCommonCodeTxtByKey(codeVO.getCmmGrpCd(), codeVO.getCmmCd(), codeVO.getLangCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return commonCodeDAO.insertCommonCodeTxt(codeVO);
    }

    /**
     * {@inheritDoc}
     */
    @CacheEvict(value="commonCodeCache", allEntries=true)
    private int updateCommonCodeTxt(CommonCodeTxtVO codeVO) throws Exception {
        return commonCodeDAO.updateCommonCodeTxt(codeVO);
    }

    /**
     * {@inheritDoc}
     */
    @CacheEvict(value="commonCodeCache", allEntries=true)
    private int deleteCommonCodeTxt(CommonCodeTxtVO codeVO) throws Exception {
        return commonCodeDAO.deleteCommonCodeTxt(codeVO);

    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="commonCodeCache", allEntries=true)
    public void multiCommonCodeTxts(CommonCodeTxtSaveVO obj) throws Exception {
        String userId = LoginUtil.getUserId();

        for(CommonCodeTxtVO codeVO : obj.getInsertList()){
            codeVO.setRegUsrId(userId);
            insertCommonCodeTxt(codeVO);
        }

        for(CommonCodeTxtVO codeVO : obj.getUpdateList()){
            codeVO.setUpdtUsrId(userId);
            updateCommonCodeTxt(codeVO);
        }

        for(CommonCodeTxtVO codeVO : obj.getDeleteList()){
            codeVO.setUpdtUsrId(userId);
            deleteCommonCodeTxt(codeVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    private CommonCodeGroupTxtVO selectCommonCodeTxtByKey(String cmmGrpCd, String cmmCd, String langCd) throws Exception {
        return commonCodeDAO.selectCommonCodeTxtByKey(cmmGrpCd, cmmCd, langCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectCommonCodeTxtsByConditionCnt(CommonCodeTxtSearchVO searchVO) throws Exception {
        return commonCodeDAO.selectCommonCodeTxtsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<CommonCodeTxtVO> selectCommonCodeTxtsByCondition(CommonCodeTxtSearchVO searchVO)  throws Exception  {
        return commonCodeDAO.selectCommonCodeTxtsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @CacheEvict(value="commonCodeCache", allEntries=true)
    public int updateRemarkByService(CommonCodeVO codeVO) throws Exception {
        return commonCodeDAO.updateRemarkByService(codeVO);
    }

    /**
     * {@inheritDoc}
     */
    @CacheEvict(value="commonCodeCache", allEntries=true)
    public int updateInitRemarkByService(CommonCodeVO codeVO) throws Exception {
        return commonCodeDAO.updateInitRemarkByService(codeVO);
    }

	@Override
	public List<PcaVo> selectProvinceList() throws Exception {
		return commonCodeDAO.selectProvinceList();
	}

	@Override
	public List<PcaVo> selectCityList() throws Exception {
		return commonCodeDAO.selectCityList();
	}

	@Override
	public List<PcaVo> selectAreaList() throws Exception {
		return commonCodeDAO.selectAreaList();
	}

	//修改支付方式是否使用（聚合支付）
	@Override
	public int updateUseYn(CommonCodeVO codeVO) throws Exception {
		// TODO Auto-generated method stub
		return commonCodeDAO.updateUseYn(codeVO);
	}
}
