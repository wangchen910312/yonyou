package chn.bhmc.dms.crm.cif.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.dao.CustCouponInPackageInfoDAO;
import chn.bhmc.dms.crm.cif.service.dao.CustCouponInfoDAO;
import chn.bhmc.dms.crm.cif.service.dao.CustPackageInfoDAO;
import chn.bhmc.dms.crm.cif.service.dao.CustPublishInfoDAO;
import chn.bhmc.dms.crm.cif.vo.CustCouponInPackageInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustCouponInPackageInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustCouponInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustCouponInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustPackageInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustPackageInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustPublishInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustPublishInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cif.vo.PackageCustInfoVO;
import chn.bhmc.dms.crm.cif.vo.PackageVinInfoVO;
import chn.bhmc.dms.crm.cif.vo.VinCouponInfoVO;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoVO;

/**
 * 고객그룹관리 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kyo Jin Lee            최초 생성
 *
 */
@Service("customerCouponMgmtService")
public class CustomerCouponMgmtServiceImpl extends HService implements CustomerCouponMgmtService, JxlsSupport {
//public class CustomerCouponMgmtServiceImpl extends HService implements CustomerCouponMgmtService {

    /*
     * 고객정보관리
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /*
     * 쿠폰마스터
     */
    @Resource(name="custCouponInfoDAO")
    CustCouponInfoDAO custCouponInfoDAO;

    @Resource(name="vehOfCustInfoService")
    VehOfCustInfoService vehOfCustInfoService;

    /*
     * 패키지마스터
     */
    @Resource(name="custPackageInfoDAO")
    CustPackageInfoDAO custPackageInfoDAO;

    /*
     * 패키지마스터
     */
    @Resource(name="custCouponInPackageInfoDAO")
    CustCouponInPackageInfoDAO custCouponInPackageInfoDAO;

    /*
     * 발행
     */
    @Resource(name="custPublishInfoDAO")
    CustPublishInfoDAO custPublishInfoDAO;

    /**
     * 발행번호 생성 id gen
     */
    @Resource(name="publishNoIdgenService")
    TableIdGenService publishNoIdgenService;

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectCustCouponInfoByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustCouponInfoSearchVO)
     */
    @Override
    public int selectCustCouponInfoByConditionCnt(CustCouponInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return custCouponInfoDAO.selectCustCouponInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectCustCouponInfoByCondition(chn.bhmc.dms.crm.cif.vo.CustCouponInfoSearchVO)
     */
    @Override
    public List<CustCouponInfoVO> selectCustCouponInfoByCondition(CustCouponInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return custCouponInfoDAO.selectCustCouponInfoByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectCustCouponInfoByConditionByKey(chn.bhmc.dms.crm.cif.vo.CustCouponInfoSearchVO)
     */
    @Override
    public CustCouponInfoVO selectCustCouponInfoByConditionByKey(CustCouponInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return custCouponInfoDAO.selectCustCouponInfoByConditionByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#insertCustCoupon(chn.bhmc.dms.crm.cif.vo.CustCouponInfoVO)
     */
    @Override
    public int insertCustCoupon(CustCouponInfoVO custCouponInfoVO) throws Exception {
        try {

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(custCouponInfoVO.getDlrCd())){custCouponInfoVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(custCouponInfoVO.getRegUsrId())){custCouponInfoVO.setRegUsrId(LoginUtil.getUserId());}

            custCouponInfoDAO.insertCustCoupon(custCouponInfoVO);

            return custCouponInfoVO.getCupnSeq();

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#updateCustCoupon(chn.bhmc.dms.crm.cif.vo.CustCouponInfoVO)
     */
    @Override
    public int updateCustCoupon(CustCouponInfoVO custCouponInfoVO) throws Exception {
        try {

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(custCouponInfoVO.getDlrCd())){custCouponInfoVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(custCouponInfoVO.getRegUsrId())){custCouponInfoVO.setRegUsrId(LoginUtil.getUserId());}

            custCouponInfoDAO.updateCustCoupon(custCouponInfoVO);
            return custCouponInfoVO.getCupnSeq();

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#deleteCustCoupon(chn.bhmc.dms.crm.cif.vo.CustCouponInfoVO)
     */
    @Override
    public int deleteCustCoupon(CustCouponInfoVO custCouponInfoVO) throws Exception {
        try {

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(custCouponInfoVO.getDlrCd())){custCouponInfoVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(custCouponInfoVO.getRegUsrId())){custCouponInfoVO.setRegUsrId(LoginUtil.getUserId());}

            return custCouponInfoDAO.deleteCustCoupon(custCouponInfoVO);

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectCustCouponPackageInfoByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustPackageInfoSearchVO)
     */
    @Override
    public int selectCustCouponPackageInfoByConditionCnt(CustPackageInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return custPackageInfoDAO.selectCustCouponPackageInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectCustCouponPackageInfoByCondition(chn.bhmc.dms.crm.cif.vo.CustPackageInfoSearchVO)
     */
    @Override
    public List<CustPackageInfoVO> selectCustCouponPackageInfoByCondition(CustPackageInfoSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return custPackageInfoDAO.selectCustCouponPackageInfoByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectCustCouponPackageInfoByConditionByKey(chn.bhmc.dms.crm.cif.vo.CustPackageInfoSearchVO)
     */
    @Override
    public CustPackageInfoVO selectCustCouponPackageInfoByConditionByKey(CustPackageInfoSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return custPackageInfoDAO.selectCustCouponPackageInfoByConditionByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#insertCustPackage(chn.bhmc.dms.crm.cif.vo.CustPackageInfoVO)
     */
    @Override
    public int insertCustPackage(CustPackageInfoVO custPackageInfoVO) throws Exception {
        try {

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(custPackageInfoVO.getDlrCd())){custPackageInfoVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(custPackageInfoVO.getRegUsrId())){custPackageInfoVO.setRegUsrId(LoginUtil.getUserId());}

            custPackageInfoDAO.insertCustPackage(custPackageInfoVO);

            return custPackageInfoVO.getPkgSeq();

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#updateCustPackage(chn.bhmc.dms.crm.cif.vo.CustPackageInfoVO)
     */
    @Override
    public int updateCustPackage(CustPackageInfoVO custPackageInfoVO) throws Exception {
        try {

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(custPackageInfoVO.getDlrCd())){custPackageInfoVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(custPackageInfoVO.getRegUsrId())){custPackageInfoVO.setRegUsrId(LoginUtil.getUserId());}

            return custPackageInfoDAO.updateCustPackage(custPackageInfoVO);

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#deleteCustPackage(chn.bhmc.dms.crm.cif.vo.CustPackageInfoVO)
     */
    @Override
    public int deleteCustPackage(CustPackageInfoVO custPackageInfoVO) throws Exception {
        try {

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(custPackageInfoVO.getDlrCd())){custPackageInfoVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(custPackageInfoVO.getRegUsrId())){custPackageInfoVO.setRegUsrId(LoginUtil.getUserId());}

            return custPackageInfoDAO.deleteCustPackage(custPackageInfoVO);

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#multiDBMessageSources(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCustPackage(BaseSaveVO<CustPackageInfoVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();

        for(CustPackageInfoVO custPackageInfoVO : obj.getInsertList()){
            custPackageInfoVO.setRegUsrId(userId);
            insertCustPackage(custPackageInfoVO);
        }

        for(CustPackageInfoVO custPackageInfoVO : obj.getUpdateList()){
            custPackageInfoVO.setUpdtUsrId(userId);
            updateCustPackage(custPackageInfoVO);
        }

        for(CustPackageInfoVO custPackageInfoVO : obj.getDeleteList()){
            deleteCustPackage(custPackageInfoVO);
        }

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectCouponInPackageInfoByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustCouponInPackageInfoSearchVO)
     */
    @Override
    public int selectCouponInPackageInfoByConditionCnt(CustCouponInPackageInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return custCouponInPackageInfoDAO.selectCouponInPackageInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectCouponInPackageInfoByCondition(chn.bhmc.dms.crm.cif.vo.CustCouponInPackageInfoSearchVO)
     */
    @Override
    public List<CustCouponInPackageInfoVO> selectCouponInPackageInfoByCondition(CustCouponInPackageInfoSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return custCouponInPackageInfoDAO.selectCouponInPackageInfoByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectCouponInPackageInfoByConditionByKey(chn.bhmc.dms.crm.cif.vo.CustCouponInPackageInfoSearchVO)
     */
    @Override
    public CustCouponInPackageInfoVO selectCouponInPackageInfoByConditionByKey(CustCouponInPackageInfoSearchVO searchVO)
            throws Exception {
        return custCouponInPackageInfoDAO.selectCouponInPackageInfoByConditionByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#insertCouponInPackage(chn.bhmc.dms.crm.cif.vo.CustCouponInPackageInfoVO)
     */
    @Override
    public int insertCouponInPackage(CustCouponInPackageInfoVO custCouponInPackageInfoVO)
            throws Exception {
        if (StringUtils.isEmpty(custCouponInPackageInfoVO.getDlrCd())){custCouponInPackageInfoVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(custCouponInPackageInfoVO.getRegUsrId())){custCouponInPackageInfoVO.setRegUsrId(LoginUtil.getUserId());}

        return custCouponInPackageInfoDAO.insertCouponInPackage(custCouponInPackageInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#updateCouponInPackage(chn.bhmc.dms.crm.cif.vo.CustCouponInPackageInfoVO)
     */
    @Override
    public int updateCouponInPackage(CustCouponInPackageInfoVO custCouponInPackageInfoVO) throws Exception {
        if (StringUtils.isEmpty(custCouponInPackageInfoVO.getDlrCd())){custCouponInPackageInfoVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(custCouponInPackageInfoVO.getUpdtUsrId())){custCouponInPackageInfoVO.setUpdtUsrId(LoginUtil.getUserId());}
        return custCouponInPackageInfoDAO.updateCouponInPackage(custCouponInPackageInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#deleteCouponInPackage(chn.bhmc.dms.crm.cif.vo.CustCouponInPackageInfoVO)
     */
    @Override
    public int deleteCouponInPackage(CustCouponInPackageInfoVO custCouponInPackageInfoVO) throws Exception {
        if (StringUtils.isEmpty(custCouponInPackageInfoVO.getDlrCd())){custCouponInPackageInfoVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(custCouponInPackageInfoVO.getUpdtUsrId())){custCouponInPackageInfoVO.setUpdtUsrId(LoginUtil.getUserId());}
        return custCouponInPackageInfoDAO.deleteCouponInPackage(custCouponInPackageInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectNextPubliNo()
     */
    @Override
    public String selectNextPubliNo(CustPublishInfoVO custPublishInfoVO) throws Exception {
        synchronized (publishNoIdgenService) {
            ((PublishNoIdGenStrategy)publishNoIdgenService.getStrategy()).setDlrCd(LoginUtil.getDlrCd());
            ((PublishNoIdGenStrategy)publishNoIdgenService.getStrategy()).setDcCd(custPublishInfoVO.getDcCd());
            ((PublishNoIdGenStrategy)publishNoIdgenService.getStrategy()).setDcUseTp(custPublishInfoVO.getDcUseTp());
            ((PublishNoTableNameStrategy)publishNoIdgenService.getTableNameStrategy()).setDlrCd(LoginUtil.getDlrCd());
            ((PublishNoTableNameStrategy)publishNoIdgenService.getTableNameStrategy()).setDcCd(custPublishInfoVO.getDcCd());
            ((PublishNoTableNameStrategy)publishNoIdgenService.getTableNameStrategy()).setDcUseTp(custPublishInfoVO.getDcUseTp());
        }
        return publishNoIdgenService.getNextStringId();
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectCustCouponPublishInfoByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustPublishInfoSearchVO)
     */
    @Override
    public int selectCustCouponPublishInfoByConditionCnt(CustPublishInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return custPublishInfoDAO.selectCustCouponPublishInfoByConditionCnt(searchVO);

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectCustCouponPublishInfoByCondition(chn.bhmc.dms.crm.cif.vo.CustPublishInfoSearchVO)
     */
    @Override
    public List<CustPublishInfoVO> selectCustCouponPublishInfoByCondition(CustPublishInfoSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return custPublishInfoDAO.selectCustCouponPublishInfoByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectCustCouponPublishInfoByConditionByKey(chn.bhmc.dms.crm.cif.vo.CustPublishInfoSearchVO)
     */
    @Override
    public CustPublishInfoVO selectCustCouponPublishInfoByConditionByKey(CustPublishInfoSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return custPublishInfoDAO.selectCustCouponPublishInfoByConditionByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#insertCustCouponPublish(chn.bhmc.dms.crm.cif.vo.CustPublishInfoVO)
     */
    @Override
    public int insertCustCouponPublish(CustPublishInfoVO custPublishInfoVO) throws Exception {
        if (StringUtils.isEmpty(custPublishInfoVO.getDlrCd())){custPublishInfoVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(custPublishInfoVO.getRegUsrId())){custPublishInfoVO.setRegUsrId(LoginUtil.getUserId());}

        custPublishInfoVO.setDcCd(custPublishInfoVO.getDcCd());
        custPublishInfoVO.setDcUseTp(custPublishInfoVO.getDcUseTp());

        String publishNo = custPublishInfoVO.getPubliNo();
        if(StringUtils.isEmpty(publishNo)) {
            publishNo = selectNextPubliNo(custPublishInfoVO);
        }

        if (StringUtils.isEmpty(publishNo)) {
            throw processException("global.err.updateFailedParam", new String[]{messageSource.getMessage("crm.lbl.publishNo", null, LocaleContextHolder.getLocale())});
        }

        // 중복 체크
        CustPublishInfoSearchVO custPublishInfoSearchVO = new CustPublishInfoSearchVO();
        custPublishInfoSearchVO.setsPubliNo(publishNo);
        int publishNoCnt = selectCustCouponPublishInfoByConditionCnt(custPublishInfoSearchVO);

        if (publishNoCnt > 0) {
            throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("crm.lbl.publishNo", null, LocaleContextHolder.getLocale())});
        }

        custPublishInfoVO.setPubliNo(publishNo);

        return custPublishInfoDAO.insertCustCouponPublish(custPublishInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#updateCustCouponPublish(chn.bhmc.dms.crm.cif.vo.CustPublishInfoVO)
     */
    @Override
    public int updateCustCouponPublish(CustPublishInfoVO custPublishInfoVO) throws Exception {
        if (StringUtils.isEmpty(custPublishInfoVO.getDlrCd())){custPublishInfoVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(custPublishInfoVO.getUpdtUsrId())){custPublishInfoVO.setUpdtUsrId(LoginUtil.getUserId());}
        if (StringUtils.isEmpty(custPublishInfoVO.getPubliNo())) {
            throw processException("crm.info.noinfoData", new String[]{messageSource.getMessage("crm.lbl.publishNo", null, LocaleContextHolder.getLocale())});
        }
        return custPublishInfoDAO.updateCustCouponPublish(custPublishInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#deleteCustCouponPublish(chn.bhmc.dms.crm.cif.vo.CustPublishInfoVO)
     */
    @Override
    public int deleteCustCouponPublish(CustPublishInfoVO custPublishInfoVO) throws Exception {
        if (StringUtils.isEmpty(custPublishInfoVO.getDlrCd())){custPublishInfoVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(custPublishInfoVO.getPubliNo())) {
            throw processException("crm.info.noinfoData", new String[]{messageSource.getMessage("crm.lbl.publishNo", null, LocaleContextHolder.getLocale())});
        }
        return custPublishInfoDAO.deleteCustCouponPublish(custPublishInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#multiDBMessageSources(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCustCouponPublish(BaseSaveVO<CustPublishInfoVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();

        for(CustPublishInfoVO custPublishInfoVO : obj.getInsertList()){
            custPublishInfoVO.setRegUsrId(userId);
            insertCustCouponPublish(custPublishInfoVO);
        }

        for(CustPublishInfoVO custPublishInfoVO : obj.getUpdateList()){
            custPublishInfoVO.setUpdtUsrId(userId);
            updateCustCouponPublish(custPublishInfoVO);
        }

        for(CustPublishInfoVO custPublishInfoVO : obj.getDeleteList()){
            deleteCustCouponPublish(custPublishInfoVO);
        }

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#multiCouponInPackage(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCouponInPackage(BaseSaveVO<CustCouponInPackageInfoVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();

        for(CustCouponInPackageInfoVO custCouponInPackageInfoVO : obj.getInsertList()){
            custCouponInPackageInfoVO.setRegUsrId(userId);
            insertCouponInPackage(custCouponInPackageInfoVO);
        }

        for(CustCouponInPackageInfoVO custCouponInPackageInfoVO : obj.getUpdateList()){
            custCouponInPackageInfoVO.setUpdtUsrId(userId);
            updateCouponInPackage(custCouponInPackageInfoVO);
        }

        for(CustCouponInPackageInfoVO custCouponInPackageInfoVO : obj.getDeleteList()){
            deleteCouponInPackage(custCouponInPackageInfoVO);
        }

    }


    /*
     *
     */
    @Override
    public List<CustCouponInfoVO> selectCouponCustomerInfoChkByExcelImp(List<CustCouponInfoVO> list)throws Exception {
        int i = 0;

        List<ExcelUploadError> errors = null;
        CustomerInfoSearchVO customerInfoSearchVO = null;
        List<CustCouponInfoVO> list2 = new ArrayList<CustCouponInfoVO>();

        for(CustCouponInfoVO custCouponInfoVO : list) {

            if (!(StringUtil.nullConvert(custCouponInfoVO.getCustNo())).equals("")){

                customerInfoSearchVO = new CustomerInfoSearchVO();
                errors = new ArrayList<ExcelUploadError>();
                if(custCouponInfoVO.getCustNo().length()==17){
                customerInfoSearchVO.setsCustNo(custCouponInfoVO.getCustNo());
                i = customerInfoOutBoundService.selectCustomerInfoByConditionCnt(customerInfoSearchVO);

                if (i != 0) {
                    List<CustomerInfoVO> custInfoList = customerInfoOutBoundService.selectCustomerListByCondition(customerInfoSearchVO);

                    custCouponInfoVO.setDlrCd(custInfoList.get(0).getDlrCd());
                    custCouponInfoVO.setCustNm(custInfoList.get(0).getCustNm());


                    if (StringUtils.isEmpty(custInfoList.get(0).getDlrMbrYn())) {
                        custCouponInfoVO.setMembershipYn("N");
                    } else {
                        custCouponInfoVO.setMembershipYn("Y");
                    }
                    if (StringUtils.isEmpty(custInfoList.get(0).getBlueMembershipNo())) {
                        custCouponInfoVO.setBlueMembershipYn("N");
                    } else {
                        custCouponInfoVO.setBlueMembershipYn("Y");
                    }
                    list2.add(custCouponInfoVO);
                } else {
                    errors.add(new ExcelUploadError(
                            messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA))
                    );
                    custCouponInfoVO.setErrors(errors);
                    list2.add(custCouponInfoVO);
                }
                }else {
                    errors.add(new ExcelUploadError(
                            messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA))
                    );
                    custCouponInfoVO.setErrors(errors);
                    list2.add(custCouponInfoVO);
                }
                custCouponInfoVO.setErrorCount(custCouponInfoVO.getErrors().size());
            }
        }
        return list2;
    }


    /*
     *
     */
    @Override
    public List<VinCouponInfoVO> selectCouponVinInfoChkByExcelImp(List<VinCouponInfoVO> list)throws Exception {
        int i = 0;

        List<ExcelUploadError> errors = null;
        VehOfCustInfoSearchVO vehOfCustInfoSearchVO = null;
        List<VinCouponInfoVO> list2 = new ArrayList<VinCouponInfoVO>();
        CustomerInfoSearchVO customerInfoSearchVO = null;
        for(VinCouponInfoVO vinCouponInfoVO : list) {

            //if (!(StringUtil.nullConvert(vinCouponInfoVO.getVinNo())).equals("")){
            if (StringUtils.isNotEmpty(vinCouponInfoVO.getVinNo()) ) {
                customerInfoSearchVO = new CustomerInfoSearchVO();
                vehOfCustInfoSearchVO = new VehOfCustInfoSearchVO ();
                errors = new ArrayList<ExcelUploadError>();

                if(vinCouponInfoVO.getVinNo().length()==17){

                    vehOfCustInfoSearchVO.setsVinNo(vinCouponInfoVO.getVinNo());

                    i = vehOfCustInfoService.selectVehInfoByConditionCnt(vehOfCustInfoSearchVO);

                    if (i != 0) {
                        List<VehOfCustInfoVO> vinInfoList = vehOfCustInfoService.selectVehOfCustInfoByCondition(vehOfCustInfoSearchVO );
                        vinCouponInfoVO.setDlrCd(vinInfoList.get(0).getDlrCd());

//                        if ( StringUtils.isEmpty(vinInfoList.get(0).getCustNo()) ) {
//
//                            errors.add(new ExcelUploadError(
//                                    messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA))
//                            );
//                            vinCouponInfoVO.setErrors(errors);
//                            list2.add(vinCouponInfoVO);
//
//                        } else {

                        if ( StringUtils.isNotEmpty(vinInfoList.get(0).getCustNo()) ) {
                            customerInfoSearchVO.setsCustNo(vinInfoList.get(0).getCustNo());

                            List<CustomerInfoVO> custInfoList = customerInfoOutBoundService.selectCustomerListByCondition(customerInfoSearchVO);
                            vinCouponInfoVO.setCustNm(custInfoList.get(0).getCustNm());

                            if (StringUtils.isEmpty(custInfoList.get(0).getDlrMbrYn())) {
                                vinCouponInfoVO.setMembershipYn("N");
                            } else {
                                vinCouponInfoVO.setMembershipYn("Y");
                            }
                            if (StringUtils.isEmpty(custInfoList.get(0).getBlueMembershipNo())) {
                                vinCouponInfoVO.setBlueMembershipYn("N");
                            } else {
                                vinCouponInfoVO.setBlueMembershipYn("Y");
                            }
                            list2.add(vinCouponInfoVO);

                        };

                    } else {
                        errors.add(new ExcelUploadError(
                                messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.vinNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA))
                        );
                        vinCouponInfoVO.setErrors(errors);
                        list2.add(vinCouponInfoVO);
                    }
                }else {
                    errors.add(new ExcelUploadError(
                            messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA))
                    );
                    vinCouponInfoVO.setErrors(errors);
                    list2.add(vinCouponInfoVO);
                }
                vinCouponInfoVO.setErrorCount(vinCouponInfoVO.getErrors().size());
            }
        }
        return list2;
    }


    /*
     *
     */
    @Override
    public List<PackageCustInfoVO> selectPackageCustomerInfoChkByExcelImp(List<PackageCustInfoVO> list)throws Exception {
        int i = 0;

        List<ExcelUploadError> errors = null;
        CustomerInfoSearchVO customerInfoSearchVO = null;
        List<PackageCustInfoVO> list2 = new ArrayList<PackageCustInfoVO>();

        for(PackageCustInfoVO packageCustInfoVO : list) {

            if (!(StringUtil.nullConvert(packageCustInfoVO.getCustNo())).equals("")){

                customerInfoSearchVO = new CustomerInfoSearchVO();
                errors = new ArrayList<ExcelUploadError>();
                if(packageCustInfoVO.getCustNo().length()==17){
                    customerInfoSearchVO.setsCustNo(packageCustInfoVO.getCustNo());
                    i = customerInfoOutBoundService.selectCustomerInfoByConditionCnt(customerInfoSearchVO);

                    if (i != 0) {
                        List<CustomerInfoVO> custInfoList = customerInfoOutBoundService.selectCustomerListByCondition(customerInfoSearchVO);

                        packageCustInfoVO.setDlrCd(custInfoList.get(0).getDlrCd());
                        packageCustInfoVO.setCustNm(custInfoList.get(0).getCustNm());


                        if (StringUtils.isEmpty(custInfoList.get(0).getDlrMbrYn())) {
                            packageCustInfoVO.setMembershipYn("N");
                        } else {
                            packageCustInfoVO.setMembershipYn("Y");
                        }
                        if (StringUtils.isEmpty(custInfoList.get(0).getBlueMembershipNo())) {
                            packageCustInfoVO.setBlueMembershipYn("N");
                        } else {
                            packageCustInfoVO.setBlueMembershipYn("Y");
                        }
                        list2.add(packageCustInfoVO);
                    } else {
                        errors.add(new ExcelUploadError(
                                messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA))
                        );
                        packageCustInfoVO.setErrors(errors);
                        list2.add(packageCustInfoVO);
                    }
                }else {
                    errors.add(new ExcelUploadError(
                            messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA))
                    );
                    packageCustInfoVO.setErrors(errors);
                    list2.add(packageCustInfoVO);
                }
                packageCustInfoVO.setErrorCount(packageCustInfoVO.getErrors().size());
            }
        }
        return list2;
    }


    /*
     *
     */
    @Override
    public List<PackageVinInfoVO> selectPackageVinInfoChkByExcelImp(List<PackageVinInfoVO> list)throws Exception {
        int i = 0;

        List<ExcelUploadError> errors = null;
        CustomerInfoSearchVO customerInfoSearchVO = null;
        VehOfCustInfoSearchVO vehOfCustInfoSearchVO = null;
        List<PackageVinInfoVO> list2 = new ArrayList<PackageVinInfoVO>();

        for(PackageVinInfoVO packageVinInfoVO : list) {

            if (StringUtils.isNotEmpty(packageVinInfoVO.getVinNo()) ) {

                customerInfoSearchVO = new CustomerInfoSearchVO();
                vehOfCustInfoSearchVO = new VehOfCustInfoSearchVO ();
                errors = new ArrayList<ExcelUploadError>();

                if(packageVinInfoVO.getVinNo().length()==17){

                    vehOfCustInfoSearchVO.setsVinNo(packageVinInfoVO.getVinNo());
                    i = vehOfCustInfoService.selectVehInfoByConditionCnt(vehOfCustInfoSearchVO);


                    if (i != 0) {
                        List<VehOfCustInfoVO> vinInfoList = vehOfCustInfoService.selectVehOfCustInfoByCondition(vehOfCustInfoSearchVO );
                        packageVinInfoVO.setDlrCd(vinInfoList.get(0).getDlrCd());

                        if (StringUtils.isNotEmpty(vinInfoList.get(0).getCustNo())) {
                            packageVinInfoVO.setCustNo(vinInfoList.get(0).getCustNo());
                            customerInfoSearchVO.setsCustNo(vinInfoList.get(0).getCustNo());

                            List<CustomerInfoVO> custInfoList = customerInfoOutBoundService.selectCustomerListByCondition(customerInfoSearchVO);
                            if (custInfoList.size() > 0) {
                                packageVinInfoVO.setCustNm(custInfoList.get(0).getCustNm());

                                if (StringUtils.isEmpty(custInfoList.get(0).getDlrMbrYn())) {
                                    packageVinInfoVO.setMembershipYn("N");
                                } else {
                                    packageVinInfoVO.setMembershipYn("Y");
                                }
                                if (StringUtils.isEmpty(custInfoList.get(0).getBlueMembershipNo())) {
                                    packageVinInfoVO.setBlueMembershipYn("N");
                                } else {
                                    packageVinInfoVO.setBlueMembershipYn("Y");
                                }
                            }
                        }

                        list2.add(packageVinInfoVO);
                    } else {
                        errors.add(new ExcelUploadError(
                                messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA))
                        );
                        packageVinInfoVO.setErrors(errors);
                        list2.add(packageVinInfoVO);
                    }
                }else {
                    errors.add(new ExcelUploadError(
                            messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA))
                    );
                    packageVinInfoVO.setErrors(errors);
                    list2.add(packageVinInfoVO);
                }
                packageVinInfoVO.setErrorCount(packageVinInfoVO.getErrors().size());

            }
        }
        return list2;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        CustCouponInfoSearchVO searchVO = new CustCouponInfoSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<CustCouponInfoVO> list = selectCustCouponInfoByCondition(searchVO);

        context.putVar("items", list);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectCouponCustConfigByConditionCnt(chn.bhmc.dms.crm.cif.vo.CustPublishInfoSearchVO)
     */
    @Override
    public int selectCouponCustConfigByConditionCnt(CustPublishInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        if ( StringUtils.isEmpty(searchVO.getsCustNo()) && StringUtils.isEmpty(searchVO.getsVinNo()) ) {
            throw processException("global.info.inputOneParam", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale()) , messageSource.getMessage("crm.lbl.vinNo", null, LocaleContextHolder.getLocale()) } );
        }

        return custPublishInfoDAO.selectCouponCustConfigByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService#selectCouponCustConfigByCondition(chn.bhmc.dms.crm.cif.vo.CustPublishInfoSearchVO)
     */
    @Override
    public List<CustPublishInfoVO> selectCouponCustConfigByCondition(CustPublishInfoSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        if ( StringUtils.isEmpty(searchVO.getsCustNo()) && StringUtils.isEmpty(searchVO.getsVinNo()) ) {
            throw processException("global.info.inputOneParam", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale()) , messageSource.getMessage("crm.lbl.vinNo", null, LocaleContextHolder.getLocale()) } );
        }

        return custPublishInfoDAO.selectCouponCustConfigByCondition(searchVO);
    }

}
