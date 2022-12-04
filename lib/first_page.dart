import 'package:flutter/material.dart';
import 'package:osj_flutter/model/list_model.dart';
import 'package:osj_flutter/view_model/get_status.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Future<OsjList>? future;

  @override
  void initState() {
    super.initState();
    future = getStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<OsjList>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text('성공');
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
