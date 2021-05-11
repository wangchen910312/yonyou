
package chn.bhmc.dms.security.userdetails.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.MappingSqlQuery;

import chn.bhmc.dms.security.userdetails.CustomUserDetails;


public abstract class UsersByUsernameMapping extends MappingSqlQuery<CustomUserDetails> {

    /**
     * 사용자정보를 테이블에서 조회하여 사용자객체에 매핑한다.
     * @param ds
     * @param usersByUsernameQuery
     */
    public UsersByUsernameMapping(DataSource ds, String usersByUsernameQuery) {
        super(ds, usersByUsernameQuery);
        declareParameter(new SqlParameter(Types.VARCHAR));
        compile();
    }

    @Override
    protected abstract CustomUserDetails mapRow(ResultSet rs, int rownum) throws SQLException;
}
