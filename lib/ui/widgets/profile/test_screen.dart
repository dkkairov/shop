// [[0, 1, 2], [3, 4]]

// class _OrdersListWidget extends StatelessWidget {
//   const _OrdersListWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     List<List<String>> lists = [['1', '2', '3'],['1.2', '1.3']];
//     return SliverToBoxAdapter(
//       child: ListView.separated(
//           padding: const EdgeInsets.all(8),
//           itemCount: lists.length,
//           separatorBuilder: (BuildContext context, int index) => Divider(),
//           itemBuilder: (BuildContext context, int orderIndex) {
//             return Container(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: ListView.separated(
//                   padding: const EdgeInsets.all(8),
//                   itemCount: lists[orderIndex].length,
//                   separatorBuilder: (BuildContext context, int index) => Divider(),
//                   itemBuilder: (BuildContext ctx, int index) {
//                     final name = lists[orderIndex][index];
//                     return Container(
//                         padding: EdgeInsets.symmetric(vertical: 10),
//                         child: Text('1232')
//                     );
//                   }
//               ),
//             );
//           }
//       ),
//     );
//   }
// }
//
//
// Column(
// children: for (var element in list) Text(element),
// ),









