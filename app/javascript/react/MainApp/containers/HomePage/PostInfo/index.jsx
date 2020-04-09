import React from "react";
import AccessAlarmIcon from '@material-ui/icons/AccessAlarm';
import MailOutlineIcon from '@material-ui/icons/MailOutline';
import { makeStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import RoomIcon from '@material-ui/icons/Room';

import './style.scss'
export const PostInformation = (props) => {
  return (
   <div className="post_status">
        <div className="location">
            <p className="post_date">
                <AccessAlarmIcon fontSize="large" /> Posted {props.date} day ago</p>
            <p className="post_location">
                <RoomIcon fontSize="large" />{props.location}</p>
        </div>
        <div className="post_button">
            <p>{props.group}</p>
            <a className="link" href={/posts/ + props.id} onClick={props.click}><Button variant="contained" color="primary"><MailOutlineIcon fontSize="small"/>Get in Touch</Button></a>
        </div>
    </div>
  )
};

