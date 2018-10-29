// load scheduled walks for a dog
function loadWalks() {
  $("a.load_walks").on("click", function(e) {
    e.preventDefault();
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(data) {
      if (data.length === 0) {
        $("div.walks").append(`<li>There are no walks scheduled.</li>`);
      } else {
        data.map(function(w) {
          $("div.walks")
            .empty()
            .append(`<li>${w.date} @ ${w.time} with ${w.walker_name}</li>`);
        });
      }
    });
  });
}
