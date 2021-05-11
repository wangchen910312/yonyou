package chn.bhmc.dms.core.oxm.jaxb;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.bind.annotation.adapters.XmlAdapter;

public class DateAdapter extends XmlAdapter<String, Date> {

	@Override
	public Date unmarshal(String value) throws Exception {
		try {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(value);
        } catch (ParseException e) {
            throw new IllegalArgumentException(e);
        }
	}

	@Override
	public String marshal(Date value) throws Exception {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(value);
	}

}
