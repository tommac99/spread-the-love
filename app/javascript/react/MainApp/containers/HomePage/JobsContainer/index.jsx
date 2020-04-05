import React, { useState, useEffect } from "react";

import "./style.scss";

export const JobsContainer = () => {
  const [jobs, setJobs] = useState([]);

  useEffect(() => {
    getPosts();
  }, []);

  const getPosts = () => {
    fetch("/api/v1/posts.json")
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        setJobs(data);
      })
      .catch(console.error);
  };

  const renderJobs = () => {
    return jobs.map((job, index) => {
      return <p key={index}>{job.title}</p>;
    });
  };

  return (
    <div className="jobs-container">
      <h1>JobsContainer</h1>
      {renderJobs()}
    </div>
  );
};
