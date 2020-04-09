import React from 'react'
import './style.scss'

export const Title = (props) => {

  return (
   <div className="title_component">
     <h1 className="title">{props.title}</h1>
     <p className="group">{props.group}</p>
     <div className="list">
         {props.category.map((element,index) =>{
          {return props.job == element ?
            <p key={index}className="selected">{element}</p> : <p key={index}>{element}</p>
            }
          })
        }
   </div>
  </div>
)
}

