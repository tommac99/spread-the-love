import React, { useState, useEffect } from "react";
import { Title } from '../Title'
import { CardContent } from '../CardContent'
import { PostInformation } from '../PostInfo'




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


  const oneDay = 1000 * 60 * 60 * 24;
  let array = ["Volunteering", "Paid", "Trade"]

  return (
    <div className="jobs-container">
      {jobs.map((job, index)=>{
        return(
         <div key={index} className="cards">
          <div className="small_container">
            <CardContent name={job.user_name}/>
            <div className="post_information">
              <Title title={job.title} job={job.category} group={job.group}category={array}/>
              <PostInformation id={job.id} location={job.location}
              date={Math.ceil((new Date - new Date(job.date))/oneDay)}/>
            </div>
          </div>
         </div>
        )
      })}
    </div>
  );
};

