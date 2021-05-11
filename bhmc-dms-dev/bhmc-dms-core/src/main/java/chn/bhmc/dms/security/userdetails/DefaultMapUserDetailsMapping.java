
package chn.bhmc.dms.security.userdetails;

import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;

import javax.sql.DataSource;

import org.apache.commons.beanutils.BeanUtils;

import chn.bhmc.dms.security.userdetails.jdbc.UsersByUsernameMapping;
import chn.bhmc.dms.security.userdetails.util.CamelCaseUtil;
import chn.bhmc.dms.security.vo.CustomUserVO;


public class DefaultMapUserDetailsMapping extends UsersByUsernameMapping {

	public DefaultMapUserDetailsMapping(DataSource ds, String usersByUsernameQuery) {
		super(ds, usersByUsernameQuery);
	}

//	@Override
//	protected CustomUserDetails mapRow(ResultSet rs, int rownum) throws SQLException {
//
//		String userid = rs.getString("USER_ID");
//		String password = rs.getString("PASSWORD");
//		boolean enabled = rs.getBoolean("ENABLED");
//
//		Map<String, String> map = new HashMap<String, String>();
//		ResultSetMetaData md = rs.getMetaData();
//		int cnt = md.getColumnCount();
//		for (int i = 1; i <= cnt; i++) {
//			String column = md.getColumnName(i).toLowerCase();
//			String value = rs.getString(column);
//			map.put(CamelCaseUtil.convert2CamelCase(column), value);
//		}
//
//		return new CustomUserDetails(userid, password, enabled, map);
//	}

	@Override
	protected CustomUserDetails mapRow(ResultSet rs, int rownum) throws SQLException {

		String usrId = rs.getString("USR_ID");
		String usrPw = rs.getString("USR_PW");
		boolean enabled = rs.getBoolean("ENABLED");

		CustomUserVO user = new CustomUserVO();

		ResultSetMetaData md = rs.getMetaData();
		int cnt = md.getColumnCount();
		for (int i = 1; i <= cnt; i++) {

			String column = md.getColumnName(i).toLowerCase();

			try{
				if(md.getColumnType(i) == Types.DATE){
                    BeanUtils.setProperty(user, CamelCaseUtil.convert2CamelCase(column), rs.getDate(column));
				}else{
					BeanUtils.setProperty(user, CamelCaseUtil.convert2CamelCase(column), rs.getString(column));
				}
			} catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }

		}

		return new CustomUserDetails(usrId, usrPw, enabled, user);
	}

}
