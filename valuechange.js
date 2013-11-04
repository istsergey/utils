(function ($) {
    /**
* valuechange
*
* This event fires whenever the value changes in text field
*
* Example of use:
* $("#text-field").bind('valuechange', function() {
* //your code
* });
*/
    $.event.special.valuechange = {
        setup: function () {
            $(this).bind('keyup.valuechange input.valuechange', $.event.special.valuechange.handler);
            $(this).bind('cut.valuechange', $.event.special.valuechange.delayedHandler);
            // for IE
            $(this).bind('propertychange.valuechange', $.event.special.valuechange.ieHandler);
        },
        teardown: function () {
            $(this).unbind('.valuechange');


        },
        handler: function () {
            $.event.special.valuechange.triggerEvent($(this));
        },
        ieHandler: function () {
            if (event.propertyName === "value") {
                $.event.special.valuechange.triggerEvent($(this));
            }
        },
        delayedHandler: function () {
            var element = $(this);
            //setTimeout need because the cut event fires before the selected data is removed
            setTimeout(function () {
                $.event.special.valuechange.triggerEvent(element);
            }, 10);
        },
        triggerEvent: function (element) {
            element.trigger('valuechange');
        }

    };
})(jQuery);