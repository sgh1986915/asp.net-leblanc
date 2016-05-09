﻿// Show a popup message box
function ShowMessageBox(Title, Message) {
    $("#DivMessage").html(Message);
    $("#DivMessage").dialog({ modal: true, title: Title });
}

// Close the popup message box
function CloseMessageBox() {
    $("#DivMessage").dialog('close');
}

//Join RobustHaven Chat
function JoinChatRoom() {
    ShowMessageBox("Joining Chat Room", "Joining Chat Room");

    var alias = $("#txtAliasName").val();

    if (alias == "") alias = "Anonymous";

    robusthaven.webchat.transition.JoinChatRoom(alias, fnJoinChatRoomOnSuccessCallBack);
}

function fnJoinChatRoomOnSuccessCallBack(args) {
    CloseMessageBox();
    if (args != null) {
        var chatbox = new WebChat.ChatBox();
        chatbox.open(args.RoomName);
    }
    else {
        ShowMessageBox("Error", "Arguments is error: ChatRoomID!");
    }
}

// Show a popup form which is used to create a chat room
function fnShowChatRoomForm() {
    // jQuery.dialog reference:
    $("#divCreateChatRoomForm").dialog({ modal: true, show: 'slide', title: 'Create a chat room', width: 500 });
}

//-----------------------------------------------------------------------------------//
// Join one chat room
function fnJoinChatRoom(roomid) {
    ShowMessageBox("Joining Chat Room", "Joining Chat Room");
    robusthaven.webchat.transition.JoinChatRoom(
                roomid,
                $("#txtAlias").val(),
                fnJoinChatRoomOnSuccessCallBack);
}

// Create a chat room
function fuCreateChatRoom() {

    $("#divCreateChatRoomForm").dialog('close');
    ShowMessageBox("Creating chat room...", "Creating chat room...");

    robusthaven.webchat.transition.CreateChatRoom(
                $("#txtAlias").val(),
                $("#txtRoomName").val(),
                $("#txtPassword").val(),
                $("#ddlMaxUser").val(),
                ($("#chkNeedPassword").val() == "on"),
                fuCreateChatRoomOnSuccessCallBack,
                ajaxErrorCallBack
                );

}

function fuCreateChatRoomOnSuccessCallBack(args) {
    CloseMessageBox();
    fuGetRoomList();
}

// Get chat room list
function fuGetRoomList() {
    ShowMessageBox("Getting chat room list...", "Getting chat room list...");
    robusthaven.webchat.transition.GetChatRoomList(fuGetRoolListOnSuccessCallBack, ajaxErrorCallBack);
}

function fuGetRoolListOnSuccessCallBack(args) {
    var table = $("#tblRoomList");
    table.html("");

    var TR = document.createElement("TR");
    var TH = document.createElement("TD");
    $(TR).appendTo(table);
    $(TH).appendTo(TR)
                    .html("RoomID");
    TH = document.createElement("TH");
    $(TH).appendTo(TR)
                    .html("RoomName");
    TH = document.createElement("TH");
    $(TH).appendTo(TR)
                    .html("MaxUser");
    TH = document.createElement("TH");
    $(TH).appendTo(TR)
                    .html("CurrentUser");
    TH = document.createElement("TH");
    $(TH).appendTo(TR)
                    .html("Join");

    $(args).each(function (i) {
        var tr = document.createElement("TR");
        var td = document.createElement("TD");
        $(tr).appendTo(table);
        $(td).appendTo(tr)
                    .html(this.RoomID);
        td = document.createElement("TD");
        $(td).appendTo(tr)
                    .html(this.RoomName);
        td = document.createElement("TD");
        $(td).appendTo(tr)
                    .html(this.MaxUser);
        td = document.createElement("TD");
        $(td).appendTo(tr)
                    .html("<span id='_cu_" + this.RoomID + "'>" + this.CurrentUser + "</span>");
        td = document.createElement("TD");
        $(td).appendTo(tr)
                    .html("<input type='button' value='Join' onclick=\"fnJoinChatRoom('" + args[i].RoomID + "')\" />");
    });

    CloseMessageBox();
}

function ajaxErrorCallBack(args) {
    $("#DivMessage").dialog("close");
}