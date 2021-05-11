package chn.bhmc.dms.mob.api.main.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.nms.vo.NotificationMessageSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationMessageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationMessageDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Kang Seok Han     최초 생성
 * </pre>
 */
@Mapper("mainNotificationMessageDAO")
public interface MainNotificationMessageDAO {


    /**
     * 메세지 ID에 해당하는 알림메세지 정보를 조회한다.
     * @param mesgId 메세지 ID
     * @return
     */
    public NotificationMessageVO selectNotificationMessageByKey(String mesgId);

    /**
     * 조회 조건에 해당하는 알림메세지 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationMessageSearchVO
     * @return 조회 목록
     */
    public List<NotificationMessageVO> selectNotificationMessagesByCondition(NotificationMessageSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 알림메세지 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationMessageSearchVO
     * @return
     */
    public int selectNotificationMessagesByConditionCnt(NotificationMessageSearchVO searchVO);

}
