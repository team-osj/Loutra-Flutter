import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/model/model.dart';
import 'package:osj_flutter/view_model/get_status.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Future<Osj>? future;

  @override
  void initState() {
    super.initState();
    future = getStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('성공');
            } else if (snapshot.hasError) {
              return Text('에ㅔ러');
            }
            else return CircularProgressIndicator();
          }),
    );
  }
}
