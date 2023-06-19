import 'package:flutter/material.dart';
import 'package:lotura/model/osj_list.dart';
import 'package:lotura/Widget/custom_row_buttons.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key, required this.osjList}) : super(key: key);
  OsjList osjList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i = 0; i <= 7; i++)
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
      ],
    );
  }
}
