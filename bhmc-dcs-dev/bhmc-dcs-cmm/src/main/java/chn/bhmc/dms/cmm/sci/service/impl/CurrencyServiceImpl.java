package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CurrencyService;
import chn.bhmc.dms.cmm.sci.service.dao.CurrencyDAO;
import chn.bhmc.dms.cmm.sci.vo.CurrencySaveVO;
import chn.bhmc.dms.cmm.sci.vo.CurrencySearchVO;
import chn.bhmc.dms.cmm.sci.vo.CurrencyVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 통화코드 관리 서비스 구현 클래스
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

@Service("currencyService")
public class CurrencyServiceImpl extends HService implements CurrencyService {

    /**
     * 통화코드 관리 DAO
     */
	@Resource(name="currencyDAO")
	CurrencyDAO currencyDAO;

	/**
	 * {@inheritDoc}
	 */
    @Override
    @CacheEvict(value="currencyCache", allEntries=true)
    public int insertCurrency(CurrencyVO countryVO)  throws Exception {
        return currencyDAO.insertCurrency(countryVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="currencyCache", allEntries=true)
    public int updateCurrency(CurrencyVO countryVO)  throws Exception {
        return currencyDAO.updateCurrency(countryVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="currencyCache", allEntries=true)
    public int deleteCurrency(CurrencyVO countryVO)  throws Exception {
        return currencyDAO.deleteCurrency(countryVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="currencyCache", allEntries=true)
    public void multiCurrencies(CurrencySaveVO obj)  throws Exception {

        String usrId = LoginUtil.getUserId();

        for(CurrencyVO countryVO : obj.getInsertList()){
            countryVO.setRegUsrId(usrId);
            currencyDAO.insertCurrency(countryVO);
        }

        for(CurrencyVO countryVO : obj.getUpdateList()){
            countryVO.setUpdtUsrId(usrId);
            currencyDAO.updateCurrency(countryVO);
        }

        for(CurrencyVO countryVO : obj.getDeleteList()){
            currencyDAO.deleteCurrency(countryVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="currencyCache")
    public CurrencyVO selectCurrencyByKey(String currencyCd)  throws Exception {
        return currencyDAO.selectCurrencyByKey(currencyCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="currencyCache")
    public List<CurrencyVO> selectCurrenciesByCondition(CurrencySearchVO searchVO)  throws Exception {
        return currencyDAO.selectCurrenciesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectCurrenciesByConditionCnt(CurrencySearchVO searchVO)  throws Exception {
        return currencyDAO.selectCurrenciesByConditionCnt(searchVO);
    }
}
