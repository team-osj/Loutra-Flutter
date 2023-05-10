import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lotura/model/apply_list.dart';
import 'package:lotura/service/receive_apply_list.dart';

class StreamDrawer extends StatefulWidget {
  StreamDrawer({Key? key}) : super(key: key);

  @override
  State<StreamDrawer> createState() => _StreamDrawerState();
}

class _StreamDrawerState extends State<StreamDrawer> {
  late StreamController<ApplyList> controller;

  @override
  void initState() {
    super.initState();
    controller = StreamController<ApplyList>();
    receiveApplyList(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(child: Text("신청 리스트")),
          SizedBox(
            width: double.infinity,
            height:double.maxFinite,
            child: StreamBuilder<ApplyList>(
              stream: controller.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.applyList!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data!.applyList![index].deviceId
                            .toString()),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
