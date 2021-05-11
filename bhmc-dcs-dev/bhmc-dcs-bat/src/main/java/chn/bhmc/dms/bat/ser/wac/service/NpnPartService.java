package chn.bhmc.dms.bat.ser.wac.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NpnPartService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 2. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 22.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface NpnPartService {
    
    /**
     *
     * BWMS 부품 정보를 가져온다.
     *
     * @throws Exception
     */
    public void insertBwmsNpnPartInfo()throws Exception;

}
