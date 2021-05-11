package chn.bhmc.dms.core.i18n;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceResolvable;
import org.springframework.context.NoSuchMessageException;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AggregatingMessageSource.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.     Kang Seok Han     최초 생성
 * </pre>
 */

public class AggregatingMessageSource implements MessageSource {

    private static final Logger log = LoggerFactory
            .getLogger(AggregatingMessageSource.class);

    private List<MessageSource> messageSources;

    @Override
    public String getMessage(String code, Object[] args, String defaultMessage,
            Locale locale) {
        try {
            return getMessage(code, args, locale);
        } catch (NoSuchMessageException e) {
            return defaultMessage;
        }
    }

    @Override
    public String getMessage(String code, Object[] args, Locale locale)
            throws NoSuchMessageException {
        for (MessageSource messageSource : messageSources) {
            try {
                return messageSource.getMessage(code, args, locale);
            } catch (NoSuchMessageException e) {
            }
        }

        log.debug(String.format("Message Source does not contain message with key '%s' and locale '%s'", code, locale));
        throw new NoSuchMessageException(code, locale);
    }

    @Override
    public String getMessage(MessageSourceResolvable resolvable, Locale locale)
            throws NoSuchMessageException {

        for (MessageSource messageSource : messageSources) {
            try {
                return messageSource.getMessage(resolvable, locale);
            } catch (NoSuchMessageException e) {
                log.debug(String.format(
                        "Message Source [%s] does not contain message. %s",
                        messageSource.getClass().getName(), e.getMessage()));
            }
        }

        String[] codes = resolvable.getCodes();
        if (codes == null) {
            codes = new String[0];
        }
        throw new NoSuchMessageException(
                codes.length > 0 ? codes[codes.length - 1] : null, locale);
    }

    public void setMessageSources(List<MessageSource> messageSources) {
        this.messageSources = messageSources;
    }



}
