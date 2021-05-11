package chn.bhmc.dms.bat.ser.mig.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GdmsDataMigService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Yunseung
 * @since 2017. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 22.   Kin Yunseung     최초 생성
 * </pre>
 */

public interface GdmsDataMigService {

    /**
    * GDMS 데이터를 가져온다.
    * @throws Exception
    */
   public void insertGdmsToDcs(int pDay)throws Exception;

}
