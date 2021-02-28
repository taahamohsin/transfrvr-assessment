import React, { Fragment } from 'react';
import { PageHeader } from 'antd';

export default
  ({ children }) => {
    const defaultTitle = 'TRANSFRVR Simulation Manager';

    const getTitle = () => {
      if (location.pathname === '/') {
        return defaultTitle;
      }
      if (location.pathname.match(/\/clients\/[0-9]+/)) {
        return 'Client Simulations';
      }
    }

    return (
      <Fragment>
        <PageHeader title={getTitle()} />
        {children}
      </Fragment>
    );
  }