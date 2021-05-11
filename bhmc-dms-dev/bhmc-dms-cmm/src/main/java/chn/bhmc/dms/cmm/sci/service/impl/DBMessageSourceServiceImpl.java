package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.DBMessageSourceService;
import chn.bhmc.dms.cmm.sci.service.dao.DBMessageSourceDAO;
import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceSearchVO;
import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;

/**
 * 메세지소스 관리 서비스 구현 클래스
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

@Service("dbMessageSourceService")
public class DBMessageSourceServiceImpl extends HService implements DBMessageSourceService, JxlsSupport {

    /**
     * 메세지소스 관리 DAO
     */
	@Resource(name="dbMessageSourceDAO")
	DBMessageSourceDAO dbMessageSourceDAO;
	
	/**
	 * 메세지소스 
	 */
	@Resource(name="dataSourceMessageSource")
	ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

	/**
	 * {@inheritDoc}
	 */
    @Override
    public int insertDBMessageSource(DBMessageSourceVO dbMessageSourceVO) throws Exception {
        DBMessageSourceVO obj = selectDBMessageSourceByKey(dbMessageSourceVO.getLangCd(), dbMessageSourceVO.getCntryCd(), dbMessageSourceVO.getMesgKey());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        dataSourceMessageSource.clearCache();

        return dbMessageSourceDAO.insertDBMessageSource(dbMessageSourceVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateDBMessageSource(DBMessageSourceVO dbMessageSourceVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return dbMessageSourceDAO.updateDBMessageSource(dbMessageSourceVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteDBMessageSource(DBMessageSourceVO dbMessageSourceVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return dbMessageSourceDAO.deleteDBMessageSource(dbMessageSourceVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public DBMessageSourceVO selectDBMessageSourceByKey(String langCd, String cntryCd, String mesgKey) throws Exception {
        return dbMessageSourceDAO.selectDBMessageSourceByKey(langCd, cntryCd, mesgKey);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiDBMessageSources(BaseSaveVO<DBMessageSourceVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(DBMessageSourceVO dbMessageSourceVO : obj.getInsertList()){
            dbMessageSourceVO.setRegUsrId(userId);
            insertDBMessageSource(dbMessageSourceVO);
        }

        for(DBMessageSourceVO dbMessageSourceVO : obj.getUpdateList()){
            dbMessageSourceVO.setUpdtUsrId(userId);
            updateDBMessageSource(dbMessageSourceVO);
        }

        for(DBMessageSourceVO dbMessageSourceVO : obj.getDeleteList()){
            deleteDBMessageSource(dbMessageSourceVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void insertDBMessageSourceBatchUpload(List<DBMessageSourceVO> list) throws Exception {

        String userId = LoginUtil.getUserId();

        for(DBMessageSourceVO dbMessageSourceVO : list){
            dbMessageSourceVO.setRegUsrId(userId);

            DBMessageSourceVO obj = selectDBMessageSourceByKey(dbMessageSourceVO.getLangCd(), dbMessageSourceVO.getCntryCd(), dbMessageSourceVO.getMesgKey());

            if(obj == null) {
                insertDBMessageSource(dbMessageSourceVO);
            }else{
                dbMessageSourceVO.setMesgSeq(obj.getMesgSeq());
                updateDBMessageSource(dbMessageSourceVO);
            }
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<DBMessageSourceVO> selectDBMessageSourcesByCondition(DBMessageSourceSearchVO searchVO) throws Exception {
        return dbMessageSourceDAO.selectDBMessageSourcesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectDBMessageSourcesByConditionCnt(DBMessageSourceSearchVO searchVO) throws Exception {
        return dbMessageSourceDAO.selectDBMessageSourcesByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        DBMessageSourceSearchVO searchVO = new DBMessageSourceSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        
        searchVO.setsMesgKey(searchVO.getsMesgKey().replaceAll("&#42;", "*"));
        searchVO.setsMesgTxt(searchVO.getsMesgTxt().replaceAll("&#42;", "*"));

        List<DBMessageSourceVO> list = selectDBMessageSourcesByCondition(searchVO);
        context.putVar("items", list);
    }
}
