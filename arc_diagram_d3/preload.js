$(document).ready(function () {
    $(window).load(function () {
        $('.preload').click(function() {
           $('.preload').hide();
        });
        var positionYear = $("#slider").position();
        var positionTitle = $("#sankeyTitle").position();
        var positionText = $('#svg2').position();
        $('#labelYear').css({
            top: positionYear.top + 80,
            left: positionYear.left + 300
        })
        $('#labelRegion').css({
            top: positionTitle.top -150,
            left: positionTitle.left + 40
        })
        $('#labelBigRegion').css({
            top: positionTitle.top - 20,
            left: positionTitle.left + 1125
        })
        $('#labelGroup').css({
            top: positionTitle.top + 120,
            left: positionTitle.left + 1550
        })
        $('#labelText').css({
            top: positionText.top + 20,
            left: positionText.left + 20
        })
    });
});
