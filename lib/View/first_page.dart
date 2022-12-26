import 'package:flutter/material.dart';
import 'package:osj_flutter/model/list_model.dart';
import 'package:osj_flutter/Widget/custom_row_buttons.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key, required this.future}) : super(key: key);
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
                snapshot.data!.tests![0].id.toString(),
                snapshot.data!.tests![0].deviceType.toString(),
                snapshot.data!.tests![0].state!.toInt(),
                snapshot.data!.tests![0].alive!.toInt(),
                ' ${snapshot.data!.tests![8].id}',
                snapshot.data!.tests![8].deviceType.toString(),
                snapshot.data!.tests![8].state!.toInt(),
                snapshot.data!.tests![8].alive!.toInt(),
              ),
              customRowButtons(
                context,
                snapshot.data!.tests![1].id.toString(),
                snapshot.data!.tests![1].deviceType.toString(),
                snapshot.data!.tests![1].state!.toInt(),
                snapshot.data!.tests![1].alive!.toInt(),
                snapshot.data!.tests![9].id.toString(),
                snapshot.data!.tests![9].deviceType.toString(),
                snapshot.data!.tests![9].state!.toInt(),
                snapshot.data!.tests![9].alive!.toInt(),
              ),
              customRowButtons(
                context,
                snapshot.data!.tests![2].id.toString(),
                snapshot.data!.tests![2].deviceType.toString(),
                snapshot.data!.tests![2].state!.toInt(),
                snapshot.data!.tests![2].alive!.toInt(),
                snapshot.data!.tests![10].id.toString(),
                snapshot.data!.tests![10].deviceType.toString(),
                snapshot.data!.tests![10].state!.toInt(),
                snapshot.data!.tests![10].alive!.toInt(),
              ),
              customRowButtons(
                context,
                snapshot.data!.tests![3].id.toString(),
                snapshot.data!.tests![3].deviceType.toString(),
                snapshot.data!.tests![3].state!.toInt(),
                snapshot.data!.tests![3].alive!.toInt(),
                snapshot.data!.tests![11].id.toString(),
                snapshot.data!.tests![11].deviceType.toString(),
                snapshot.data!.tests![11].state!.toInt(),
                snapshot.data!.tests![11].alive!.toInt(),
              ),
              customRowButtons(
                context,
                snapshot.data!.tests![4].id.toString(),
                snapshot.data!.tests![4].deviceType.toString(),
                snapshot.data!.tests![4].state!.toInt(),
                snapshot.data!.tests![4].alive!.toInt(),
                snapshot.data!.tests![12].id.toString(),
                snapshot.data!.tests![12].deviceType.toString(),
                snapshot.data!.tests![12].state!.toInt(),
                snapshot.data!.tests![12].alive!.toInt(),
              ),
              customRowButtons(
                context,
                snapshot.data!.tests![5].id.toString(),
                snapshot.data!.tests![5].deviceType.toString(),
                snapshot.data!.tests![5].state!.toInt(),
                snapshot.data!.tests![5].alive!.toInt(),
                snapshot.data!.tests![13].id.toString(),
                snapshot.data!.tests![13].deviceType.toString(),
                snapshot.data!.tests![13].state!.toInt(),
                snapshot.data!.tests![13].alive!.toInt(),
              ),
              customRowButtons(
                context,
                snapshot.data!.tests![6].id.toString(),
                snapshot.data!.tests![6].deviceType.toString(),
                snapshot.data!.tests![6].state!.toInt(),
                snapshot.data!.tests![6].alive!.toInt(),
                snapshot.data!.tests![14].id.toString(),
                snapshot.data!.tests![14].deviceType.toString(),
                snapshot.data!.tests![14].state!.toInt(),
                snapshot.data!.tests![14].alive!.toInt(),
              ),
              customRowButtons(
                context,
                snapshot.data!.tests![7].id.toString(),
                snapshot.data!.tests![7].deviceType.toString(),
                snapshot.data!.tests![7].state!.toInt(),
                snapshot.data!.tests![7].alive!.toInt(),
                snapshot.data!.tests![15].id.toString(),
                snapshot.data!.tests![15].deviceType.toString(),
                snapshot.data!.tests![15].state!.toInt(),
                snapshot.data!.tests![15].alive!.toInt(),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
