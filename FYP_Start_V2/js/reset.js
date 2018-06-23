function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}
$(document).ready(function () {


    if (getUrlVars()["resetsuccess"] != null) {
        swal("Congrats!", "Reset password successful", "success").then((value) => {
            window.location = "Login_Register.aspx";
        });
    }
    if (getUrlVars()["resetkeysuccess"] != null) {
        swal("Congrats!", "Reset Key successful", "success").then((value) => {
            window.location = "User_Profile.aspx";
        });
    }
    var password = document.getElementById("pass")
        , confirm_password = document.getElementById("confirm_pass");

    function hasNumber(myString) {
        return /\d/.test(myString);
    }
    function valpass() {
        if (password.value.length < 6) {
            password.setCustomValidity("Must be 6 or more characters");
        }
        else if (!hasNumber(password.value)) {
            password.setCustomValidity("Must be combination of numbers and characters");
        }
        else {
            password.setCustomValidity('');
        }
    }

    function validatePassword() {
        if (password.value != confirm_password.value) {
            confirm_password.setCustomValidity("Passwords do not match");
        } else {
            confirm_password.setCustomValidity('');
        }
    }

    password.onchange = valpass;
    confirm_password.onkeyup = validatePassword;

});