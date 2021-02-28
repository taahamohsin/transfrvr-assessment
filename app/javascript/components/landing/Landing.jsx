import React, { useEffect, useState } from 'react';
import { useHistory } from 'react-router-dom';
import { Button, Result, Spin, Table } from 'antd';

import Layout from '../layout/Layout.jsx';

const Landing = () => {
  const [clients, setClients] = useState(null);
  const [transformedClients, setTransformedClients] = useState(null);
  const [hasCallFailed, setHasCallFailed] = useState(false);
  const history = useHistory();

  const getClientData = async () => {
    try {
      const response = await fetch('/clients');
      const data = await response.json();
      setClients(data && data.clients);
      setHasCallFailed(false);
    } catch (e) {
      setHasCallFailed(true);
    }
  };

  useEffect(() => {
    getClientData();
  }, []);

  const columns = [
    {
      title: 'Name',
      dataIndex: 'name',
    },

    {
      title: 'Code',
      dataIndex: 'code',
    },
  ];

  useEffect(() => {
    setTransformedClients(
      clients && clients.map((client, index) => ({
        key: index,
        ...client
      }))
    );
  }, [clients]);

  return (
    <Layout>
      {!transformedClients && !hasCallFailed && (
        <Spin
          size="large"
          style={{
            width: '100%',
            position: 'absolute',
            top: '50%'
          }}
        />)
      }
      {hasCallFailed && (
         <Result
          title="Error"
          subTitle="Sorry, something went wrong."
          extra={<Button type="primary" onClick={getClientData}>Reload</Button>}
       />)}
      {transformedClients && (
          <Table
            onRow={(record) => {
              return {
                onClick: _ => {
                  history.push(`/clients/${record.key + 1}`);
                }
              }
            }}
            columns={columns}
            dataSource={transformedClients}
          />
      )}
    </Layout>
  );
};

export default Landing;