package chn.bhmc.dms.core.support.idgen;

import java.math.BigDecimal;
import java.util.Locale;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.impl.AbstractDataBlockIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TableIdGenService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

public class TableIdGenService extends AbstractDataBlockIdGnrService {

    private static final Logger LOGGER = LoggerFactory.getLogger(TableIdGenService.class);


    /**
     * ID생성을 위한 테이블 정보 디폴트는 ids임.
     */
    private String table = "CM_0903T";

    /**
     * 테이블 정보에 기록되는 대상 키정보 대개의 경우는 아이디로 생성되는 테이블명을 기재함
     */
    private String tableName = "id";

    /**
     * 테이블명(구분값)에 대한 테이블 필드명 지정
     */
    private String tableNameFieldName = "SEQ_CD";

    /**
     * Next Id 정보를 보관하는 필드명 지정
     */
    private String nextIdFieldName = "SEQ_VAL";

    /**
     * Jdbc template
     */
    private JdbcTemplate jdbcTemplate;

    /**
     * TransactionTemplate
     */
    private TransactionTemplate transactionTemplate;

    private TableNameStrategy tableNameStrategy = new TableNameStrategy() {
        public String makeTableName(String originalTableName) {
            return originalTableName;
        }
    };

    /**
     * 생성자
     */
    public TableIdGenService() {
    }

    @Override
    public void setDataSource(DataSource dataSource) {
        super.setDataSource(dataSource);

        this.jdbcTemplate = new JdbcTemplate(dataSource);

        DataSourceTransactionManager transactionManager = new DataSourceTransactionManager(dataSource);

        this.transactionTemplate = new TransactionTemplate(transactionManager);
        this.transactionTemplate.setPropagationBehaviorName("PROPAGATION_REQUIRES_NEW");
        this.transactionTemplate.setIsolationLevelName("ISOLATION_READ_COMMITTED");
    }

    /**
     * tableName에 대한 초기 값이 없는 경우 초기 id 값 등록 (blockSize 처리)
     *
     * @param useBigDecimals
     * @param initId
     */
    private Object insertInitId(final boolean useBigDecimals, final int blockSize) {

        String makeTableName = tableNameStrategy.makeTableName(tableName);

        LOGGER.debug(messageSource.getMessage("debug.idgnr.init.idblock", new Object[] { makeTableName }, Locale.getDefault()));

        Object initId = null;

        String insertQuery = "INSERT INTO " + table + "(" + tableNameFieldName + ", " + nextIdFieldName + ") " + "values('" + makeTableName + "', ?)";

        LOGGER.debug("Insert Query : {}", insertQuery);

        if (useBigDecimals) {
            initId = new BigDecimal(blockSize);

        } else {
            initId = new Long(blockSize);
        }

        jdbcTemplate.update(insertQuery, initId);

        return initId;

    }

    /**
     * blockSize 대로 ID 지정
     *
     * @param blockSize 지정되는 blockSize
     * @param useBigDecimals BigDecimal 사용 여부
     * @return BigDecimal을 사용하면 BigDecimal 아니면 long 리턴
     * @throws FdlException ID생성을 위한 블럭 할당이 불가능할때
     */
    private Object allocateIdBlock(final int blockSize, final boolean useBigDecimals) throws FdlException {

        final String makeTableName = tableNameStrategy.makeTableName(tableName);

        LOGGER.debug(messageSource.getMessage("debug.idgnr.allocate.idblock", new Object[] { new Integer(blockSize), makeTableName }, Locale.getDefault()));

        try {
            return transactionTemplate.execute(new TransactionCallback<Object>() {

                public Object doInTransaction(TransactionStatus status) {

                    Object nextId;
                    Object newNextId;

                    try {

                        //String selectQuery = "SELECT " + nextIdFieldName + " FROM " + table + " WHERE " + tableNameFieldName + " = ? For UPDATE";
                        String selectQuery = "SELECT " + nextIdFieldName + " FROM " + table + " WHERE " + tableNameFieldName + " = ?";

                        LOGGER.debug("Select Query : {}", selectQuery);

                        if (useBigDecimals) {
                            try {
                                nextId = jdbcTemplate.queryForObject(selectQuery, new Object[] { makeTableName }, BigDecimal.class);
                            } catch (EmptyResultDataAccessException erdae) {
                                nextId = null;
                            }

                            if (nextId == null) { // no row
                                insertInitId(useBigDecimals, blockSize+1);

                                return new BigDecimal(1);
                            }
                        } else {
                            try {
                                nextId = jdbcTemplate.queryForObject(selectQuery, new Object[] { makeTableName }, Long.class);
                            } catch (EmptyResultDataAccessException erdae) {
                                nextId = -1L;
                            }

                            if ((Long) nextId == -1L) { // no row
                                insertInitId(useBigDecimals, blockSize+1);

                                return new Long(1);
                            }
                        }
                    } catch (DataAccessException dae) {
                        dae.printStackTrace();
                        LOGGER.debug("{}", dae);
                        status.setRollbackOnly();
                        throw new RuntimeException(new FdlException(messageSource, "error.idgnr.select.idblock", new String[] { makeTableName }, null));
                    }

                    try {
                        String updateQuery = "UPDATE " + table + " SET " + nextIdFieldName + " = ?" + " WHERE " + tableNameFieldName + " = ?";

                        LOGGER.debug("Update Query : {}", updateQuery);

                        if (useBigDecimals) {
                            newNextId = ((BigDecimal) nextId).add(new BigDecimal(blockSize));

                        } else {
                            newNextId = new Long(((Long) nextId).longValue() + blockSize);
                        }

                        jdbcTemplate.update(updateQuery, newNextId, makeTableName);

                        return nextId;
                    } catch (DataAccessException dae) {
                        status.setRollbackOnly();
                        throw new RuntimeException(new FdlException(messageSource, "error.idgnr.update.idblock", new String[] { makeTableName }, null));
                    }
                }
            });
        } catch (RuntimeException re) {
            if (re.getCause() instanceof FdlException) {
                throw (FdlException) re.getCause();
            } else {
                throw re;
            }
        }
    }

    /**
     * blockSize 대로 ID 지정(BigDecimal)
     *
     * @param blockSize 지정되는 blockSize
     * @return 할당된 블럭의 첫번째 아이디
     * @throws FdlException ID생성을 위한 블럭 할당이 불가능할때
     */
    protected BigDecimal allocateBigDecimalIdBlock(int blockSize) throws FdlException {
        return (BigDecimal) allocateIdBlock(blockSize, true);
    }

    /**
     * blockSize 대로 ID 지정(long)
     *
     * @param blockSize 지정되는 blockSize
     * @return 할당된 블럭의 첫번째 아이디
     * @throws FdlException ID생성을 위한 블럭 할당이 불가능할때
     */
    protected long allocateLongIdBlock(int blockSize) throws FdlException {
        Long id = (Long) allocateIdBlock(blockSize, false);

        return id.longValue();
    }

    /**
     * ID생성을 위한 테이블 정보 Injection
     *
     * @param table config로 지정되는 정보
     */
    public void setTable(String table) {
        this.table = table;
    }

    /**
     *  테이블명(구분값)에 대한 테이블 필드명 정보 지정
     *
     * @param tableNameFieldName
     */
    public void setTableNameFieldName(String tableNameFieldName) {
        this.tableNameFieldName = tableNameFieldName;
    }

    /**
     * Next Id 정보를 보관하는 필드명 정보 지정
     *
     * @param nextIdFieldName
     */
    public void setNextIdFieldName(String nextIdFieldName) {
        this.nextIdFieldName = nextIdFieldName;
    }


    /**
     * ID 생성을 위한 테이블의 키정보 ( 대개의경우는 대상 테이블명을 기재함 )
     *
     * @param tableName config로 지정되는 정보
     */
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    /**
     * @param tableNameStrategy the tableNameStrategy to set
     */
    public void setTableNameStrategy(TableNameStrategy tableNameStrategy) {
        this.tableNameStrategy = tableNameStrategy;
    }

    /**
     * @return the tableNameStrategy
     */
    public TableNameStrategy getTableNameStrategy() {
        return tableNameStrategy;
    }


}
