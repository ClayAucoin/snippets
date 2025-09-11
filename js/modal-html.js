dialogTitle = "Error";

function openHTMLModal() {
    $("htmlDialogLabel").textContent = dialogTitle;
    $("htmlDialogBody").innerHTML = dialogMessage;

    $('htmlModal').showModal();
}

$('closeHTMLModalBtn').addEventListener('click', () => {
    $('htmlModal').close();
    resetInterface();
});
