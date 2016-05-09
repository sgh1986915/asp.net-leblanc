$('.btnEdit').live('click', function (e) {
    e.preventDefault();
    //var id = $(e.target).prev('input[type=hidden]').val();
    $.ajax({
        url: $(this).attr("href"), // + id,
        type: 'post',
        cache: false,
        success: function (content) {
            var popup = $.telerik.window.create({
                id: "window",
                title: 'Edit Item',
                modal: true,
                onClose: function (e) {
                    e.preventDefault();
                    popup.data('tWindow').destroy();
                    $('#grid').data('tGrid').rebind();
                }
            });
            popup.hide();
            popup.find('.t-window-content').html(content);
            $("#divWithRouteTrackForm").height($(window).height() - 100);
            popup.center();
            popup.show();
        }
    });
});


$('.btnAdd').live('click', function (e) {
    e.preventDefault();
    $.ajax({
        url: $(this).attr("href"),
        type: 'post',
        cache: false,
        success: function (data) {
            var popup = $.telerik.window.create({
                title: 'Add Item',
                modal: true,
                onClose: function (e) {
                    e.preventDefault();
                    popup.data('tWindow').destroy();
                    $('#grid').data('tGrid').rebind();
                }
            });
            popup.hide();
            popup.find('.t-window-content').html(data);
            $("#divWithRouteTrackForm").height($(window).height() - 100);
            popup.center();
            popup.show();
        }
    });
});

$('.btnDelete').live('click', function (e) {
    e.preventDefault();
    //var id = $(e.target).siblings('input[type=hidden]').val();
    if (confirm("Are you sure you want to delete record?")) {
        $.ajax({
            url: $(this).attr("href"), // + id,
            type: 'post',
            cache: false,
            success: function (content) {
                $('#grid').data('tGrid').rebind();
            }
        });
    }
});

$("#AjaxForm").live("submit", function () {
    var options = {
        success: checkResult,
        error: Error,
        timeout: 8000
    }
    $(this).ajaxSubmit(options);
    $(".progressDivCentered", this).show();
    $(".progressDivCentered", this).centerInParent($("#divWithRouteTrackForm").parent());
    return false;
});

function Error(data) {
    alert("Error has occured during processing of current request.");
    var window = $(".t-window").data("tWindow");
    window.close();
}

function checkResult(data) {
    if (data.toString().toLowerCase() == 'success') {
        var window = $(".t-window").data("tWindow");
        window.close();
        $(".progressDiv", window).show();
    }
    else {
        $('.t-window-content').html(data);
    }
    return false;
}

$("#AjaxMultipartForm").live("submit", function () {
    var options = {
        success: MultipartFormSuccess,
        error: MultipartFormError,
        timeout: 8000
    }
    $(this).ajaxSubmit(options);
    $(".progressDiv", this).show();
    return false;
});

function MultipartFormError() {
    alert("Error occured when processing current request.");
}

function MultipartFormSuccess(data) {
    var window = $(".t-window").data("tWindow");
    window.close();
    $(".progressDiv", window).show();
    return false;
}

var tmobj = null;

function GetDatas() {
    $("#grid").data("tGrid").rebind();
}

function SetTime() {
    if (tmobj != null)
        clearInterval(tmobj);

    /*var slider = $("#Slider").data("tSlider");
    var tm = slider.value($("#value").val()) * 1000;*/

    var tm = $("#txtInterval").val() * 1000;

    tmobj = setInterval(GetDatas, tm);
}

window.onload = function () {
    GetDatas();
    tmobj = setInterval(GetDatas, 50000);
}