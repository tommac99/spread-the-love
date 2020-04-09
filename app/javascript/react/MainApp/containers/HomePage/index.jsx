import React from "react";
import { JobsContainer } from "./JobsContainer";
import { SidePanel } from "./SidePanel";

import "./style.scss";

export const HomePage = () => {
  return (
    <div className="home-container">
      <div className="side-container">
        <SidePanel />
      </div>
      <div className="jobs-container">
        <JobsContainer />
      </div>
    </div>
  );
};
