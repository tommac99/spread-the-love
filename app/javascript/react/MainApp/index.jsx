import React from "react";
import { BrowserRouter as Router } from "react-router-dom";
import { routes } from "./routes";
import { renderRoutes } from "react-router-config";
import { Navbar } from "./components/Navbar";

export const MainApp = () => {
  return (
    <>
      <Navbar />
      <Router>
        <div style={{ minHeight: "100vh" }}>{renderRoutes(routes)}</div>
      </Router>
    </>
  );
};
