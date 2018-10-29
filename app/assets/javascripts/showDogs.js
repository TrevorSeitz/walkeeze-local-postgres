// show individual dog properties
function showDogs() {
  $(".show_dog").on("click", function(e) {
    e.preventDefault();
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(data) {
      $("div.dog")
        .empty()
        .append(
          `${data.dog.name}
    <li>Breed: ${data.dog.breed}</li>
    <li>Age: ${data.dog.age}</li>
    <li>Notes: ${data.dog.notes}</li>`
        );
    });
  });
}
