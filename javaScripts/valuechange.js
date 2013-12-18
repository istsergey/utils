Copyright (c) 2013 Sergey Isterin <istsergey@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
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
