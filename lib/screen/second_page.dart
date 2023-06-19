import 'package:flutter/material.dart';
import 'package:lotura/model/osj_list.dart';
import 'package:lotura/Widget/custom_row_buttons.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key, required this.osjList}) : super(key: key);
  OsjList osjList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i = 16; i <= 22; i++)
          customRowButtons(
            context,
            osjList.tests![i].id.toString(),
            osjList.tests![i].deviceType.toString(),
            osjList.tests![i].state.toInt(),
            osjList.tests![i].alive.toInt(),
            osjList.tests![i + 8].id.toString(),
            osjList.tests![i + 8].deviceType.toString(),
            osjList.tests![i + 8].state.toInt(),
            osjList.tests![i + 8].alive.toInt(),
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
