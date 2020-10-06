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
    console.log(JSON.stringify(socket.id));
    initializeOnConnect(socket);
});



const initializeOnConnect = (socket) => {
    // When a user logs in

 
    const roomID =  socket.handshake.query.roomID;
 
    console.log(JSON.stringify(socket.id)+"room id"+roomID);
    socket.join(roomID);
    console.log(JSON.stringify(socket.id)+"room id after join"+roomID);
    // When the users sends a message
    onMessage(socket);
    // When the user logs out
    disposeOnDisconnect(socket,roomID);
}

const onMessage = (socket) => {
    // console.log("yo out",socket.rooms);
    socket.on('send_message', (message) => {
        // console.log("yo in ");
        console.log("yo in ");
        console.log(message);
           
        let toID = message.receiverChatID;
        let fromID = message.senderChatID;
        let content = message.content;
        let time=message.time;
        console.log(JSON.stringify(socket.id)+"msg to"+toID);
         
        // let check_online = checkOnline(toID);

        let response = {
            "content": content,
            "senderChatID": fromID,
            "receiverChatID": toID,
            "time":time
        } ;
        let res=JSON.stringify(response);
        let resp=JSON.parse(res);
         console.log(res);
        console.log(resp);
        console.log("b4 receive");
            io.sockets.in(toID).emit('receive_message', resp);
        console.log("received?");
    })
    
}

 
const disposeOnDisconnect = (socket,roomID) => {
    socket.on(events.ON_DISCONNECT, () => {
        console.log(roomID+' user disconncected'+JSON.stringify(socket.id));
        socket.leave(roomID);
        
         
    });

}

server.listen(PORT, () => {
 });
