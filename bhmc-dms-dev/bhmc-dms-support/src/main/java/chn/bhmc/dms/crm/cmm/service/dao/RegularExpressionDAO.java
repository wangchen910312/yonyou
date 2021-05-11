package chn.bhmc.dms.crm.cmm.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AddressInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@Mapper("regularExpressionDAO")
public interface RegularExpressionDAO {

    /**
     * Statements
     *
     * @param hpNo
     * @return String true / false
     */
    public String selectRegularExpressionByHpNo(String hpNo);

    /**
     * Statements
     *
     * @param email
     * @return String true / false
     */
    public String selectRegularExpressionByEmail(String email);

    /**
     * Statements
     *
     * @param telNo
     * @return String true / false
     */
    public String selectRegularExpressionByTelNo(String telNo);

    /**
     * Statements
     *
     * @param CorpNo
     * @return String true / false
     */
    public String selectRegularExpressionByCorpNo(String corpNo);

    /**
     * Statements
     *
     * @param RegiNo 15 Digit
     * @return String true / false
     */
    public String selectRegularExpressionByRegiNo15Digit(String regiNo);

    /**
     * Statements
     *
     * @param RegiNo 18 Digit
     * @return String true / false
     */
    public String selectRegularExpressionByRegiNo18Digit(String regiNo);



}
