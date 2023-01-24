import { AppContext } from "../App";
import React, { useContext, useEffect } from "react";

function LatestImage() {
  const { latestRecipe, setLatestRecipe } = useContext(AppContext);

  useEffect(() => {
    fetch("http://localhost:3000/latest")
      .then((response) => response.json())
      .then((data) => {
        setLatestRecipe(data.image_url);
      })
      .catch((error) => console.error(error));
  }, [latestRecipe]);

  return (
    <div>
      <img src={latestRecipe} alt="latest recipe" className="latest-image" />
    </div>
  );
}

export default LatestImage;
