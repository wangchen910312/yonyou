package chn.bhmc.dms.core.i18n;

import java.util.List;

import org.apache.commons.lang3.ArrayUtils;

public class SimpleSupportedLangServiceImpl implements SupportedLangService {

	private List<String> supportedLangs;
	private String defaultLang = "ko";


	public void setSupportedLangs(List<String> supportedLangs) {
		this.supportedLangs = supportedLangs;
	}

	public void setDefaultLang(String defaultLang) {
		this.defaultLang = defaultLang;
	}

	@Override
	public List<String> supportedLangs() {
		return supportedLangs;
	}

	@Override
	public boolean isSupportedLang(String lang) {
		return ArrayUtils.contains(supportedLangs.toArray(), lang);
	}

	@Override
	public String defaultLang() {
		return defaultLang;
	}

}
