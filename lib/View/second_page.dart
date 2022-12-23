import 'package:flutter/material.dart';
import 'package:osj_flutter/model/list_model.dart';
import 'package:osj_flutter/Widget/custom_row_buttons.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key, required this.future}) : super(key: key);

  Future<OsjList>? future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              customRowButtons(
                  context,
                  snapshot.data!.tests![16].id.toString(),
                  snapshot.data!.tests![16].deviceType.toString(),
                  snapshot.data!.tests![16].state!.toInt(),
                  snapshot.data!.tests![24].state.toString(),
                  snapshot.data!.tests![24].deviceType.toString(),
                  snapshot.data!.tests![24].state!.toInt()),
              customRowButtons(
                  context,
                  snapshot.data!.tests![17].id.toString(),
                  snapshot.data!.tests![17].deviceType.toString(),
                  snapshot.data!.tests![17].state!.toInt(),
                  snapshot.data!.tests![25].id.toString(),
                  snapshot.data!.tests![25].deviceType.toString(),
                  snapshot.data!.tests![25].state!.toInt()),
              customRowButtons(
                  context,
                  snapshot.data!.tests![18].id.toString(),
                  snapshot.data!.tests![18].deviceType.toString(),
                  snapshot.data!.tests![18].state!.toInt(),
                  snapshot.data!.tests![26].id.toString(),
                  snapshot.data!.tests![26].deviceType.toString(),
                  snapshot.data!.tests![26].state!.toInt()),
              customRowButtons(
                  context,
                  snapshot.data!.tests![19].id.toString(),
                  snapshot.data!.tests![19].deviceType.toString(),
                  snapshot.data!.tests![19].state!.toInt(),
                  snapshot.data!.tests![27].id.toString(),
                  snapshot.data!.tests![27].deviceType.toString(),
                  snapshot.data!.tests![27].state!.toInt()),
              customRowButtons(
                  context,
                  snapshot.data!.tests![20].id.toString(),
                  snapshot.data!.tests![20].deviceType.toString(),
                  snapshot.data!.tests![20].state!.toInt(),
                  snapshot.data!.tests![28].id.toString(),
                  snapshot.data!.tests![28].deviceType.toString(),
                  snapshot.data!.tests![28].state!.toInt()),
              customRowButtons(
                  context,
                  snapshot.data!.tests![21].id.toString(),
                  snapshot.data!.tests![21].deviceType.toString(),
                  snapshot.data!.tests![21].state!.toInt(),
                  snapshot.data!.tests![29].id.toString(),
                  snapshot.data!.tests![29].deviceType.toString(),
                  snapshot.data!.tests![29].state!.toInt()),
              customRowButtons(
                  context,
                  snapshot.data!.tests![22].id.toString(),
                  snapshot.data!.tests![22].deviceType.toString(),
                  snapshot.data!.tests![22].state!.toInt(),
                  snapshot.data!.tests![30].id.toString(),
                  snapshot.data!.tests![30].deviceType.toString(),
                  snapshot.data!.tests![30].state!.toInt()),
              customRowButtons(
                  context,
                  snapshot.data!.tests![23].id.toString(),
                  snapshot.data!.tests![23].deviceType.toString(),
                  snapshot.data!.tests![23].state!.toInt(),
                  snapshot.data!.tests![30].id.toString(),
                  snapshot.data!.tests![30].deviceType.toString(),
                  snapshot.data!.tests![30].state!.toInt()),
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
