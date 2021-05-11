package chn.bhmc.dms.crm.cmm.service;

import org.apache.ibatis.annotations.Param;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RegularExpressionService
 * @Description : Regular Expression
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

public interface RegularExpressionService {

    /**
     * Statements
     *
     * @param hpNo
     * @return String true / false
     */
    public String selectRegularExpressionByHpNo(@Param("hpNo") String hpNo) throws Exception;

    /**
     * Statements
     *
     * @param email
     * @return String true / false
     */
    public String selectRegularExpressionByEmail(@Param("email") String email) throws Exception;

    /**
     * Statements
     *
     * @param telNo
     * @return String true / false
     */
    public String selectRegularExpressionByTelNo(@Param("telNo") String telNo) throws Exception;

    /**
     * Statements
     *
     * @param CorpNo
     * @return String true / false
     */
    public String selectRegularExpressionByCorpNo(@Param("corpNo") String corpNo) throws Exception;

    /**
     * Statements
     *
     * @param RegiNo 15 Digit
     * @return String true / false
     */
    public String selectRegularExpressionByRegiNo15Digit(@Param("regiNo") String regiNo) throws Exception;

    /**
     * Statements
     *
     * @param RegiNo 18 Digit
     * @return String true / false
     */
    public String selectRegularExpressionByRegiNo18Digit(@Param("regiNo") String regiNo) throws Exception;


}
