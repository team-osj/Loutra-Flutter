import 'package:flutter/material.dart';
import 'package:lotura_flutter/Model/list_model.dart';
import 'package:lotura_flutter/View/Widget/custom_row_buttons.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key, required this.osjList}) : super(key: key);
  OsjList osjList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        customRowButton(
          context,
          osjList.tests![0].id.toString(),
          osjList.tests![0].deviceType.toString(),
          osjList.tests![0].state.toInt(),
          osjList.tests![0].alive.toInt(),
          ' ${osjList.tests![8].id}',
          osjList.tests![8].deviceType.toString(),
          osjList.tests![8].state.toInt(),
          osjList.tests![8].alive.toInt(),
        ),
        customRowButton(
          context,
          osjList.tests![1].id.toString(),
          osjList.tests![1].deviceType.toString(),
          osjList.tests![1].state.toInt(),
          osjList.tests![1].alive.toInt(),
          osjList.tests![9].id.toString(),
          osjList.tests![9].deviceType.toString(),
          osjList.tests![9].state.toInt(),
          osjList.tests![9].alive.toInt(),
        ),
        customRowButton(
          context,
          osjList.tests![2].id.toString(),
          osjList.tests![2].deviceType.toString(),
          osjList.tests![2].state.toInt(),
          osjList.tests![2].alive.toInt(),
          osjList.tests![10].id.toString(),
          osjList.tests![10].deviceType.toString(),
          osjList.tests![10].state.toInt(),
          osjList.tests![10].alive.toInt(),
        ),
        customRowButton(
          context,
          osjList.tests![3].id.toString(),
          osjList.tests![3].deviceType.toString(),
          osjList.tests![3].state.toInt(),
          osjList.tests![3].alive.toInt(),
          osjList.tests![11].id.toString(),
          osjList.tests![11].deviceType.toString(),
          osjList.tests![11].state.toInt(),
          osjList.tests![11].alive.toInt(),
        ),
        customRowButton(
          context,
          osjList.tests![4].id.toString(),
          osjList.tests![4].deviceType.toString(),
          osjList.tests![4].state.toInt(),
          osjList.tests![4].alive.toInt(),
          osjList.tests![12].id.toString(),
          osjList.tests![12].deviceType.toString(),
          osjList.tests![12].state.toInt(),
          osjList.tests![12].alive.toInt(),
        ),
        customRowButton(
          context,
          osjList.tests![5].id.toString(),
          osjList.tests![5].deviceType.toString(),
          osjList.tests![5].state.toInt(),
          osjList.tests![5].alive.toInt(),
          osjList.tests![13].id.toString(),
          osjList.tests![13].deviceType.toString(),
          osjList.tests![13].state.toInt(),
          osjList.tests![13].alive.toInt(),
        ),
        customRowButton(
          context,
          osjList.tests![6].id.toString(),
          osjList.tests![6].deviceType.toString(),
          osjList.tests![6].state.toInt(),
          osjList.tests![6].alive.toInt(),
          osjList.tests![14].id.toString(),
          osjList.tests![14].deviceType.toString(),
          osjList.tests![14].state.toInt(),
          osjList.tests![14].alive.toInt(),
        ),
        customRowButton(
          context,
          osjList.tests![7].id.toString(),
          osjList.tests![7].deviceType.toString(),
          osjList.tests![7].state.toInt(),
          osjList.tests![7].alive.toInt(),
          osjList.tests![15].id.toString(),
          osjList.tests![15].deviceType.toString(),
          osjList.tests![15].state.toInt(),
          osjList.tests![15].alive.toInt(),
        ),
      ],
    );
  }
}
