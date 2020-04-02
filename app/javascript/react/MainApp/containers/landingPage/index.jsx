import React from "react";

export const LandingPage = () => {
  const getPosts = () => {
    fetch("/posts.json")
      .then(response => response.json())
      .then(data => {
        console.log(data);
      })
      .catch(console.error);
  };

  return (
    <div>
      <h1>Landing Page</h1>
      {getPosts()}
    </div>
  );
};
