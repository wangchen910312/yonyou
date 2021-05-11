package chn.bhmc.dms.core.i18n;

import java.util.List;

public interface SupportedLangService {

	/**
	 * 지원언어 코드 목록을 조회한다.
	 * @return
	 */
	List<String> supportedLangs();

	/**
	 * 지원언어 여부를 반환한다.
	 * @param lang
	 * @return
	 */
	boolean isSupportedLang(String lang);

	/**
	 * 기본언어 코드를 반환한다.
	 * @return
	 */
	String defaultLang();
}
