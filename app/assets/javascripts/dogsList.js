// show the dogs scheduled for a walk
function createListOfDogs() {
  $(".walk_list").on("click", function(e) {
    e.preventDefault();
    $.ajax({
      method: "GET",
      url: this.href + ".json"
    }).done(function(data) {
      // debugger;
      let position = data.id;
      if (data.dogs.length > 0) {
        debugger;
        $("#dogs_list" + position).empty();
        $(".dog_list" + position)
          .empty()
          .append(
            `<p>The following dogs are booked for this walk!</p><ul>`,
            data.dogs.forEach(function(obj) {
              outerItem = document.getElementById("dogs_list" + position);
              var picked = (({ name, breed, age, user_id }) => ({
                name,
                breed,
                age,
                user_id
              }))(obj);
              var props = Object.values(picked);
              var current_dog = new Dog(props[0], props[1], props[2], props[3]);
              newListItem = document.createElement("li");
              // newdiv = document.createElement("div");
              newListItem.innerHTML = current_dog.render();
              outerItem.appendChild(newListItem);
              // newListItem.appendChild(newdiv);
            })
          );
      } else {
        $(".dog_list" + position)
          .empty()
          .append(`<p>There are no dogs booked for this walk!</p>`);
      }
    });
  });
}
