
var displaySideNav = function(el) {      //display sidebar only when diet planner is selected

    if (el.attr("href") != "/site/dashboard") {
        $(".side-nav").addClass('hide');
    }else {
        $(".side-nav").removeClass('hide');
    }
};

var displayNoticesAndAlerts = function() {

    $('#notice:not(:empty)').removeClass("hide");
    $('#notice_signed_in:not(:empty)').removeClass("hide");
    $('#alert:not(:empty)').removeClass("hide");
    $('#alert_signed_in:not(:empty)').removeClass("hide");
};


//determine which tab from main nav was selected on load before any ajax call
var selectedElement = $(document).find('#nav .selected');
displaySideNav(selectedElement);
displayNoticesAndAlerts();

var displayResponse = function(response) { // Display fetched content from the server on the page
    $("#loading").addClass('hide');  // hides the loading bar

    var content = $("#content"); // fetch the content div

    var filteredResponse = $(response).find("#content").children();
    content.html(filteredResponse); // write the new content in it


    var selectedElement = $(document).find('#nav .selected');
    displaySideNav(selectedElement);

    content.find('#notice:not(:empty)').removeClass("hide");
    content.find('#notice_signed_in:not(:empty)').removeClass("hide");
    content.find('#alert:not(:empty)').removeClass("hide");
    content.find('#alert_signed_in:not(:empty)').removeClass("hide");

    //load jQuery datepicker
    content.find('#exercise_log_exercise_date, #food_intake_log_intake_date, #weight_log_measured_on').datepicker({dateFormat: 'yy-mm-dd'});
    //load jQuery chosen
    content.find('.chosen-select').chosen();
    //load jQuery accordeon
    content.find('#accordion').accordion();
    //on click start an ajax request for pagination links
    $(document).on("click","#recipes th a, #recipes .pagination a", function() {
            $.getScript(this.href);
            return false;
        }
    );

    //code that checkes in female is checked and toggles on additional fields
    var female = content.find("input#profile_gender_female");
    if (female.attr('checked')) {
        $("div#woman").attr('style', 'display:block;');
    }
    content.find("input[name='profile[gender]']").on('change', function(){
            $("#woman").toggle();
        }
    );

    //morris jquery library
    morrisTemplate = {
        element: 'weight_logs_chart',
        data: $('#weight_logs_chart').data('weight-logs'),
        xkey: 'measured_on',
        ykeys: ['weight'],
        labels: ['Weight'],
        smooth: true,
        postUnits: 'kg',
        goals: [$('#min').text(), $('#max').text()],
        goalStrokeWidth: 1,
        goalLineColors: ['#FF0000' ]
    };
    content.find("a").not('div#the_modal a')
        .not("div#food_intake_log_food_id_chosen a")
        .not("div#exercise_log_activity_id_chosen a")
        .on("click", loadAjax); // finds every link in it and monitor the click events
    content.find("form").on("submit", submitForm); // findex every form in it and monitor the submit events

    if ($('#myfirstchart').length>0 ){
        Morris.Line(morrisTemplate);
    }

};


var submitForm = function(e) { // 1. When a form is submitted

    e.preventDefault(); // cancel the default action, page refresh

    $(this).find("input[type=submit]").attr("disabled", "disabled"); // find the submit button and disable it
    $(this).off("submit"); // remove the submission event from the form

    $("#loading").removeClass('hide'); // display the loading bar


    var url = $(this).attr("action"); // retrieve the action attribute from the submitted form
    var method = $(this).attr("method"); // retrive the method attribute from the submitted form
    var data = {}; // creates an empty data json object to hold all the values from the submitted form

    $(this).find("input, select").each(function() { // for each input / select  in the submitted form
        var name = $(this).attr("name"); // find the name of the input

        data[name] = $(this).val(); // add it to the data object
    });

    $.ajax({ // start an ajax request
        url: url, // to the following url
        type: method, // with this http verb (get / post / put / delete)
        data: data, // with these values from the form
        success: displayResponse // when it is done, display the content fetched
    });
};

var loadAjax = function(e) { // When a link is clicked

    e.stopPropagation();
    e.preventDefault(); // cancel the default action, page refresh

    $('ul.side-nav a').css('border-bottom','none');
    $(this).attr("disabled", "disabled");
    $(this).css('border-bottom','1px solid black');

    $("#loading").show(); // display the loading bar

    var url = $(this).attr("href"); // retrive the href attribute from the clicked link
    var method = $(this).attr("data-method"); // retrive the data-method attribute from the clicked link or get if the attribute is empty

    if(method === "delete" && confirm("Are you sure?")) { // if the method is delete
        $(this).parents("tr").remove(); // remove the row from the page
    }

    $.ajax({ // start an ajax request
        url: url, // to the following url
        type: method, // with this http verb (get / post / put / delete)
        success: displayResponse, // when it is done, display the content fetched
        error: function() {
          alert('We are sorry but there was an error following your request');
        }
    });
};
$(".side-nav a").bind('ajax:before', function() { return false; }).on("click", loadAjax); // monitor the navigation bar for click events

var email = $('#user_email');
var password = $('#user_password');
var confirmation = $('#user_password_confirmation');
var emailTip = $('#emailTip');
var passwordTip = $('#passwordTip');
var confirmationTip = $('#passwordConfirmationTip');
password.pwstrength(password.val());

//validation of the registration page

var toggleIfHidden = function(el){
    if (el.is(":hidden")){
        el.toggle(1000);
    }
};

$('#new_user').submit( function() {
    if (!isEmail(email.val())) {
        email.css('background-color','#f7bebe');
        toggleIfHidden(emailTip);
    }

    if (!isValidPassword(password.val())){
        password.css('background-color','#f7bebe');
        toggleIfHidden(passwordTip);
    }

    if (!arePasswordsMatching($('#user_password').val(), confirmation.val())) {
        confirmation.css('background-color','#f7bebe');
        toggleIfHidden(confirmationTip);
    }

    if (!areAllFieldsValid()) {
        return false;
    }
});

email.blur( function() {
    email.css('background-color','#fff');
    $('#emailTip').hide();
});

password.blur( function() {
    $('#user_password').css('background-color','#fff');
    $('#passwordTip').hide();
});

confirmation.blur( function() {
    $('#user_password_confirmation').css('background-color','#fff');
    $('#passwordConfirmationTip').hide()
});

var isEmail = function(string)  {
// A variable containing a regular expression representing an email address
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    return (emailPattern.test(string));
};

var isValidPassword = function(string){
// A variable containing a regular expression representing an email address
    var passwordPattern = /^.{6,15}$/;
    return (passwordPattern.test(string));
};

//checks if password and confirmation match
var arePasswordsMatching = function(password,confirmation){
    return (confirmation.length > 0 && password == confirmation && isValidPassword(password));
};

//checks if all fields are correct
var areAllFieldsValid = function() {
    if (!isEmail(email.val()) || !isValidPassword(password.val())) {
        return false;
    } else   {
        return (confirmation.length > 0 && arePasswordsMatching(password.val(), confirmation.val()) );
    }
};

//end of validation