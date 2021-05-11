package chn.bhmc.dms.bat.sal.usc.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedcarInfoService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 24.     Ki hyun Kwon     최초 생성
 * </pre>
 */

public interface UsedcarInfoService {

    /**
    *
    * 중고차인증명세-차량마스터  정보
    *
    * @throws Exception
    */
   public void insertSusunDcsUvinmst()throws Exception;

   /**
    *
    * 중고차인증명세-소유자  정보
    *
    * @throws Exception
    */
   public void insertSusunDcsOwner()throws Exception;

   /**
    *
    * 중고차인증명세-인증차량
    *
    * @throws Exception
    */
   public void insertSusunDcsCrtvin()throws Exception;

   /**
    *
    * 중고차인증명세-인증딜러  정보
    *
    * @throws Exception
    */
   public void insertSusunDcsCrtdlr()throws Exception;

}
