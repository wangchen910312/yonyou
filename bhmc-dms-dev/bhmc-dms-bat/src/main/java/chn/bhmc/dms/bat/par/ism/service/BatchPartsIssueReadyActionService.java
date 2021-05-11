package chn.bhmc.dms.bat.par.ism.service;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsIssueReadyActionService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2017. 1. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 14.     In Bo Shim     최초 생성
 * </pre>
 */

public interface BatchPartsIssueReadyActionService {

    /**
     * 부품예류 자동 취소 호출.
     *
     * @throws Exception
     */
    public void executeIssuePartsReadyActionAutoCancel() throws Exception;

}
