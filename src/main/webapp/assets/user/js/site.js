- // Đây là mẫu thử nghiệm, hãy copy và paste mã html hoặc css của bạn vào khung này.
(function(a, c) {
    a(document).ready(function() {
        a(".demo-box").css({
            opacity: 1
        });
        a("#contact-submit").on("click", b)
    });

    function b(f) {
        var h = d();
        a(".error").removeClass("error");
        if (h) {
            a("input").removeClass("error");
            var k = h.length;
            for (var j = 0; j < k; j++) {
                a("#" + h[j]).addClass("error")
            }
        } else {
            var m = a("#name").val(),
                g = a("#email").val(),
                n = a("#subject").val(),
                l = a("#message").val();
            a.ajax({
                type: "POST",
                url: "../wp-content/themes/nikolaydyankovdesign/email.php",
                data: {
                    name: m,
                    email: g,
                    subject: n,
                    message: l
                },
                success: function(e) {
                    a("#result").html("Thank you for sending me an email, I will get back to you as soon as possible.");
                    a("form").remove()
                }
            })
        }
        f.preventDefault();
        return false
    }

    function d() {
        var k = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        var j = a("#name").val().length,
            e = a("#email").val().length,
            f = a("#email").val();
        subject = a("#subject").val().length, message = a("#message").val().length;
        var g = new Array(),
            h = false,
            i = 0;
        if (j == 0) {
            g[i] = "name";
            i++;
            h = true
        }
        if (e == 0 || !k.test(f)) {
            g[i] = "email";
            i++;
            h = true
        }
        if (subject == 0) {
            g[i] = "subject";
            i++;
            h = true
        }
        if (message == 0) {
            g[i] = "message";
            i++;
            h = true
        }
        if (h) {
            return g
        } else {
            return false
        }
    }
}(jQuery));
if ('this_is' == /an_example/) {
    of_beautifer();
} else {
    var a = b ? (c % d) : e[f];
}