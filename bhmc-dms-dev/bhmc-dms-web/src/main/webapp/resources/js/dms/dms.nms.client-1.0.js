(function(){
    NmsClient = (function(){
        var that;
        function NmsClient(){
            this.jmsMesgTp = "W";
            this.userId = "";
            this.onMessageCallback = function(message){
                console.log("<p>" + message.body + "</p>");
            };
            this.jmsUrl = "ws://10.125.211.115:8114";
            this.jmsUserName = "amqdms";
            this.jmsPassword = "amqdms";
            this.debug = false;

            switch(arguments.length){
                case 1:
                    this.jmsMesgTp = arguments[0];
                    break;
                case 2:
                    this.jmsMesgTp = arguments[0];
                    this.userId = arguments[1];
                    break;
                case 3:
                    this.jmsMesgTp = arguments[0];
                    this.userId = arguments[1];
                    this.onMessageCallback = arguments[2];
                    break;
                case 4:
                    this.jmsMesgTp = arguments[0];
                    this.userId = arguments[1];
                    this.onMessageCallback = arguments[2];
                    this.jmsUrl = arguments[3];
                    break;
                case 5:
                    this.jmsMesgTp = arguments[0];
                    this.userId = arguments[1];
                    this.onMessageCallback = arguments[2];
                    this.jmsUrl = arguments[3];
                    this.jmsUserName = arguments[4];
                    break;
                case 6:
                    this.jmsMesgTp = arguments[0];
                    this.userId = arguments[1];
                    this.onMessageCallback = arguments[2];
                    this.jmsUrl = arguments[3];
                    this.jmsUserName = arguments[4];
                    this.jmsPassword = arguments[5];
                    break;
            }

            that = this;
        };

        NmsClient.prototype.stompSuccessCallback = function(){
            //console.log("STOMP:connected to Stomp");
        };

        NmsClient.prototype.stompFailureCallback = function(error){
            //console.log('STOMP:' + error);
            setTimeout(that.stompConnect(), 5000);
            //onsole.log('STOMP:Reconecting in 5 seconds');
        };

        NmsClient.prototype.stompConnect = function(){
            var stompClient;
            stompClient = Stomp.client(that.jmsUrl);
            if(!that.debug){
                stompClient.debug = function(str){
                };
            }
            stompClient.connect(
                that.jmsUserName
                ,that.jmsPassword
                ,function(frame){
                    that.stompSuccessCallback();
                    stompClient.subscribe(that.resolveDestinationName(), function(message) {
                        that.onMessageCallback(message);
                    });
                }
                ,that.stompFailureCallback
            );

            that.stompClient = stompClient;
            console.log("STOMP:connect to Stomp");
        };

        NmsClient.prototype.stompDisConnect = function(){
            that.stompClient.disconnect(function(){
                console.log("STOMP:disconnect to Stomp");
            });
        };

        NmsClient.prototype.setOnMessageCallback = function(callback){
            this.onMessageCallback = callback;
        };

        NmsClient.prototype.setDebug = function(isDebug){
            this.debug = isDebug;
            return this;
        };

        NmsClient.prototype.resolveDestinationName = function(){
            return "dms.nms."+this.jmsMesgTp+"."+this.userId;
        };

        return NmsClient;
    })();

    SimpleNmsClient = {
        options:{
            jmsMesgTp:"W"
            ,userId:""
            ,onMessageCallback:function(message){
                console.log("<p>" + message.body + "</p>");
            }
            ,jmsUrl:"ws://10.125.211.115:8114"
            ,jmsUserName:"amqdms"
            ,jmsPassword:"amqdms"
        }
        ,setOptions:function(options){
            $.extend(true, this.options, options);
        }
        ,client:function(){
            return new NmsClient(
                this.options.jmsMesgTp
                ,this.options.userId
                ,this.options.onMessageCallback
                ,this.options.jmsUrl
                ,this.options.jmsUserName
                ,this.options.jmsPassword
            );
        }
    };

    window.SimpleNmsClient = SimpleNmsClient;
})(jQuery);





