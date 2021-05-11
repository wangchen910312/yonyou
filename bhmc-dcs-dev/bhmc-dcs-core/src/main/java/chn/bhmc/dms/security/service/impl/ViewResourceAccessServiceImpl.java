package chn.bhmc.dms.security.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.acls.model.Permission;

import chn.bhmc.dms.security.ViewResourceHelper;
import chn.bhmc.dms.security.config.ExtBasePermission;
import chn.bhmc.dms.security.securedobject.SecuredObjectService;
import chn.bhmc.dms.security.service.ViewResourceAccessService;

public class ViewResourceAccessServiceImpl implements ViewResourceAccessService {

	private SecuredObjectService securedObjectService;
	private Permission[] registeredPermissions;
	private List<Map<String, Object>> registeredPermissionList = null;


	public SecuredObjectService getSecuredObjectService() {
		return securedObjectService;
	}

	public void setSecuredObjectService(SecuredObjectService securedObjectService) {
		this.securedObjectService = securedObjectService;
	}

	public void setRegisteredPermissions(Permission[] registeredPermissions) {
		this.registeredPermissions = registeredPermissions;
	}

	public Permission[] getRegisteredPermissions() {
		return registeredPermissions;
	}

	@Override
    public boolean isGranted(String viewId,
            List<Integer> requiredPermissionList) throws Exception {

        Map<String, Object> paramMap = ViewResourceHelper.makeLoginUserMap();
        if (paramMap == null) {
            return false;
        }
        paramMap.put("viewId", viewId);

        List<Map<String, Object>> resultList = securedObjectService.getViewResourceMapping(paramMap);

        for(Map<String, Object> obj : resultList){

            Object tempMask = obj.get("MASK");
            int mask;
            if (tempMask instanceof BigDecimal) {
                mask = ((BigDecimal) tempMask).intValue();
            }
            else {
                mask = ((Integer) tempMask).intValue();
            }

            if(ViewResourceHelper.isGranted(mask, requiredPermissionList)){
                return true;
            }
        }

        return false;
    }

	/*
	@Override
	public boolean isGranted(String viewId,
			List<Integer> requiredPermissionList) throws Exception {

		Map<String, Object> paramMap = ViewResourceHelper.makeLoginUserMap();
		if (paramMap == null) {
			return false;
		}
		paramMap.put("viewId", viewId);

		List<Map<String, Object>> resultList = securedObjectService.getViewResourceMapping(paramMap);

		for(Map<String, Object> obj : resultList){

			Object tempMask = obj.get("MASK");
			int mask;
			if (tempMask instanceof BigDecimal) {
				mask = ((BigDecimal) tempMask).intValue();
			}
			else {
				mask = ((Integer) tempMask).intValue();
			}

			if ("U".equals(obj.get("REF_TP"))) {
				if(ViewResourceHelper.isGranted(mask, requiredPermissionList)){
					return true;
				}
			}
			else if ("G".equals(obj.get("REF_TP"))) {
				if(ViewResourceHelper.isGranted(mask, requiredPermissionList)){
					return true;
				}
			}
			else {
				if(ViewResourceHelper.isGranted(mask, requiredPermissionList)){
					return true;
				}
			}
		}

		return false;
	}
	*/

	@Override
	public List<Map<String, Object>> getRegisteredPermissionList() {

		if (registeredPermissionList != null) {
			return registeredPermissionList;
		}

		registeredPermissionList = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < registeredPermissions.length; i++) {
			Map<String, Object> permissionMap = new HashMap<String, Object>();

			Integer mask = new Integer(registeredPermissions[i].getMask());
			String[] permissionNameAndCode = (String[]) ExtBasePermission.getRegisteredPermissionNames().get(mask);
			// permission 명
			permissionMap.put("permissionName", permissionNameAndCode[0]);
			// code
			permissionMap.put("permissionCode", permissionNameAndCode[1]);
			// mask
			permissionMap.put("permissionMask", mask);
			// pattern
			permissionMap.put("permissionPattern", registeredPermissions[i].getPattern());
			// bit 위치 - 0 부터 시작
			int order = (int) (Math.log(mask.doubleValue()) / Math.log(2.0));
			permissionMap.put("permissionBitOrder", new Integer(order));

			registeredPermissionList.add(permissionMap);

		}

		return registeredPermissionList;
	}

    @Override
    public String getRegisteredPermissionListToString() {
        String permissions = "";
        List<Map<String, Object>> permissionList = getRegisteredPermissionList();
        for(Map<String, Object> permission : permissionList){
            permissions += "," + permission.get("permissionName");
        }

        if(StringUtils.isNotBlank(permissions)){
            permissions = permissions.substring(1);
        }

        return permissions;
    }

}
