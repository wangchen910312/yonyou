package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CountryService;
import chn.bhmc.dms.cmm.sci.service.dao.CountryDAO;
import chn.bhmc.dms.cmm.sci.vo.CountrySearchVO;
import chn.bhmc.dms.cmm.sci.vo.CountryVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 국가코드 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("countryService")
public class CountryServiceImpl extends HService implements CountryService {

    /**
     * 국가코드 관리 DAO
     */
	@Resource(name="countryDAO")
	CountryDAO countryDAO;

	/**
	 * {@inheritDoc}
	 */
    @Override
    public int insertCountry(CountryVO countryVO)  throws Exception {

        CountryVO obj = selectCountryByKey(countryVO.getCntryCd(), countryVO.getLangCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return countryDAO.insertCountry(countryVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateCountry(CountryVO countryVO)  throws Exception {
        return countryDAO.updateCountry(countryVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteCountry(CountryVO countryVO)  throws Exception {
        return countryDAO.deleteCountry(countryVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public CountryVO selectCountryByKey(String cntryCd, String langCd)  throws Exception {
        return countryDAO.selectCountryByKey(cntryCd, langCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiCountries(BaseSaveVO<CountryVO> obj)  throws Exception {

        String userId = LoginUtil.getUserId();

        for(CountryVO countryVO : obj.getInsertList()){
            countryVO.setRegUsrId(userId);
            insertCountry(countryVO);
        }

        for(CountryVO countryVO : obj.getUpdateList()){
            countryVO.setUpdtUsrId(userId);
            updateCountry(countryVO);
        }

        for(CountryVO countryVO : obj.getDeleteList()){
            deleteCountry(countryVO);
        }
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<CountryVO> selectCountriesByCondition(CountrySearchVO searchVO)  throws Exception {
        return countryDAO.selectCountriesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectCountriesByConditionCnt(CountrySearchVO searchVO)  throws Exception {
        return countryDAO.selectCountriesByConditionCnt(searchVO);
    }

}
