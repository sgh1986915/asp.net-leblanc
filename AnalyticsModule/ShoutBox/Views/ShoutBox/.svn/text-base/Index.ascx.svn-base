<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="MvcContrib" %>


    <script type="text/javascript">
     Sys.require(
        [Sys.components.dataView,
         Sys.components.dataContext,
         Sys.components.watermark,
         Sys.scripts.WebServices,
         Sys.scripts.Globalization]
     );
     Sys.converters.dateToShoutBoxDateString = function (value, binding) {
         return '' + value.format('hh:mm t');
     }

     function fetchdata_shoutservice(input) {
         $("#messageList").data("dataView").fetchData();
     }

     Sys.onReady(function () {
         $("#messageList").data("dataView",
                Sys.query("#messageList").dataView(
                    {
                        dataProvider: "/Modules/ShoutBox/ShoutOutService.svc",
                        fetchOperation: "List",
                        autoFetch: "true"
                    }
                ).get(0)
            );

         $("#messageList").data("poolIntervalId", 
             window.setInterval(fetchdata_shoutservice, 1000 * 15));

         Sys.query(".message-watermarked").watermark("Message Text...", "message-watermarked");

         $('.message-submit').click(function (event) {
             var service = new RobustHaven.Areas.ShoutBox.Services.ShoutOutService();
             service.Create({ Id: null, UserName: "Anonymous", Message: $('#messagetext').val(), CreatedOn: null },
             function(createresponse) {
                $('#messagetext').val('')
                $("#messageList").data("dataView").fetchData();
             });

             event.preventDefault();
         });
     });
    </script>    
    
    <script src="/Modules/ShoutBox/ShoutOutService.svc/jsdebug" type="text/javascript"></script>
    <style type="text/css">
        .shoutbox
        {
            background-color:#202020;
            padding:5px;
        }
        #messageList 
        {
            background-color:#FFF;
            border:1px solid #7f7f7f;
            margin-left:5px;
            height:216px;
            overflow:auto;
        }
        #messageList .tweet
        {
            border:1px solid #f1f1f1;
            font-size:11px;
            padding:3px;
            background-color:#fafafa;
        }
        #messageList .tweet .createdon
        {
            color:#aeb3b6;
        }
        #messageList .tweet .username
        {
            font-weight:bold;
            color:#1b1a44;
        }
        #messageList .tweet .message
        {
            color:#5c5672;
        }
        
        .respond
        {
            height:57px;
            padding:20px 0 0 20px;
            background: url(/shoutbox/resource/Content.img.response.jpg) no-repeat -2px 0px;
        }
        
        .message-watermarked
        {
            color:#b8b3b9;
            font-size:.8em;
        }
    </style>
    

    <div xmlns:sys="javascript:Sys" class="shoutbox">
        <!--Client Template used by attached DataView-->
        <div id="messageList" class="sys-template">
            <div class="tweet">
                <span class="createdon" sys:innerhtml="{binding CreatedOn, convert=dateToShoutBoxDateString}"></span>
                <span class="separator"><img src='/shoutbox/resource/Content.img.star.png' alt='star' /></span>
                <span class="username">{{ UserName }}:</span>
                <span class="message">{{ Message }}</span>
            </div>
        </div>

        <form class="respond" name="/shoutbox/Create" action="">
            <div>
                <input id="messagetext" class="message-watermarked" type="text" name="message" style="width:293px;" />
                <input class="message-submit" type="submit" value="Save" />
            </div>
        </form>
    </div>