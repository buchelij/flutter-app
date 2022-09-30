import 'package:flutter/material.dart';
import 'package:ndsn/shared/constants.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _titleEditingController = new TextEditingController();

  final TextEditingController _contentEditingController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
          children: <Widget>[
            TextFormField(
              decoration: textInputDecoration.copyWith(
                hintText: "Post Title",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 2.0)
                ),
              ),
              //validator: (val) => val.length < 1 ? 'This field cannot be blank' : null,
              controller: _titleEditingController,
            ),

            SizedBox(height: 20.0),

            TextFormField(
              style: TextStyle(
                //color: Colors.orange,
                //backgroundColor: Colors.blueGrey
              ),
              maxLines: 20,
              decoration: textInputDecoration.copyWith(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 2.0)
                ),
                hintText: "Start writing here...",
              ),
              //validator: (val) => val.length < 1 ? 'This field cannot be blank' : null,
              controller: _contentEditingController,
            ),

            SizedBox(height: 20.0),

            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: RaisedButton(
                  elevation: 0.0,
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  child: Text('Publish', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  onPressed: () {

                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
