package chn.bhmc.dms.security.service;

import java.util.List;
import java.util.Map;

public interface ViewResourceAccessService {
    /**
     * 권한이 있는지 여부를 체크한다.
     * @param viewId 화면ID
     * @param requiredPermissionList 퍼미션 목록
     * @return
     * @throws Exception
     */
    public boolean isGranted(String viewId, List<Integer> requiredPermissionList) throws Exception;

    /**
     * 전체 퍼미션 목록을 반환한다.
     * @return
     */
    public List<Map<String, Object>> getRegisteredPermissionList();

    /**
     * 전체 퍼미션 목록을 문자열로 반환한다. ex) "READ,SEARCHIND,SEARCHALL"
     * @return
     */
    public String getRegisteredPermissionListToString();
}
