'use strict';
const express = require('express')



const app = express();
app.get('/hello-k8s', (req,res) => {
   res.send('Hello Kubernetes from NodeJS');
});

const PORT = 8080;
const HOST = '0.0.0.0';
app.listen(PORT, HOST, () =>
{ console.log(`Listening on ${HOST}:${PORT}`)});

