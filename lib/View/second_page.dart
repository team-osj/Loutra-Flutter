import 'package:flutter/material.dart';
import 'package:osj_flutter/model/list_model.dart';
import 'package:osj_flutter/Widget/custom_row_buttons.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key, required this.osjList}) : super(key: key);
  OsjList osjList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        customRowButtons(
          context,
          osjList.tests![16].id.toString(),
          osjList.tests![16].deviceType.toString(),
          osjList.tests![16].state.toInt(),
          osjList.tests![16].alive.toInt(),
          osjList.tests![24].id.toString(),
          osjList.tests![24].deviceType.toString(),
          osjList.tests![24].state.toInt(),
          osjList.tests![24].alive.toInt(),
        ),
        customRowButtons(
          context,
          osjList.tests![17].id.toString(),
          osjList.tests![17].deviceType.toString(),
          osjList.tests![17].state.toInt(),
          osjList.tests![17].alive.toInt(),
          osjList.tests![25].id.toString(),
          osjList.tests![25].deviceType.toString(),
          osjList.tests![25].state.toInt(),
          osjList.tests![25].alive.toInt(),
        ),
        customRowButtons(
          context,
          osjList.tests![18].id.toString(),
          osjList.tests![18].deviceType.toString(),
          osjList.tests![18].state.toInt(),
          osjList.tests![18].alive.toInt(),
          osjList.tests![26].id.toString(),
          osjList.tests![26].deviceType.toString(),
          osjList.tests![26].state.toInt(),
          osjList.tests![26].alive.toInt(),
        ),
        customRowButtons(
          context,
          osjList.tests![19].id.toString(),
          osjList.tests![19].deviceType.toString(),
          osjList.tests![19].state.toInt(),
          osjList.tests![19].alive.toInt(),
          osjList.tests![27].id.toString(),
          osjList.tests![27].deviceType.toString(),
          osjList.tests![27].state.toInt(),
          osjList.tests![27].alive.toInt(),
        ),
        customRowButtons(
          context,
          osjList.tests![20].id.toString(),
          osjList.tests![20].deviceType.toString(),
          osjList.tests![20].state.toInt(),
          osjList.tests![20].alive.toInt(),
          osjList.tests![28].id.toString(),
          osjList.tests![28].deviceType.toString(),
          osjList.tests![28].state.toInt(),
          osjList.tests![28].alive.toInt(),
        ),
        customRowButtons(
          context,
          osjList.tests![21].id.toString(),
          osjList.tests![21].deviceType.toString(),
          osjList.tests![21].state.toInt(),
          osjList.tests![21].alive.toInt(),
          osjList.tests![29].id.toString(),
          osjList.tests![29].deviceType.toString(),
          osjList.tests![29].state.toInt(),
          osjList.tests![29].alive.toInt(),
        ),
        customRowButtons(
          context,
          osjList.tests![22].id.toString(),
          osjList.tests![22].deviceType.toString(),
          osjList.tests![22].state.toInt(),
          osjList.tests![22].alive.toInt(),
          osjList.tests![30].id.toString(),
          osjList.tests![30].deviceType.toString(),
          osjList.tests![30].state.toInt(),
          osjList.tests![30].alive.toInt(),
        ),
        customRowButtons(
          context,
          osjList.tests![23].id.toString(),
          osjList.tests![23].deviceType.toString(),
          osjList.tests![23].state.toInt(),
          osjList.tests![23].alive.toInt(),
          'null',
          'null',
          0,
          0,
        ),
      ],
    );
  }
}
