package chn.bhmc.dms.crm.cmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.crm.cmm.service.RegularExpressionService;
import chn.bhmc.dms.crm.cmm.service.dao.RegularExpressionDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RegularExpressionServiceImpl
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 2. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 25.     Kyo Jin Lee     최초 생성
 * </pre>
 */
@Service("regularExpressionService")
public class RegularExpressionServiceImpl extends HService implements RegularExpressionService {

    /**
     * DAO
     */
    @Resource(name="regularExpressionDAO")
    RegularExpressionDAO regularExpressionDAO;

    /*
     * @see chn.bhmc.dms.crm.cmm.service.RegularExpressionService#selectRegularExpressionByHpNo(java.lang.String)
     */
    @Override
    public String selectRegularExpressionByHpNo(String hpNo) throws Exception {
        return regularExpressionDAO.selectRegularExpressionByHpNo(hpNo);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.RegularExpressionService#selectRegularExpressionByEmail(java.lang.String)
     */
    @Override
    public String selectRegularExpressionByEmail(String email) throws Exception {
        return regularExpressionDAO.selectRegularExpressionByEmail(email);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.RegularExpressionService#selectRegularExpressionByTelNo(java.lang.String)
     */
    @Override
    public String selectRegularExpressionByTelNo(String telNo) throws Exception {
        return regularExpressionDAO.selectRegularExpressionByTelNo(telNo);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.RegularExpressionService#selectRegularExpressionByCorpNo(java.lang.String)
     */
    @Override
    public String selectRegularExpressionByCorpNo(String corpNo) throws Exception {
        return regularExpressionDAO.selectRegularExpressionByCorpNo(corpNo);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.RegularExpressionService#selectRegularExpressionByRegiNo15Digit(java.lang.String)
     */
    @Override
    public String selectRegularExpressionByRegiNo15Digit(String regiNo) throws Exception {
        return regularExpressionDAO.selectRegularExpressionByRegiNo15Digit(regiNo);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.RegularExpressionService#selectRegularExpressionByRegiNo18Digit(java.lang.String)
     */
    @Override
    public String selectRegularExpressionByRegiNo18Digit(String regiNo) throws Exception {
        return regularExpressionDAO.selectRegularExpressionByRegiNo18Digit(regiNo);
    }



}
