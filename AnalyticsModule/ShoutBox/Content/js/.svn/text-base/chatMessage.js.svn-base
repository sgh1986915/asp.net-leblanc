// Send message
function SendMessage(textbox) {
    if (textbox.value != "") {
        robusthaven.webchat.transition.SendMessage(textbox.value, sendMessageCallBack);
        textbox.value = "";
    }
}

function sendMessageCallBack(args) {
    if (args) {
        UpdateLocalMessage();
    }
    else {
        alert(args);
    }
}

// Update message list
function UpdateLocalMessage() {
    robusthaven.webchat.transition.RecieveMessage(UpdateMessageSuccessCallBack, UpdateMessageFaileCallBack);
}

function UpdateMessageFaileCallBack(args) {
    robusthaven.webchat.transition.LeaveChatRoom(null);
}

function UpdateMessageSuccessCallBack(args) {
    var container = $("#txtMessageList");
    container.html("");
    $(args).each(function (i) {
        var d = document.createElement("DIV");
        $(d)
                    .appendTo(container)
                    .addClass((this.IsFriend ? "_tlkFriend" : "_tlkMe"))
                    .end()
                    .append("<span class=\"_talker\">" + (this.IsFriend ? this.Talker : "I") + "</span>")
                    .append("<span> say at </span>")
                    .append("<span class=\"_time\">" + this.SendTime.format("MM/dd/yyyy HH:mm:ss") + "</span>")
                    .append("<span>: </span><BR /> ")
                    .append("<span class=\"_msg\">" + this.MessageData + "</span>");

    });
    container.scrollTop(container[0].scrollHeight - container.height());

    setTimeout(function () { UpdateLocalMessage(); }, 2000);
}

// Update talker list in the current chat room
function UpdateRoomTalkerList() {
    robusthaven.webchat.transition.GetRoomTalkerList(UpdateRoomTalkerListSuccessCallBack);
}

function UpdateRoomTalkerListSuccessCallBack(args) {
    var lst = $("#lstUserList");
    lst.html("");
    $(args).each(function (i) {
        var l = document.createElement("OPTION");
        $(l)
                    .appendTo(lst)
                    .attr("text", (this.IsFriend ? this.TalkerAlias : "Me"))
                    .attr("value", this.TalkerSession)
                    .attr("title", this.TalkerSession);
    });

    setTimeout(function () { UpdateRoomTalkerList(); }, 2000);
}