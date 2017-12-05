$(document).ready(function () {
    $(window).load(function () {
        $('.preload').click(function() {
           $('.preload').hide();
        });
        var positionYear = $("#slider").position();
        var positionTitle = $("#sankeyTitle").position();
        console.log(positionTitle)
        $('#labelYear').css({
            top: positionYear.top + 80,
            left: positionYear.left + 300
        })
        $('#labelRegion').css({
            top: positionTitle.top -150,
            left: positionTitle.left + 40
        })
        $('#labelBigRegion').css({
            top: positionTitle.top,
            left: positionTitle.left + 1125
        })
        $('#labelGroup').css({
            top: positionTitle.top + 60,
            left: positionTitle.left + 350
        })
    });
});
