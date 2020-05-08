import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message,this.isMe,this.userId);
  final String message;
  final bool isMe;
  final String userId;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end: MainAxisAlignment.start,
      children : <Widget>[
        Container(
      decoration: BoxDecoration(
        color: isMe ?  Colors.grey : Theme.of(context).accentColor,
        borderRadius: BorderRadius.only(
          bottomLeft: !isMe ? Radius.circular(0):Radius.circular(12),
          bottomRight: isMe? Radius.circular(0):Radius.circular(12),
        )
        ,
      ),
      width: 140,
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: Column(
        children: <Widget>[
          FutureBuilder(
            future: Firestore.instance.collection('users').document(userId).get(),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Text('Loading..');
              }
              return Text(snapshot.data['username'],style: TextStyle(fontWeight: FontWeight.bold),);
            }
          ),
          Text(
            message,
            style: TextStyle(color: isMe ?  Colors.black : Theme.of(context).accentTextTheme.title.color),
          ),
        ],
      ),
    )

      ],
    );
  }
}
