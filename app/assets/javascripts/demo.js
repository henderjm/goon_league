$('textarea.expand').focus(function () {
    console.log('hello');
    $(this).animate({ height: "4em" }, 100);
});


$('.messageTextarea').keydown(function() {
    if (event.keyCode == 13) {
        this.form.submit();
        return false;
    }
});