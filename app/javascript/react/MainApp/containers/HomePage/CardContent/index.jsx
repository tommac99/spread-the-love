import React from 'react'
import AccessAlarmIcon from '@material-ui/icons/AccessAlarm';
import MailOutlineIcon from '@material-ui/icons/MailOutline';
import { makeStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import RoomIcon from '@material-ui/icons/Room';

import "./style.scss";

export const CardContent = (props) =>{
  return (
   <div>
     <div >
       <img className="post_image"src="https://source.unsplash.com/Ds0ZIA5gzc4/"/>
     </div>
     <div>
       <p className="name">{props.name}</p>
     </div>
   </div>
  )
}



