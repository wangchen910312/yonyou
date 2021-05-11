package chn.bhmc.dms.security;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class ViewResourceHelper {

    private static final Logger log = LoggerFactory.getLogger(ViewResourceHelper.class);

    public static Map<String, Object> makeLoginUserMap() {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication == null) {
            return null;
        }

        Map<String, Object> paramMap = new HashMap<String, Object>();

        Object principal = authentication.getPrincipal();
        if (principal instanceof UserDetails) {
            paramMap.put("usrId", ((UserDetails) principal).getUsername());
        }
        else {
            paramMap.put("usrId", principal.toString());
        }

//      if (principal instanceof CustomUserDetails){
//          String groupId = ((CustomUserDetails) principal).getLoginVO().getGroupId();
//          if (groupId != null){
//              paramMap.put("groupId", groupId);
//          }
//      }

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        List<GrantedAuthority> authoritiesList = new ArrayList<GrantedAuthority>();
        authoritiesList.addAll(authorities);

        paramMap.put("authorities", authoritiesList);

        return paramMap;
    }

    public static boolean isGranted(int foundMask, List<Integer> requiredPermissionList) {

        for (int i = 0; i < requiredPermissionList.size(); i++) {

            int presentMask = requiredPermissionList.get(i).intValue();

            // 원본 mask 와 보수 mask 에 대한 bit & 연산의 결과가 모두 0 보다 크면 포함관계로 볼 수 있음.
            // ex.) p : f 비교 - 001&011 == 001, 010&101 == 000, 010&010 == 010
            // cf.) p 가 f 를 포함하는 경우
            // 011 & 001 == 001 이지만 present 의 보수 100 와 비교하면 000 이 됨
            if (foundMask == presentMask || ((foundMask & presentMask) > 0 && (foundMask & ~presentMask) > 0)) {
                log.debug("ViewResourceHelper.isGranted : true");
                return true;
            }
        }

        log.debug("ViewResourceHelper.isGranted : false");

        return false;
    }
}
