const express = require("express");
var http = require("http");

const app = express();
const port = process.env.PORT || 3000;

var server = http.createServer(app);
const mongoose = require("mongoose");

var io = require("socket.io")(server);

///Middleware
app.use(express.json());

///Connect to MongoDB
const dbPasssword = encodeURIComponent("Jenil@555");
const DB = `mongodb+srv://jenil555:${dbPasssword}@scribbleclone.wanxb.mongodb.net/?retryWrites=true&w=majority&appName=ScribbleClone`;
mongoose.connect(DB).then(() => console.log("Connection Successful")).catch((e) => console.log(e));

server.listen(port, "0.0.0.0", () => console.log("Server Started and running on port " + port));