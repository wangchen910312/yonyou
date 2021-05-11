package chn.bhmc.dms.core.support.databind;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

public class JsonDateListDeserializer extends JsonDeserializer<List<Date>>  {

    @Override
	public List<Date> deserialize(JsonParser jsonParser, DeserializationContext deserializationContext)
			throws IOException, JsonProcessingException {

	    List<Date> list = null;
	    JsonToken jsonToken = jsonParser.getCurrentToken();

	    if(jsonToken == JsonToken.START_ARRAY) {
	        list = new ArrayList<Date>();

	        while(jsonToken != null && jsonToken != JsonToken.END_ARRAY) {
	            jsonToken = jsonParser.nextToken();

	            if(jsonToken == JsonToken.VALUE_STRING) {
	                try {
	                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

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

	                    list.add(calendar.getTime());

	                } catch (ParseException e) {
	                    throw new RuntimeException(e);
	                }
	            }
	        }
	    }
	    return list;
	}
}
