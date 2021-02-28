
import React from 'react';
import ReactDOM from 'react-dom';
import {
  BrowserRouter as Router,
  Switch,
  Route,
} from 'react-router-dom';
import 'antd/dist/antd.css'

import Landing from '../components/landing/Landing.jsx';
import Simulation from '../components/simulations/Simulations.jsx';

ReactDOM.render(
  <Router>
    <Switch>
      <Route path="/clients/:clientId" exact>
        <Simulation />
      </Route>
      <Route path="/">
        <Landing />
      </Route>
    </Switch>
  </Router>, document.getElementById('root'),
);
