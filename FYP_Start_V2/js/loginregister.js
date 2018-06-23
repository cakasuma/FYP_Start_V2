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
    if (getUrlVars()["nouser"] != null) {
        swal("Oops", "You are not belong to anyone", "error");
    }
    if (getUrlVars()["loginfailed"] != null) {
        swal("Oops", "Login Failed", "error");
    }
    if (getUrlVars()["wrongemail"] != null) {
        swal("Oops", "Email is not exist in the database", "error");
    }

    if (getUrlVars()["forpasssuccess"] != null) {
        swal("Success!", "Please check your email to reset the password", "success");
    }

    if (getUrlVars()["forpassfailed"] != null) {
        swal("Oops!", "I don't think that is the correct email", "error");
    }

    if (getUrlVars()["actvationsuccess"] != null) {
        swal("Congrats!", "Your account is verified", "success");
    }

    if (getUrlVars()["activationfailed"] != null) {
        swal("Oops", "Login Failed", "error");
    }

    if (getUrlVars()["emailexist"] != null) {
        swal("Oops", "Email already exists", "error");
    }
    if (getUrlVars()["registrationsuccess"] != null) {
        swal("Your account has been created!", "Verification link has been sent", "success");
    }

    var password = document.getElementById("pass")
        , confirm_password = document.getElementById("confirm_pass")
        , secret_key = document.getElementById("seckey")
        , confirm_secret_key = document.getElementById("conseckey");

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

    function valsec() {
        if (secret_key.value.length < 6) {
            secret_key.setCustomValidity("Must be 6 or more characters");
        }
        else if (!hasNumber(secret_key.value)) {
            secret_key.setCustomValidity("Must be combination of numbers and characters");
        }
        else {
            secret_key.setCustomValidity('');
        }
    }

    function validatesecurity() {
        if (secret_key.value != confirm_secret_key.value) {
            confirm_secret_key.setCustomValidity("Passwords do not match");
        } else {
            confirm_secret_key.setCustomValidity('');
        }
    }

    password.onchange = valpass;
    confirm_password.onkeyup = validatePassword;

    secret_key.onchange = valsec;
    confirm_secret_key.onkeyup = validatesecurity;
});
