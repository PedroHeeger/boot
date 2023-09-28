"use strict";

module.exports.hello = async (event) => {
    return {
        statusCode: 200,
        body: JSON.stringify(
            {
                message: "Go Serverless v2.01! Your function executed sucessfully!",
                input: event,
            },
            null,
            2
        )
    }
}