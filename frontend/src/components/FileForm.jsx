import { AppContext } from "../App";
import React, { useContext } from "react";

function FileForm() {
  const { latestRecipe, setLatestRecipe } = useContext(AppContext);

  function handleSubmit(event) {
    event.preventDefault();
    const data = new FormData();

    data.append("recipe[title]", event.target.title.value);
    data.append("recipe[description]", event.target.description.value);
    data.append("recipe[instruction]", event.target.instruction.value);
    data.append("recipe[image]", event.target.image.files[0]);
    submitToAPI(data);
  }
  function submitToAPI(data) {
    fetch("http://localhost:3000/recipes", {
      method: "POST",
      body: data,
    })
      .then((response) => response.json())
      .then((data) => {
        setLatestRecipe(data.image_url);
      })
      .catch((error) => console.error(error));
  }
  return (
    <div>
      <h1>File Form</h1>
      <form onSubmit={(e) => handleSubmit(e)}>
        <label htmlFor="title">Title</label>
        <input type="text" name="title" id="title" />
        <br />
        <label htmlFor="description">Description</label>
        <input type="text" name="description" id="description" />
        <br />

        <label htmlFor="instruction">Instruction</label>
        <input type="text" name="instruction" id="instruction" />
        <br />

        <label htmlFor="image">Image</label>
        <input type="file" name="image" id="image" />
        <br />

        <button type="submit">Create Post</button>
      </form>
    </div>
  );
}

export default FileForm;
