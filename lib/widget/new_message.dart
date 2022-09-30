import 'package:flutter/material.dart';
import 'package:ndsn/models/app_theme.dart';

class NewMessageWidget extends StatefulWidget {
  final String name;

  const NewMessageWidget({
    required this.name,
    Key ?key,
  }) : super(key: key);

  @override
  _NewMessageWidgetState createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final _controller = TextEditingController();
  String message = '';


  @override
  Widget build(BuildContext context) => Container(
        color: AppTheme.lightGrey,
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _controller,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor:AppTheme.white,
                  labelText: 'Type your message',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0),
                    gapPadding: 10,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                // onChanged: (value) => setState(() {
                //   message = value;
                // }),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              //onTap: message.trim().isEmpty ? null : sendMessage,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.ndsnPink,
                ),
                child: Icon(Icons.send, color: Colors.white),
              ),
            ),
          ],
        ),
      );
}