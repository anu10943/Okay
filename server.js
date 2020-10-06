// Setting up the server and linking it to socket.io
const express = require('express');
const app = express();
const server = require('http').createServer(app);
const io = require('socket.io')(server);
 

const PORT = process.env.PORT || 3000;

// Importing user-defined events for socket as a map
const events = require('./constants');
 

app.get('/', (req, res) => {
    res.send("Server is running");

    // console.log("hey");


});

io.on("connection", (socket) => {

    initializeOnConnect(socket);
});



const initializeOnConnect = (socket) => {
    // When a user logs in

 
    var roomID =  socket.handshake.query.roomID;
 

    socket.join(roomID);
    // When the users sends a message
    onMessage(socket);
    // When the user logs out
    disposeOnDisconnect(socket,roomID);
}

const onMessage = (socket) => {
    // console.log("yo out",socket.rooms);
    socket.on('send_message', (mes) => {
        // console.log("yo in ");
        let mes=JSON.stringify(mes);
        let message=JSON.parse(message);
        let toID = message.receiverChatID;
        let fromID = message.senderChatID;
        let content = message.content;
        let time=message.time;
         
        // let check_online = checkOnline(toID);

        let response = {
            "content": content,
            "senderChatID": fromID,
            "receiverChatID": toID,
            "time":time
        } ;
        
        
            io.sockets.in(toID).emit('receive_message', response);
        
    })
    
}

 
const disposeOnDisconnect = (socket,roomID) => {
    socket.on(events.ON_DISCONNECT, () => {
        socket.leave(roomID);
         
    });

}

server.listen(PORT, () => {
 });
