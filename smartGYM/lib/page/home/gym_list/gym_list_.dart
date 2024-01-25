import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../../../model/machine_data.dart';
import 'gym_item.dart';

class GymMachineList extends StatefulWidget {
  final List<GymMachineItem> machines;

  GymMachineList({required this.machines});

  @override
  State<GymMachineList> createState() => _GymMachineListState();

}



class _GymMachineListState extends State<GymMachineList> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // 데이터 가져오기를 시뮬레이션하기 위한 지연
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return isLoading ? const SkeletonsWidget() : ListView.builder(
      itemCount: widget.machines.length,
      itemBuilder: (context, index) {
        final machine = widget.machines[index];
        return GymMachineListItem(machine: machine);
      },
    );
  }
}

class SkeletonsWidget extends StatelessWidget {
  const SkeletonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: SkeletonItem(
        child: Column(
          children: [
            Row(
              children: [
                const SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      shape: BoxShape.circle, width: 50, height: 50),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: SkeletonParagraph(
                    style: SkeletonParagraphStyle(
                        lines: 3,
                        spacing: 6,
                        lineStyle: SkeletonLineStyle(
                          randomLength: true,
                          height: 10,
                          borderRadius: BorderRadius.circular(8),
                          minLength: MediaQuery.of(context).size.width / 6,
                          maxLength: MediaQuery.of(context).size.width / 3,
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            SkeletonParagraph(
              style: SkeletonParagraphStyle(
                  lines: 3,
                  spacing: 6,
                  lineStyle: SkeletonLineStyle(
                    randomLength: true,
                    height: 10,
                    borderRadius: BorderRadius.circular(8),
                    minLength: MediaQuery.of(context).size.width / 2,
                  )),
            ),
            const SizedBox(height: 12),
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                width: double.infinity,
                minHeight: MediaQuery.of(context).size.height / 8,
                maxHeight: MediaQuery.of(context).size.height / 3,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    SkeletonAvatar(
                        style: SkeletonAvatarStyle(width: 20, height: 20)),
                    SizedBox(width: 8),
                    SkeletonAvatar(
                        style: SkeletonAvatarStyle(width: 20, height: 20)),
                    SizedBox(width: 8),
                    SkeletonAvatar(
                        style: SkeletonAvatarStyle(width: 20, height: 20)),
                  ],
                ),
                SkeletonLine(
                  style: SkeletonLineStyle(
                      height: 16,
                      width: 64,
                      borderRadius: BorderRadius.circular(8)),
                )
              ],
            )
          ],
        ),
      ),
    ),
          ),
        );
  }
}
