$(function () {
    $(document).ajaxStart(function () {
        $("#loading").show();
        $("#loading").addClass("StatusBarHighlight");
    });
    $(document).ajaxStop(function () {
        $("#loading").hide();
        $("#loading").removeClass("StatusBarHighlight");
    });
});

//************************ Gritter Scripts**********************
function Notify(title, msg) {
    $.gritter.add({
        title: title,
        text: msg,
        sticky: false,
        time: ''
    });
    return false;
}
//~Gritter Scripts