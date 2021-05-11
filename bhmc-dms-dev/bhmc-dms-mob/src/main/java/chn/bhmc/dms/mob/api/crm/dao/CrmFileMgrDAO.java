package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.FileItemVO;

/**
 * <pre>
 * 첨부파일 관리 데이터처리 매퍼 클래스
 * </pre>
 *
 * @ClassName   : FileMgrDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 22.     Kang Seok Han     최초 생성
 * </pre>
 */
@Mapper("CrmfileMgrDAO")
public interface CrmFileMgrDAO {

    public List<FileItemVO> selectFileItemsByFileDocNo(String fileDocNo);

}
