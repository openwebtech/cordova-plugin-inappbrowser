var form = document.getElementById('form');
var optionsForm = document.getElementById('optionForm');
var button = document.getElementById('button');
button.addEventListener('click', openIAB);
function openIAB() {
    var optionsData = new FormData(optionsForm);
    var options = [];
    for(var pair of optionsData.entries()) {
        options.push(`${pair[0]}=${pair[1]}`);
    }

    cordova.InAppBrowser.open(form.url.value, form.target.value, options.join(','));
}
