
package chn.bhmc.dms.security.userdetails;

import java.util.Arrays;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import chn.bhmc.dms.security.vo.CustomUserVO;


public class CustomUserDetails extends User {

    /**
	 * Generated Serial Version ID
	 */
	private static final long serialVersionUID = 2517403097977414969L;

	private CustomUserVO customUserVO;

	/**
     * User 클래스의 생성자 Override
     * @param username 사용자계정
     * @param password 사용자 패스워드
     * @param enabled 사용자계정 사용여부
     * @param accountNonExpired
     * @param credentialsNonExpired
     * @param accountNonLocked
     * @param authorities
     * @param customUserVO 사용자 VO객체
     * @throws IllegalArgumentException
     */
    public CustomUserDetails(String username, String password, boolean enabled,
            boolean accountNonExpired, boolean credentialsNonExpired,
            boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities,
            CustomUserVO customUserVO) throws IllegalArgumentException {

        super(username, password, enabled, accountNonExpired,
            credentialsNonExpired, accountNonLocked, authorities);

        this.customUserVO = customUserVO;
    }

    /**
     * CustomUserDetails 생성자
     * @param username
     * @param password
     * @param enabled
     * @param customUserVO
     * @throws IllegalArgumentException
     */
    public CustomUserDetails(String username, String password, boolean enabled, CustomUserVO customUserVO) throws IllegalArgumentException {

    	this(username, password, enabled, true, true, true,
    			Arrays.asList(new GrantedAuthority[] {new SimpleGrantedAuthority("HOLDER")}), customUserVO);
    }

    /**
     * @return 사용자VO 객체
     */
    public CustomUserVO getCustomUserVO() {
        return customUserVO;
    }

    /**
     * @param customUserVO
     *        사용자VO객체
     */
    public void setLoginVO(CustomUserVO customUserVO) {
        this.customUserVO = customUserVO;
    }
}
