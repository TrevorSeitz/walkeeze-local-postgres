$(function() {
  attachListeners();
});

$(".new_dog").on("submit", function(e) {
  e.preventDefault();
  $.ajax({
    method: "POST",
    url: this.action,
    data: $(".new_dog :input")
  }).done(function(data) {
    console.log(data);
    // debugger;
    // $("div.returned_new_dog").append(`<li>${data}</li>`);
    $("div.returned_new_dog").append(
      `<ul>
        <h3>Congratulations on your new Dog ${data.name}!<h3>
        <li>Breed: ${data.breed}</li>
        <li>Age: ${data.age}</li>
        <li>Notes: ${data.notes}</li>
        <p></p>
        </ul>
        <p>Do you have any more new dogs?</p>`
    );
  });
});
// next listener here
