Type.registerNamespace('WebChat');
WebChat.ChatBox = function () {
    WebChat.ChatBox.initializeBase(this);
    this._title = "";
    this._iframe = null;
    this._element = null;
}

WebChat.ChatBox.prototype = {
    get_title: function () {
        return this._title;
    },
    set_title: function (val) {
        this._title = val;
    },
    open: function (RoomName) {
        this._title = RoomName;
        this._element = document.createElement("DIV");
        this._element.style.display = "none";
        this._iframe = document.createElement("IFRAME");
        this._iframe.src = "/chatbox.aspx";
        this._iframe.style.width = "400px";
        this._iframe.frameBorder = 0;
        this._iframe.style.height = "260px";
        this._iframe.scrolling = "no";
        this._element.appendChild(this._iframe);
        document.body.appendChild(this._element);
        var obj = this;
        $(this._element).dialog({ resizable: 'false', show: 'slide', title: this._title, width: 430, beforeClose: function () { obj.quit(); } });
        $addHandler(window, "unload", function () {
            obj.quit();
        });
    },
    quit: function () {
        ShowMessageBox("Leave Chat Room", "Please waiting...");
        robusthaven.webchat.transition.LeaveChatRoom();
        CloseMessageBox();
    }
}