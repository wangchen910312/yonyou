package chn.bhmc.dms.core.i18n;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.util.Assert;

import chn.bhmc.dms.core.i18n.util.LocaleUtils;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DataSourceMessageProvider.java
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

public class DataSourceMessageProvider implements MessageProvider {

    private final static Logger log = LoggerFactory.getLogger(DataSourceMessageProvider.class);

    protected static final String QUERY_INSERT_MESSAGE =
        "INSERT INTO %s (%s, %s, %s, %s, %s) VALUES (?, ?, ?, ?, ?)";
protected static final String QUERY_DELETE_MESSAGES = "DELETE FROM %s WHERE %s = ?";
protected static final String QUERY_SELECT_BASENAMES = "SELECT DISTINCT %s from %s WHERE USE_YN='Y'";
protected static final String QUERY_SELECT_MESSAGES = "SELECT %s,%s,%s,%s FROM %s WHERE %s = ? AND USE_YN='Y'";
protected static final String QUERY_LASTUPDATE_TIMESTAMP = "SELECT MAX(%s) FROM %s WHERE %s = ? AND USE_YN='Y'";

private JdbcTemplate template;

private String languageColumn = "LANG_CD";
private String countryColumn = "CNTRY_CD";
private String basenameColumn = "BUNDLE_NM";
private String keyColumn = "MESG_KEY";
private String messageColumn = "MESG_TXT";
private String updateTimeColumn = "LST_UPDT_DT";
private String tableName = "CM_0501T";

private String delimiter = "`";

private List<String> availableBaseNames = null;



private final MessageExtractor extractor = new MessageExtractor();


/*
 * (non-Javadoc)
 *
 * @see chn.bhmc.dms.core.i18n.MessageProvider#getMessages(java.lang.String)
 */
public Messages getMessages(String basename) {

    String query =
            String.format(getSelectMessagesQuery(), addDelimiter(languageColumn), addDelimiter(countryColumn),
                    addDelimiter(keyColumn), addDelimiter(messageColumn),
                    addDelimiter(tableName), addDelimiter(basenameColumn));

    return template.query(query, new Object[] { basename }, extractor);
}

public Messages getMessages(FilenameProperties filenameProperties) {

    StringBuilder query = new StringBuilder();
    query.append(
            String.format(getSelectMessagesQuery(), addDelimiter(languageColumn), addDelimiter(countryColumn),
                    addDelimiter(keyColumn), addDelimiter(messageColumn),
                    addDelimiter(tableName), addDelimiter(basenameColumn))
    );

    if(filenameProperties.getLanguage() != null){
        query.append(" AND " + addDelimiter(languageColumn) + "=?");
    }
    if(filenameProperties.getCountry() != null){
        query.append(" AND " + addDelimiter(countryColumn) + "=?");
    }

    return template.query(query.toString(), filenameProperties.getProperties(), extractor);
}

/*
 * (non-Javadoc)
 *
 * @see chn.bhmc.dms.core.i18n.MessageAcceptor#getLastUpdateTimeStamp(java.lang.String)
 */
public long getLastUpdateTimeStamp(String basename){

    Timestamp updateTime = template.queryForObject(String.format(getLastUpdateTimestampQuery(), addDelimiter(updateTimeColumn),
            addDelimiter(tableName), addDelimiter(basenameColumn)), Timestamp.class);

    return updateTime.getTime();
}

/*
 * (non-Javadoc)
 *
 * @see chn.bhmc.dms.core.i18n.MessageAcceptor#getLastUpdateTimeStamp(java.lang.String)
 */
public long getLastUpdateTimeStamp(FilenameProperties filenameProperties){

    StringBuilder query = new StringBuilder();
    query.append(
            String.format(getLastUpdateTimestampQuery(), addDelimiter(updateTimeColumn),
                    addDelimiter(tableName), addDelimiter(basenameColumn))
    );

    if(filenameProperties.getLanguage() != null){
        query.append(" AND " + addDelimiter(languageColumn) + "=?");
    }
    if(filenameProperties.getCountry() != null){
        query.append(" AND " + addDelimiter(countryColumn) + "=?");
    }

    log.info("getLastUpdateTimeStamp query {0}", query.toString());
    log.info(filenameProperties.toString());

    Timestamp updateTime = template.queryForObject(query.toString(), filenameProperties.getProperties(), Timestamp.class);

    return updateTime.getTime();
}


/*
 * (non-Javadoc)
 *
 * @see chn.bhmc.dms.core.i18n.MessageAcceptor#setMessages(java.lang.String, chn.bhmc.dms.core.i18n.Messages)
 */
public void setMessages(String basename, Messages messages) {

    deleteMessages(basename);

    String query =
            String.format(getInsertMessageQuery(), addDelimiter(tableName), addDelimiter(basenameColumn),
                    addDelimiter(languageColumn), addDelimiter(countryColumn),
                    addDelimiter(keyColumn), addDelimiter(messageColumn));

    for (Locale locale : messages.getLocales()) {

        insert(query, basename, LocaleUtils.getLanguage(locale), LocaleUtils.getCountry(locale),messages.getMessages(locale));

    }

}


private void insert(String query, final String basename, final String language, final String country, final Map<String, String> messages) {

    final Iterator<Map.Entry<String, String>> messagesIterator = messages.entrySet().iterator();

    template.batchUpdate(query, new BatchPreparedStatementSetter() {

        public void setValues(PreparedStatement ps, int i) throws SQLException {

            Map.Entry<String, String> entry = messagesIterator.next();
            ps.setString(1, basename);
            ps.setString(2, language);
            ps.setString(3, country);
            ps.setString(4, entry.getKey());
            ps.setString(5, entry.getValue());

        }

        public int getBatchSize() {
            return messages.size();
        }
    });

}


/*
 * (non-Javadoc)
 *
 * @see chn.bhmc.dms.core.i18n.MessageProvider#getAvailableBaseNames()
 */
public List<String> getAvailableBaseNames() {

    if(availableBaseNames != null) return availableBaseNames;

    List<String> basenames =
            template.queryForList(
                    String.format(getSelectBasenamesQuery(), addDelimiter(basenameColumn), addDelimiter(tableName)),
                    String.class);
    return basenames;
}

public void setAvailableBaseNames(List<String> availableBaseNames) {
    this.availableBaseNames = availableBaseNames;
}

private void deleteMessages(final String basename) {

    String query = String.format(getDeleteMessagesQuery(), addDelimiter(tableName), addDelimiter(basenameColumn));

    template.update(query, basename);

}


/**
 * Returns the query used to select messages of a basename
 *
 * @return the query
 */
protected String getSelectMessagesQuery() {

    return QUERY_SELECT_MESSAGES;
}

protected String getLastUpdateTimestampQuery() {
    return QUERY_LASTUPDATE_TIMESTAMP;
}


/**
 * Returns the query used for selecting available basenames.
 *
 * @return the query
 */
protected String getSelectBasenamesQuery() {

    return QUERY_SELECT_BASENAMES;
}


/**
 * Returns the Query-Template used to insert a Message
 *
 * @return the query
 */
protected String getInsertMessageQuery() {

    return QUERY_INSERT_MESSAGE;
}


/**
 * Returns the query to delete Messages
 *
 * @return the query
 */
protected String getDeleteMessagesQuery() {

    return QUERY_DELETE_MESSAGES;
}


/**
 * Method that "wraps" a field-name (or table-name) into the delimiter.
 *
 * @param name the name of the field/table
 * @return the wrapped field/table
 */
protected String addDelimiter(String name) {

    return String.format("%s%s%s", delimiter, name, delimiter);
}


/**
 * Returns the delimiter used within queries to delimit table- and column-names
 *
 * @return the delimiter
 */
public String getDelimiter() {

    return delimiter;
}


/**
 * Sets the delimiter used within queries to delimit table- and column-names (defaults to `). Must not be null.
 *
 * @param delimiter the delimiter to use
 */
public void setDelimiter(String delimiter) {

    Assert.notNull(delimiter);
    this.delimiter = delimiter;
}


/**
 * Returns the name of the column holding the information about the basename (string-type)
 *
 * @return the name of the basename-column
 */
public String getBasenameColumn() {

    return basenameColumn;
}


/**
 * Sets the name of the column holding the information about the basename (string-type)
 *
 * @param basenameColumn the name of the basename-column
 */
public void setBasenameColumn(String basenameColumn) {

    this.basenameColumn = basenameColumn;
}


/**
 * Returns the name of the table containing the messages
 *
 * @return the name of the table containing the messages
 */
public String getTableName() {

    return tableName;
}


/**
 * Sets the name of the table containing the messages
 *
 * @param tableName the name of the table containing the messages
 */
public void setTableName(String tableName) {

    Assert.notNull(tableName);
    this.tableName = tableName;
}


/**
 * Sets the {@link DataSource} where connections can be created to the database containing the table with messages
 *
 * @param dataSource the {@link DataSource} to set
 */
public void setDataSource(DataSource dataSource) {

    Assert.notNull(dataSource);
    this.template = new JdbcTemplate(dataSource);
}


/**
 * Returns the name of the column holding the information about the language (string-type)
 *
 * @return the name of the column holding the information about the language (string-type)
 */
public String getLanguageColumn() {

    return languageColumn;
}


/**
 * Sets the name of the column holding the information about the language (string-type)
 *
 * @param languageColumn the name of the language-column
 */
public void setLanguageColumn(String languageColumn) {

    Assert.notNull(languageColumn);

    this.languageColumn = languageColumn;
}


/**
 * Returns the name of the column holding the information about the country (string-type)
 *
 * @return the name of the column holding the information about the country (string-type)
 */
public String getCountryColumn() {

    return countryColumn;
}


/**
 * Sets the name of the column holding the information about the country (string-type)
 *
 * @param countryColumn the name of the country-column
 */
public void setCountryColumn(String countryColumn) {

    Assert.notNull(countryColumn);

    this.countryColumn = countryColumn;
}


/**
 * Returns the name of the column holding the information about the key (string-type)
 *
 * @return the name of the column holding the information about the key (string-type)
 */
public String getKeyColumn() {

    return keyColumn;
}


/**
 * Sets the name of the column holding the information about the key aka the name of the message-code (string-type)
 *
 * @param keyColumn the name of the key-column
 */
public void setKeyColumn(String keyColumn) {

    Assert.notNull(keyColumn);

    this.keyColumn = keyColumn;
}


/**
 * Returns the name of the column holding the information about the message (string-type)
 *
 * @return the name of the column holding the information about the message (string-type)
 */
public String getMessageColumn() {

    return messageColumn;
}


/**
 * Sets the name of the column holding the information about the message-value aka the message itself (string-type)
 *
 * @param messageColumn the name of the message-column
 */
public void setMessageColumn(String messageColumn) {

    Assert.notNull(messageColumn);
    this.messageColumn = messageColumn;
}



public String getUpdateTimeColumn() {
    return updateTimeColumn;
}

public void setUpdateTimeColumn(String updateTimeColumn) {
    this.updateTimeColumn = updateTimeColumn;
}



/**
 * Helper that extracts messages from a resultset
 **/
class MessageExtractor implements ResultSetExtractor<Messages> {

    /*
     * (non-Javadoc)
     *
     * @see org.springframework.jdbc.core.ResultSetExtractor#extractData(java.sql.ResultSet)
     */
    public Messages extractData(ResultSet rs) throws SQLException, DataAccessException {

        Messages messages = new Messages();

        while (rs.next()) {
            String language = rs.getString(languageColumn);
            String country = rs.getString(countryColumn);
            String key = rs.getString(keyColumn);
            String message = rs.getString(messageColumn);

            Locale locale = LocaleUtils.toLocale(language, country, null);

//            log.debug("locale:{}, mesgKey:{}, mesgTxt:{}", locale.toString(), key, message);

            messages.addMessage(locale, key, message);
        }

        return messages;
    }

}

}
