// add a note to a scheduled walk
function dogNote() {
  $(".dog_note").on("submit", function(e) {
    e.preventDefault();
    $.ajax({
      method: "patch",
      url: this.action,
      data: {
        dog_id: $(this)
          .find("#dog_id")
          .val(),
        note: $(this)
          .find("#note")
          .val()
      }
    }).done(function(data) {
      $("div.dog_notes")
        .empty()
        .append(
          `<ul>
      Note Added!
        <li>Name: ${data.dog_name}</li>
        <li>Note: ${data.dog_walk.notes}</li>
      </ul>`
        );
    });
  });
}
