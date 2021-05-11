package chn.bhmc.dms.core.i18n;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.context.support.AbstractMessageSource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

/**
 * MessageSource that accesses the ResourceBundles with the specified basenames.
 * This class uses java.util.Properties instances as its internal data structure
 * for messages, loading them via a PropertiesPersister strategy: The default
 * strategy can load properties files with a specific charset.
 *
 * <p>In contrast to ResourceBundleMessageSource, this class supports reloading
 * of properties files through the "cacheSeconds" setting, and also through
 * programmatically clearing the properties cache. Since application servers do
 * typically cache all files loaded from the classpath, it is necessary to store
 * resources somewhere else (for example, in the "WEB-INF" directory of a web app).
 * Otherwise changes of files in the classpath are not reflected in the application.
 *
 * <p>Note that the "basename" respectively "basenames" property has a different
 * convention here: It follows the basic ResourceBundle rule of not specifying
 * file extension or language codes, but can refer to any Spring resource location
 * (instead of being restricted to classpath resources). With a "classpath:" prefix,
 * resources can still be loaded from the classpath, but "cacheSeconds" values
 * other than "-1" (caching forever) will not work in this case.
 *
 * <p>This MessageSource can easily be used outside an ApplicationContext: It uses
 * a DefaultResourceLoader as default, getting overridden with the ApplicationContext
 * if running in a context. It does not have any other specific dependencies.
 *
 * @author Kang seok Han
 * @see #setCacheSeconds
 * @see #setBasenames
 * @see ResourceBundleMessageSource
 * @see java.util.ResourceBundle
 */
public class ReloadableDataSourceResourceBundleMessageSource extends AbstractMessageSource {

    private static final Logger log = LoggerFactory
    .getLogger(ReloadableDataSourceResourceBundleMessageSource.class);

    private String[] basenames;

    private boolean fallbackToSystemLocale = true;

    private long cacheMillis = -1;

    /** Cache to hold filename lists per Locale */
    private final Map<String, Map<Locale, List<String>>> cachedFilenames = new HashMap<String, Map<Locale, List<String>>>();

    /** Cache to hold already loaded properties per filename */
    private final Map<String, PropertiesHolder> cachedProperties = new HashMap<String, PropertiesHolder>();

    protected MessageProvider messageProvider;

    /**
     * Sets the {@link MessageProvider} for this which is asked for all its Messages during initialisation.
     *
     * @param  messageProvider  the {@link MessageProvider} to use
     */
    public void setMessageProvider(MessageProvider messageProvider) {

        Assert.notNull(messageProvider);

        this.messageProvider = messageProvider;
    }


    /**
     * Set a single basename, following the basic ResourceBundle convention of
     * not specifying file extension or language codes, but in contrast to
     * ResourceBundleMessageSource referring to a Spring resource location:
     * e.g. "WEB-INF/messages" for "WEB-INF/messages.properties",
     * "WEB-INF/messages_en.properties", etc.
     * @param basename the single basename
     * @see #setBasenames
     * @see org.springframework.core.io.ResourceEditor
     * @see java.util.ResourceBundle
     */
    public void setBasename(String basename) {
        setBasenames(new String[]{basename});
    }

    /**
     * Set an array of basenames, each following the above-mentioned special
     * convention. The associated resource bundles will be checked sequentially
     * when resolving a message code.
     * <p>Note that message definitions in a <i>previous</i> resource bundle
     * will override ones in a later bundle, due to the sequential lookup.
     * @param basenames an array of basenames
     * @see #setBasename
     * @see java.util.ResourceBundle
     */
    public void setBasenames(String[] basenames) {
        this.basenames = basenames;
    }

    public String[] getBasenames(){
        return this.basenames;
    }



    /**
     * Set whether to fall back to the system Locale if no files for a specific
     * Locale have been found. Default is true; if this is turned off, the only
     * fallback will be the default file (e.g. "messages.properties" for
     * basename "messages").
     * <p>Falling back to the system Locale is the default behavior of
     * java.util.ResourceBundle. However, this is often not desirable in an
     * application server environment, where the system Locale is not relevant
     * to the application at all: Set this flag to "false" in such a scenario.
     */
    public void setFallbackToSystemLocale(boolean fallbackToSystemLocale) {
        this.fallbackToSystemLocale = fallbackToSystemLocale;
    }

    /**
     * Set the number of seconds to cache loaded properties files.
     * <ul>
     * <li>Default is "-1", indicating to cache forever (just like
     * java.util.ResourceBundle).
     * <li>A positive number will cache loaded properties files for the given
     * number of seconds. This is essentially the interval between refresh attempts.
     * Note that a refresh attempt will first check the last-modified timestamp
     * of the file before actually reloading it; so if files don't change, this
     * interval can be set rather low, as refresh attempts will not actually reload.
     * <li>A value of "0" will check the last-modified timestamp of the file on
     * every message access. <b>Do not use this in a production environment!</b>
     * </ul>
     */
    public void setCacheSeconds(int cacheSeconds) {
        this.cacheMillis = cacheSeconds * 1000;
}


    protected MessageFormat resolveCode(String code, Locale locale) {
        for (int i = 0; i < this.basenames.length; i++) {
            List<String> filenames = calculateAllFilenames(this.basenames[i], locale);
            for (int j = 0; j < filenames.size(); j++) {
                String filename = filenames.get(j);

                PropertiesHolder propHolder = getProperties(filename);


                if (propHolder.getProperties() != null) {
                    MessageFormat result = propHolder.getMessageFormat(code, locale);
                    if (result != null) {
                        return result;
                    }
                }
            }
        }
        return null;
    }

    /**
     * Calculate all filenames for the given bundle basename and Locale.
     * Will calculate filenames for the given Locale, the system Locale
     * (if applicable), and the default file.
     * @param basename the basename of the bundle
     * @param locale the locale
     * @return the List of filenames to check
     * @see #setFallbackToSystemLocale
     * @see #calculateFilenamesForLocale
     */
    protected List<String> calculateAllFilenames(String basename, Locale locale) {
        synchronized (this.cachedFilenames) {
            Map<Locale, List<String>> localeMap = this.cachedFilenames.get(basename);
            if (localeMap != null) {
                List<String> filenames = localeMap.get(locale);
                if (filenames != null) {
                    return filenames;
                }
            }
            List<String> filenames = new ArrayList<String>(7);
            filenames.addAll(calculateFilenamesForLocale(basename, locale));
            if (this.fallbackToSystemLocale && !locale.equals(LocaleContextHolder.getLocale())) {
                filenames.addAll(calculateFilenamesForLocale(basename, LocaleContextHolder.getLocale()));
            }
            filenames.add(basename);
            if (localeMap != null) {
                localeMap.put(locale, filenames);
            }
            else {
                localeMap = new HashMap<Locale, List<String>>();
                localeMap.put(locale, filenames);
                this.cachedFilenames.put(basename, localeMap);
            }
            return filenames;
        }
    }

    /**
     * Calculate the filenames for the given bundle basename and Locale,
     * appending language code, country code, and variant code.
     * E.g.: basename "messages", Locale "de_AT_oo" -> "messages_de_AT_OO",
     * "messages_de_AT", "messages_de".
     * @param basename the basename of the bundle
     * @param locale the locale
     * @return the List of filenames to check
     */
    protected List<String> calculateFilenamesForLocale(String basename, Locale locale) {
        List<String> result = new ArrayList<String>(3);
        String language = locale.getLanguage();
        String country = locale.getCountry();
        String variant = locale.getVariant();
        StringBuffer temp = new StringBuffer(basename);

        if (language.length() > 0) {
            temp.append('_').append(language);
            result.add(0, temp.toString());
        }
        if (country.length() > 0) {
            temp.append('_').append(country);
            result.add(0, temp.toString());
        }

        if (variant.length() > 0) {
            temp.append('_').append(variant);
            result.add(0, temp.toString());
        }

        return result;
    }

    /**
     * Get PropertiesHolder for the given filename, either from the cache
     * or freshly loaded.
     */
    protected PropertiesHolder getProperties(String filename) {
        synchronized (this.cachedProperties) {

            PropertiesHolder propHolder = this.cachedProperties.get(filename);
            if (propHolder != null &&
                    (propHolder.getRefreshTimestamp() < 0 ||
                     propHolder.getRefreshTimestamp() > System.currentTimeMillis() - this.cacheMillis)) {
                return propHolder;
            }
            else {
                return refreshProperties(filename, propHolder);
            }
        }
    }

    /**
     * Refresh the PropertiesHolder for the given bundle filename.
     * The holder can be null if not cached before, or a timed-out cache entry
     * (potentially getting re-validated against the current last-modified timestamp).
     */
    protected PropertiesHolder refreshProperties(String filename, PropertiesHolder propHolder) {

        long refreshTimestamp = (this.cacheMillis < 0) ? -1 : System.currentTimeMillis();

        try{
            FilenameProperties filenameProperties = new FilenameProperties(filename);
            long fileTimestamp = -1;
            if (this.cacheMillis >= 0) {
                // last-modified timestamp of file will just be read if caching with timeout
                // (allowing to use classpath resources if caching forever)
                fileTimestamp = messageProvider.getLastUpdateTimeStamp(filenameProperties);

                if (propHolder != null && propHolder.getFileTimestamp() == fileTimestamp) {
                    if (logger.isDebugEnabled()) {
                        logger.debug("Re-caching properties for filename [" + filename + "] - file hasn't been modified");
                    }
                    propHolder.setRefreshTimestamp(refreshTimestamp);
                    return propHolder;
                }
            }

            Messages messagesForBasename = messageProvider.getMessages(filenameProperties);
            Properties props = new Properties();

            for (Locale locale : messagesForBasename.getLocales()) {
                Map<String, String> codeToMessage = messagesForBasename.getMessages(locale);

                for (String code : codeToMessage.keySet()) {
                    try {
                        props.put(code, createMessageFormat(codeToMessage.get(code), locale));
                    } catch (RuntimeException e) {
                        throw new MessageInitializationException(String.format(
                                "Error processing Message code=%s locale=%s filename=%s, %s", code, locale, filename,
                                e.getMessage()), e);
                    }
                }
            }

            propHolder = new PropertiesHolder(props, fileTimestamp);

        }catch(Exception e){
            log.debug(e.getMessage(), e);
            propHolder = new PropertiesHolder();
        }

        propHolder.setRefreshTimestamp(refreshTimestamp);
        this.cachedProperties.put(filename, propHolder);

        return propHolder;

    }

    /**
     * Clear the resource bundle cache.
     * Following resolve calls will lead to reloading of the properties files.
     */
    public void clearCache() {
        synchronized (this.cachedProperties) {
            this.cachedProperties.clear();
        }
    }

    /**
     * Clear the resource bundle caches of this MessageSource and all its ancestors.
     * @see #clearCache
     */
    public void clearCacheIncludingAncestors() {
        clearCache();
        if (getParentMessageSource() instanceof ReloadableDataSourceResourceBundleMessageSource) {
            ((ReloadableDataSourceResourceBundleMessageSource) getParentMessageSource()).clearCacheIncludingAncestors();
        }
    }

    public String toString() {
        return getClass().getName() + ": basenames=[" + StringUtils.arrayToCommaDelimitedString(this.basenames) + "]";
    }


    /**
     * PropertiesHolder for caching.
     * Stores the last-modified timestamp of the source file for efficient
     * change detection, and the timestamp of the last refresh attempt
     * (updated every time the cache entry gets re-validated).
     */
    protected class PropertiesHolder {

        private Properties properties;

        private long fileTimestamp = -1;

        private long refreshTimestamp = -1;

        /** Cache to hold already generated MessageFormats per message code */
        private final Map<String, Map<Locale, MessageFormat>> cachedMessageFormats = new HashMap<String, Map<Locale, MessageFormat>>();

        protected PropertiesHolder(Properties properties, long fileTimestamp) {
            this.properties = properties;
            this.fileTimestamp = fileTimestamp;
        }

        protected PropertiesHolder() {
        }

        protected Properties getProperties() {
            return properties;
        }

        protected long getFileTimestamp() {
            return fileTimestamp;
        }

        protected void setRefreshTimestamp(long refreshTimestamp) {
            this.refreshTimestamp = refreshTimestamp;
        }

        protected long getRefreshTimestamp() {
            return refreshTimestamp;
        }

        protected MessageFormat getMessageFormat(String code, Locale locale) {
            synchronized (this.cachedMessageFormats) {
                Map<Locale, MessageFormat> localeMap = this.cachedMessageFormats.get(code);
                if (localeMap != null) {
                    MessageFormat result = localeMap.get(locale);
                    if (result != null) {
                        return result;
                    }
                }
                MessageFormat msg = (MessageFormat)this.properties.get(code);
                if (msg != null) {
                    if (localeMap == null) {
                        localeMap = new HashMap<Locale, MessageFormat>();
                        this.cachedMessageFormats.put(code, localeMap);
                    }
                    localeMap.put(locale, msg);
                    return msg;
                }
                return null;
            }
        }
    }

}
