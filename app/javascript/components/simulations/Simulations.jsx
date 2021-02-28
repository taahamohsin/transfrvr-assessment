import React, { Fragment, useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { Alert, Button, Modal, Select, Spin, Result, Table } from "antd";

import Layout from "../layout/Layout.jsx";

const Simulations = () => {
  const [simulationsData, setSimulationsData] = useState(null);
  const [simulationRetrevalError, setSimulationRetrevalError] = useState(false);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [availableSimulationsData, setAvailableSimulationsData] = useState(null);
  const [selectedSimulations, setSelectedSimulations] = useState([]);
  const [simulationAssignmentError, setSimulationAssignmentError] = useState(false);
  const params = useParams();

  const getSimulationsData = async () => {
    try {
      const response = await fetch(`/clients/${params.clientId}`);
      const data = await response.json();
      setSimulationsData(data.client.simulations);
      setSimulationRetrevalError(false);
    } catch (e) {
      setSimulationRetrevalError(true);
    }
  };

  const getAvailableSimulationsData = async () => {
    try {
      const response = await fetch("/simulations");
      const data = await response.json();
      const takenSimulations = new Set();
      simulationsData.forEach(simulation => {
        takenSimulations.add(simulation.simulationId);
      });
      const availableSimulations = data.simulations.filter(
        simulation => !takenSimulations.has(simulation.simulationId)
      );
      setAvailableSimulationsData(availableSimulations);
    } catch (e) {
      console.log(e);
    }
  };

  const assignSimulations = async simulationIds => {
    try {
      await fetch(`/clients/${params.clientId}/simulations`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ simulationIds })
      });
      setSelectedSimulations([]);
      setSimulationsData(null);
      setIsModalOpen(false);
      setSimulationAssignmentError(false);
    } catch (e) {
      setSimulationAssignmentError(true);
    }
  };

  useEffect(
    () => {
      if (!simulationsData) getSimulationsData();
    },
    [simulationsData]
  );

  const columns = [
    {
      title: "Name",
      dataIndex: "name"
    }
  ];

  const onCloseModal = () => {
    setSelectedSimulations([]);
    setIsModalOpen(false);
  };

  const { Option } = Select;

  return (
    <Layout>
      {!simulationsData && !simulationRetrevalError && (
        <Spin
          size="large"
          style={{
            width: '100%',
            position: 'absolute',
            top: '50%'
          }}
        />)
      }
      {simulationRetrevalError &&
        <Result
          title="Error"
          subTitle="Sorry, something went wrong."
          extra={
            <Button type="primary" onClick={getSimulationsData}>Reload</Button>
          }
        />}
      {simulationsData &&
        <Fragment>
          <Table
            columns={columns}
            dataSource={
              simulationsData &&
                simulationsData.map(simulation => ({
                  ...simulation,
                  key: simulation.simulationId
                }))
            }
          />
          <Button
            type="primary"
            onClick={() => {
              getAvailableSimulationsData();
              setIsModalOpen(true);
            }}
          >
            Assign Simulations
          </Button>
          <Modal
            title="Assign Simulations"
            visible={isModalOpen}
            onOk={() => assignSimulations(selectedSimulations)}
            onCancel={onCloseModal}
            okText="Assign"
          >
            {simulationAssignmentError && (
              <Alert
                message="Error"
                description="There was an error completing your request. Please try again later."
                type="error"
                onClose={() => setSimulationAssignmentError(false)}
                closable
              />
            )}
            <Select
              mode="multiple"
              placeholder="Please select simulations to assign to the client"
              style={{ width: "100%" }}
              onChange={value => setSelectedSimulations(value)}
              value={selectedSimulations}
              allowClear
            >
              {availableSimulationsData &&
                availableSimulationsData.map(simulation => (
                  <Option key={simulation.simulationId} value={simulation.simulationId}>
                    {simulation.name}
                  </Option>
                ))}
            </Select>
          </Modal>
        </Fragment>}
    </Layout>
  );
};

export default Simulations;
