package chn.bhmc.dms.core.support.databind;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

public class JsonDateDeserializer extends JsonDeserializer<Date>  {


	@Override
	public Date deserialize(JsonParser jsonParser, DeserializationContext deserializationContext)
			throws IOException, JsonProcessingException {

	    if(StringUtils.isBlank(jsonParser.getText())){
	        return null;
	    }

        try {

            SimpleDateFormat dateFormat;

            if(StringUtils.contains(jsonParser.getText(), "T")){
                dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
            }else{
                dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            }

            TimeZone serverTimeZone = TimeZone.getDefault();
            int serverTimeZoneOffset = serverTimeZone.getRawOffset()/60000;
            int clientTimeZoneOffset = serverTimeZoneOffset;

            ServletRequestAttributes servletRequestAttribute = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();

            if(servletRequestAttribute.getRequest().getHeader("Client-TimeZone-Offset") != null){
                clientTimeZoneOffset = Integer.parseInt(servletRequestAttribute.getRequest().getHeader("Client-TimeZone-Offset"));
            }

            dateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(dateFormat.parse(jsonParser.getText()));

            if(serverTimeZoneOffset != clientTimeZoneOffset){
                calendar.add(Calendar.MINUTE, clientTimeZoneOffset - serverTimeZoneOffset);
            }

            return calendar.getTime();
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
	}

}
