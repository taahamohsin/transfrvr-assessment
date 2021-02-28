import React from 'react';
import { BrowserRouter, Route } from 'react-router-dom';
import { PageHeader } from 'antd';

import Landing from './landing/Landing.jsx';
import Simulations from './simulations/Simulations.jsx';

export default () => {
 return (
    <BrowserRouter>
      <PageHeader
        title="Simulation Training Management System"
        backIcon={false}
      />
      <Route to="/clients/:clientId" exact>
        <Simulations />
      </Route>
      <Route to="/" exact>
        <Landing />
      </Route>
  </BrowserRouter>
 );
};