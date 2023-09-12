const AWS = require("aws-sdk");

const dynamo = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event, context) => {
  let body;
  let statusCode = 200;
  const headers = {
    "Content-Type": "application/json"
  };
  
  
  let requestJSON;

  try {
    switch (event.routeKey) {
      // Realizando um post no banco de dados
      case "POST /items":
        requestJSON = JSON.parse(event.body);
        await dynamo
          .put({
            TableName: "Product1",
            Item: {
              id: requestJSON.id,
              price: requestJSON.price,
              name: requestJSON.name
            }
          })
          .promise();
        body = `Put item ${requestJSON.id}`;
        break;

      // Realizando uma exclusão no banco de dados
      case "DELETE /items/{id}":
        console.log(event.pathParameters.id)
        await dynamo
          .delete({
            TableName: "Product1",
            Key: {
              id: event.pathParameters.id
            }
          })
          .promise();
        body = `Deleted item ${event.pathParameters.id}`;
        break;

      // Realizando um seleção no banco de dados pela chave primária
      case "GET /items/{id}":
        body = await dynamo
          .get({
            TableName: "Product1",
            Key: {
              id: event.pathParameters.id
            }
          })
          .promise();
        break;

      // Realizando um seleção no banco de dados
      case "GET /items":
        body = await dynamo.scan({ TableName: "Product1" }).promise();
        break;

      // Realizando uma atualização no banco de dados
      case "PUT /items/{id}":
         requestJSON = JSON.parse(event.body);
        await dynamo
          .update({
            TableName: "Product1",
            Key: {
              id: event.pathParameters.id
            },
            UpdateExpression: 'set price = :r',
            ExpressionAttributeValues: {
             ':r': requestJSON.price,
            },
          })
          .promise();
        body = `Put item ${event.pathParameters.id}`;
        break;

      // Definindo uma mensagem de erro
      default:
        throw new Error(`Unsupported route: "${event.routeKey}"`);
    }
  } catch (err) {
    statusCode = 400;
    body = err.message;
  } finally {
    body = JSON.stringify(body);
  }

  // Retornando informações
  return {
    statusCode,
    body,
    headers
  };
};