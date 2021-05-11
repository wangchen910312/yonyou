package chn.bhmc.dms.par.pmm.service;

import chn.bhmc.dms.par.pmm.vo.ItemClassSearchVO;

/**
 * <pre>
 * 부품등급 관리 서비스
 * </pre>
 *
 * @ClassName   : ItemClassService.java
 * @author In Bo Shim
 * @since 2016. 12. 01.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 01.     In Bo Shim    최초 생성
 * </pre>
 */

public interface ItemClassService {

    /**
     *부품등급 수정 프로시져를 호출한다.
     * @param certificationVO - 등록할 정보가 담긴 certificationVO
     * @return 등록된 목록수
     */
    public void updateItemClassProcedure(ItemClassSearchVO seachVO) throws Exception;






}
