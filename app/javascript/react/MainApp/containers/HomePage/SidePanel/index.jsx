import React from "react";
import Button from '@material-ui/core/Button';
import "./style.scss";

export const SidePanel = () => {
  return (
   <div className="panel-container">
    <img className="panel_image" src="https://res.cloudinary.com/a1986/image/upload/v1586258683/Screenshot_2020-04-07_13.24.23_cgmnii.png"></img>
    <div className="sidepanel_div">
        <a className="link" href="/posts/new"><Button id="sidepanel_button" variant="contained" color="primary">Create a Post</Button></a>
    </div>
   </div>
  );
};
