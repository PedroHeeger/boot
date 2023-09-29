"use strict";

const hello = async (event) => {
    return {
        statusCode: 200,
        body: JSON.stringify({
                message: "Go Serverless v3! Your function executed sucessfully!",
                input: event,
            },
            null,
            2
        ),
    };
};

module.exports = {
    handler:hello
};