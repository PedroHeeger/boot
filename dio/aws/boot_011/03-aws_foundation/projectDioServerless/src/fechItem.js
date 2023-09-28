"use strict";

const AWS = require("aws-sdk");

const fechItem = async (event) => {

    const dynamodb = new AWS.DynamoDB.DocumentClient();
    const {id} = event.pathParameters

    let item;

    try {
        const result = await dynamodb.get({
            TableName: "ItemTableNew",
            Key: {id}
        }).promise();

        item = result.Item;

    } catch (erro) {
        console.log(error)
    }

    return {
        statusCode: 200,
        body: JSON.stringify(item),
    };
}

module.exports = {
    handler: fechItem,
};