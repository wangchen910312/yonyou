package chn.bhmc.dms.cmm.ath.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.i18n.SupportedLangService;

public class SupportedLangServiceImpl extends HService implements SupportedLangService {

    @Resource(name="systemConfigInfoService")
	private SystemConfigInfoService systemConfigInfoService;

    private String defaultLang = "ko";

	@Override
	public List<String> supportedLangs() {
	    List<String> supportedLangs = null;
	    try{
	        supportedLangs = Arrays.asList(systemConfigInfoService.selectStrValuesByKey("supportLangs"));
	    }catch(Exception e){
	        supportedLangs = new ArrayList<String>();
	    }

	    return supportedLangs;
	}

	@Override
	public boolean isSupportedLang(String lang) {
		for(String supportedLang : supportedLangs()){
			if(supportedLang.equalsIgnoreCase(lang)){
				return true;
			}
		}
		return false;
	}

	@Override
	public String defaultLang() {
	    String defaultLang = null;
	    try{
	        defaultLang = systemConfigInfoService.selectStrValueByKey("defaultLang");
	    }catch(Exception e){
	        log.debug(e.getMessage());
	        defaultLang = this.defaultLang;
	    }
		return defaultLang;
	}

    /**
     * @return the defaultLang
     */
    public String getDefaultLang() {
        return defaultLang;
    }

    /**
     * @param defaultLang the defaultLang to set
     */
    public void setDefaultLang(String defaultLang) {
        this.defaultLang = defaultLang;
    }

}
