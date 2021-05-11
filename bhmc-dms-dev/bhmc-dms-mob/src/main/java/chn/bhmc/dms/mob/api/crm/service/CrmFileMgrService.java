package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.FileItemVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FileMgrService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface CrmFileMgrService {

    public List<FileItemVO> selectFileItemsByFileDocNo(String fileDocNo) throws Exception;

}
