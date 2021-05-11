package chn.bhmc.dms.mis.tmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mis.tmp.service.TargetReferSameBsnsService;
import chn.bhmc.dms.mis.tmp.service.dao.TargetReferSameBsnsDAO;
import chn.bhmc.dms.mis.tmp.vo.TargetReferSameBsnsSearchVO;
import chn.bhmc.dms.mis.tmp.vo.TargetReferSameBsnsVO;

/**
 * <pre>
 * [제조사] 동종업계 참조
 * </pre>
 *
 * @ClassName   : TargetReferSameBsnsServiceImpl.java
 * @Description : [제조사] 동종업계 참조
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */
@Service("targetReferSameBsnsService")
public class TargetReferSameBsnsServiceImpl  extends HService implements TargetReferSameBsnsService, JxlsSupport {

    /**
     * [제조사] 동종업계 참조 DAO
     */
    @Resource(name="targetReferSameBsnsDAO")
    TargetReferSameBsnsDAO targetReferSameBsnsDAO;

    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 정보를 조회한다.
     */
    @Override
    public List<TargetReferSameBsnsVO> selectTargetReferSameBsnsMainSearch(TargetReferSameBsnsSearchVO searchVO) throws Exception {
        return targetReferSameBsnsDAO.selectTargetReferSameBsnsMainSearch(searchVO);
    }

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 총 갯수를 조회한다.
     */
    @Override
    public int selectTargetReferSameBsnsMainSearchCnt(TargetReferSameBsnsSearchVO searchVO) throws Exception {
        return targetReferSameBsnsDAO.selectTargetReferSameBsnsMainSearchCnt(searchVO);
    }

    /**
     * Key에 해당하는 [제조사] 동종업계 참조 정보를 조회한다.
     * @param referDt - [제조사] 동종업계 참조 년월일
     * @return 조회한 [제조사] 동종업계 참조 정보
     */
    @Override
    public TargetReferSameBsnsVO selectReferSameBsnsByKey(String referDt) throws Exception {
        return targetReferSameBsnsDAO.selectReferSameBsnsByKey(referDt);
    }

    /**
     * [제조사] 동종업계 참조 목록 정보를 등록/수정/삭제한다.
     */
    @Override
    public void targetReferSameBsnsSave(BaseSaveVO<TargetReferSameBsnsVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(TargetReferSameBsnsVO targetReferSameBsnsVO : obj.getInsertList()){
            targetReferSameBsnsVO.setRegUsrId(userId);
            insertReferSameBsns(targetReferSameBsnsVO);
        }

        for(TargetReferSameBsnsVO targetReferSameBsnsVO : obj.getUpdateList()){
            targetReferSameBsnsVO.setUpdtUsrId(userId);
            updateReferSameBsns(targetReferSameBsnsVO);
        }

        for(TargetReferSameBsnsVO targetReferSameBsnsVO : obj.getDeleteList()){
            deleteReferSameBsns(targetReferSameBsnsVO);
        }
    }

    /**
     * [제조사] 동종업계 참조 목록 정보를 등록한다.
     */
    @Override
    public int insertReferSameBsns(TargetReferSameBsnsVO targetReferSameBsnsVO) throws Exception {

        TargetReferSameBsnsVO obj = selectReferSameBsnsByKey(targetReferSameBsnsVO.getReferDt());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        dataSourceMessageSource.clearCache();

        return targetReferSameBsnsDAO.insertReferSameBsns(targetReferSameBsnsVO);
    }

    /**
     * [제조사] 동종업계 참조 목록 정보를 수정한다.
     */
    @Override
    public int updateReferSameBsns(TargetReferSameBsnsVO targetReferSameBsnsVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();

        String updtUsrId = userId;

        targetReferSameBsnsVO.setDlrCd(dlrCd);
        targetReferSameBsnsVO.setUpdtUsrId(updtUsrId);

        dataSourceMessageSource.clearCache();
        return targetReferSameBsnsDAO.updateReferSameBsns(targetReferSameBsnsVO);
    }

    /**
     * [제조사] 동종업계 참조 목록 정보를 삭제한다.
     */
    @Override
    public int deleteReferSameBsns(TargetReferSameBsnsVO targetReferSameBsnsVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return targetReferSameBsnsDAO.deleteReferSameBsns(targetReferSameBsnsVO);
    }

    /*
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 정보를 조회한다.
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        TargetReferSameBsnsSearchVO searchVO = new TargetReferSameBsnsSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<TargetReferSameBsnsVO> list = selectTargetReferSameBsnsMainSearch(searchVO);
        context.putVar("items", list);
    }
}
