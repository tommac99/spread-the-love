import React from "react";
import { BrowserRouter as Router } from "react-router-dom";
import { routes } from "./routes";
import { renderRoutes } from "react-router-config";

export const MainApp = () => {
  return (
    <>
      <Router>
        <div style={{ minHeight: "100vh" }}>{renderRoutes(routes)}</div>
      </Router>
    </>
  );
};
