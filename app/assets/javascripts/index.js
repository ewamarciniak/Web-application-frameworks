var displayResponse = function(response) { // Display fetched content from the server on the page
    $("#loading").hide();  // hides the loading bar

    var content = $("#content"); // fetch the content div

    var filteredResponse = $(response).find("#content").children();
    console.log(filteredResponse);
    content.html(filteredResponse); // write the new content in it
    content.find("a").on("click", loadAjax); // finds every link in it and monitor the click events
    content.find("form").on("submit", submitForm); // findex every form in it and monitor the submit events
}


var submitForm = function(e) { // 1. When a form is submitted
    e.preventDefault(); // cancel the default action, page refresh

    $(this).find("input[type=submit]").attr("disabled", "disabled"); // find the submit button and disable it
    $(this).off("submit"); // remove the submission event from the form

    $("#loading").show(); // display the loading bar


    var url = $(this).attr("action"); // retrieve the action attribute from the submitted form
    var method = $(this).attr("method"); // retrive the method attribute from the submitted form
    var data = {}; // creates an empty data json object to hold all the values from the submitted form

    $(this).find("input, select").each(function() { // for each input / select / radio in the submitted form
        var name = $(this).attr("name"); // find the name of the input
        var value = $(this).val(); // find the value of the input

        data[name] = value; // add it to the data object
    });

    $.ajax({ // start an ajax request
        url: url, // to the following url
        type: method, // with this http verb (get / post / put / delete)
        data: data, // with these values from the form
        success: displayResponse // when it is done, display the content fetched
    });
}

var loadAjax = function(e) { // When a link is clicked
    e.preventDefault(); // cancel the default action, page refresh

    $("#loading").show(); // display the loading bar

    var url = $(this).attr("href"); // retrive the href attribute from the clicked link
    var method = $(this).attr("data-method") || "get"; // retrive the data-method attribute from the clicked link or get if the attribute is empty

    if(method === "delete") { // if the method is delete
        $(this).parents("tr").remove(); // remove the row from the page
    }

    $.ajax({ // start an ajax request
        url: url, // to the following url
        type: method, // with this http verb (get / post / put / delete)
        success: displayResponse // when it is done, display the content fetched
    });
}

$("#nav a, .side-nav a").on("click", loadAjax); // monitor the navigation bar for click events