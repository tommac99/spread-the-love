import React, { useState, useEffect } from "react";
import { Title } from "../Title";
import { CardContent } from "../CardContent";
import { PostInformation } from "../PostInfo";
import { Check } from "../Tabs";
import { makeStyles } from "@material-ui/core/styles";
import Paper from "@material-ui/core/Paper";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import Button from "@material-ui/core/Button";
import "./style.scss";

const useStyles = makeStyles({
  root: {
    flexGrow: 1,
    maxWidth: 500,
  },
});

export const JobsContainer = () => {
  useEffect(() => {
    allPosts();
  }, []);

  const [jobs, setJobs] = useState([]);

  const classes = useStyles();
  const [value, setValue] = React.useState(0);

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  const allPosts = () => {
    fetch(`/api/v1/posts.json`)
      .then((response) => response.json())
      .then((data) => {
        setJobs(data);
      })
      .catch(console.error);
  };

  const changeIndex = (event, category) => {
    if (category == "All") {
      fetch(`/api/v1/posts.json`)
        .then((response) => response.json())
        .then((data) => {
          setJobs(data);
        })
        .catch(console.error);
    } else {
      fetch(`/api/v1/posts/${category}.json`)
        .then((response) => response.json())
        .then((data) => {
          setJobs(data);
        })
        .catch(console.error);
    }
  };

  const oneDay = 1000 * 60 * 60 * 24;
  let array = ["Volunteering", "Paid", "Trade"];

  return (
    <div className="jobs-inner-container">
      <div className="buttons">
        <Paper square className={classes.root}>
          <Tabs
            value={value}
            onChange={handleChange}
            variant="fullWidth"
            indicatorColor="primary"
            textColor="primary"
            aria-label="icon tabs example"
          >
            <Tab
              label="All"
              onClick={() => {
                changeIndex(event, "All");
              }}
            />
            <Tab
              label="Trade"
              onClick={() => {
                changeIndex(event, "Trade");
              }}
            />
            <Tab
              label="Paid"
              onClick={() => {
                changeIndex(event, "Paid");
              }}
            />
            <Tab
              label="Volunteering"
              onClick={() => {
                changeIndex(event, "Volunteering");
              }}
            />
          </Tabs>
        </Paper>
      </div>
      {jobs.map((job, index) => {
        return (
          <div key={index} className="cards">
            <div className="small_container">
              <CardContent name={job.user_name} />
              <div className="post_information">
                <Title
                  title={job.title}
                  job={job.category}
                  group={job.group}
                  category={array}
                />
                <PostInformation
                  id={job.id}
                  location={job.location}
                  date={Math.ceil((new Date() - new Date(job.date)) / oneDay)}
                />
              </div>
            </div>
          </div>
        );
      })}
    </div>
  );
};
