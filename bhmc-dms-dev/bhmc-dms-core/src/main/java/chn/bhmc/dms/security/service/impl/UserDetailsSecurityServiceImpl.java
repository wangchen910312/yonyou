package chn.bhmc.dms.security.service.impl;

import java.util.List;

import chn.bhmc.dms.security.service.UserDetailsService;
import chn.bhmc.dms.security.userdetails.util.UserDetailsHelper;

public class UserDetailsSecurityServiceImpl implements UserDetailsService {

	@Override
	public Object getAuthenticatedUser() {
		if (UserDetailsHelper.isAuthenticated()) {
			return UserDetailsHelper.getAuthenticatedUser();
		}

		return null;
	}

	@Override
	public List<String> getAuthorities() {
		return UserDetailsHelper.getAuthorities();
	}

	@Override
	public Boolean isAuthenticated() {
		return UserDetailsHelper.isAuthenticated();
	}

}
