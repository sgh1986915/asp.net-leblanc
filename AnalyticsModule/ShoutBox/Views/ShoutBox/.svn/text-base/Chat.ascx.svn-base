<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Analytics Chat</title>

    <script type="text/javascript" src="/shoutbox/resource/Content.js.chatRoom.js"></script>

    <link rel="Stylesheet" type="text/css" href="/shoutbox/resource/Content.css.chatbox.css" />

    <style type="text/css">
        body
        {
            font-size: 12px;
        }
    </style>
   
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/Services/Transition.svc" />
            </Services>
            <Scripts>
                <asp:ScriptReference Path="/shoutbox/resource/Content.js.chatbox.js" />
            </Scripts>
        </asp:ScriptManager>

        <fieldset>
            <legend>Chat</legend>
            <div>
                <label>Your Alias Name:</label>
                <input type="text" id="txtAliasName" style="width: 80px;" />
                <input type="button" value="Join Chat" onclick="JoinChatRoom()" />
            </div>
        </fieldset>
    </div>
    <div id="DivMessage" style="display: none;">
    </div>
    </form>
</body>
</html>