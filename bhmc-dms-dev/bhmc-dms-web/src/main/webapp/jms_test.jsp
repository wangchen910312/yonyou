<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javax.jms.JMSException"%>
<%@page import="javax.jms.Message"%>
<%@page import="javax.jms.MessageConsumer"%>
<%@page import="javax.jms.MessageListener"%>
<%@page import="javax.jms.MessageProducer"%>
<%@page import="javax.jms.Queue"%>
<%@page import="javax.jms.QueueConnection"%>
<%@page import="javax.jms.QueueConnectionFactory"%>
<%@page import="javax.jms.QueueSession"%>
<%@page import="javax.jms.Session"%>
<%@page import="javax.jms.TextMessage"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%

// Hashtable<String, String> env = new Hashtable<String, String>();
// env.put(Context.INITIAL_CONTEXT_FACTORY, "jeus.jndi.JEUSContextFactory");
// env.put(Context.URL_PKG_PREFIXES, "jeus.jndi.jns.url");
// env.put(Context.PROVIDER_URL, "10.125.211.115:9741");
// Context context = new InitialContext(env);

JeusConnectionFactoryCreator connectionFactoryCreator = new JeusConnectionFactoryCreator();
connectionFactoryCreator.setFactoryName("ConnectionFactory");
connectionFactoryCreator.addBrokerAddress("10.125.211.115", 9741, "internal");
ConnectionFactory connectionFactory = (ConnectionFactory)connectionFactoryCreator.createConnectionFactory();

QueueConnectionFactory queueConnectionFactory = (QueueConnectionFactory)context.lookup("QueueConnectionFactory");

out.println("queueConnectionFactory:" + queueConnectionFactory);

/*
QueueConnection queueConnection = queueConnectionFactory.createQueueConnection();
QueueSession queueSession = queueConnection.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
Queue queue = queueSession.createQueue("DynamicQueue?export-name=DynamicQueue&multiple-receiver=true");

MessageProducer producer = queueSession.createProducer(queue);
MessageConsumer consumer = queueSession.createConsumer(queue);
consumer.setMessageListener(new MessageListener(){
    public void onMessage(Message message){
        if(message instanceof TextMessage){
            TextMessage textMessage = (TextMessage)message;
            try {
                System.out.println("receive:" + textMessage.getText());
            } catch (JMSException e) {
                e.printStackTrace();
            }
        }
    }
});
queueConnection.start();

TextMessage message1 = queueSession.createTextMessage("Hello");
producer.send(message1);

TextMessage message2 = queueSession.createTextMessage("World");
producer.send(message2);

queueSession.close();
*/
%>

