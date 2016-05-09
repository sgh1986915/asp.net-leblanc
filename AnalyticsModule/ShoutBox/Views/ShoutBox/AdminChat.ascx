<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Analytics Chat</title>

    <script type="text/javascript" src="/Scripts/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="/shoutbox/resource/Content.js.chatmessage.js"></script>


    <style type="text/css">
        ._tlkFriend
        {
            width: 250px;
            float: left;
            margin: 5px 0 5px 0;
            font-size: 12px;
            color: Orange;
            border-bottom: 1px solid gray;
            white-space: normal;
            word-break: break-all;
            overflow: auto;
        }
        ._tlkFriend ._talker
        {
            font-size: 12px;
            color: Black;
        }
        
        ._tlkFriend ._time
        {
            font-size: 10px;
            color: Gray;
        }
        ._tlkFriend ._msg
        {
            font-size: 14px;
            line-height: 20px;
            color: Blue;
            padding-left: 5px;
        }
        
        ._tlkMe
        {
            width: 250px;
            float: left;
            margin: 5px 0 5px 0;
            font-size: 12px;
            color: Green;
            border-bottom: 1px solid gray;
            white-space: normal;
            word-break: break-all;
            overflow: auto;
        }
        ._tlkMe ._talker
        {
            font-size: 12px;
            color: Black;
        }
        
        ._tlkMe ._time
        {
            font-size: 10px;
            color: Gray;
        }
        ._tlkMe ._msg
        {
            font-size: 14px;
            line-height: 20px;
            color: Fuchsia;
            padding-left: 5px;
        }
    </style>

    <script type="text/javascript">
        function pageLoad(sender, e) {
            // Get the current message list
            UpdateLocalMessage();
            // Get the current user list in this chat room
            UpdateRoomTalkerList();
        }
    </script>
</head>
<body>

    <form id="form1" runat="server" defaultbutton="btnSendMessage">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/Transition.svc" />
        </Services>
    </asp:ScriptManager>

    <div style="width: 400px; border: 1px solid black">
        <table>
            <tr>
                <td style="width: 280px;">
                    <div id="txtMessageList" style="width: 280px; height: 400px; border: 0; background-color: #ffffcc;
                        font-size: 12px; overflow: auto;">
                    </div>
                </td>
                <td valign="top" style="width: 120px;">
                    <select style="height: 400px; width: 90px; border: 0;" id="lstUserList" name="lstUserList" size="4">
                    </select>
                </td>
            </tr>
            <tr>
                <td valign="middle">
                    <input type="text" style="width: 280px; height: 50px;" id="txtMessage" name="txtMessage" />
                </td>
                <td>
                    <asp:Button ID="btnSendMessage" runat="server" OnClientClick="SendMessage($get('txtMessage'));return false;"
                        Text="Send" Style="width: 100px; height: 45px;" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
