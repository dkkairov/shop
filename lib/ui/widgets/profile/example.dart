// return SliverList(
//   delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
//     final _name = ordersList[index].name;
//     final _price = ordersList[index].price.toString();
//     final _rating = ordersList[index].rating.toString();
//     final _image = ordersList[index].image;
//     print(_ordersIdList);
//     return Column(
//       children: <Widget>[
//         const SizedBox(height: 5),
//         Card(
//           shape: const RoundedRectangleBorder(),
//           elevation: 0,
//           margin: const EdgeInsets.only(bottom: 2),
//           child: Container(
//             alignment: Alignment.centerLeft,
//             height: 90,
//             child: ListTile(
//                 contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 20.0, vertical: 10.0),
//                 leading: ClipRRect(
//                   borderRadius: const BorderRadius.all(Radius.circular(5)),
//                   clipBehavior: Clip.hardEdge,
//                   child: _image != '' ? Image.network(_image) : Image.network(AppImages.emptyLogo),
//                 ),
//                 title: RichText(
//                   text: TextSpan(
//                       text: '$_name   ',
//                       style: AppTextStyle.productCardNameTextStyle,
//                       children: [
//                         const WidgetSpan(
//                           child: Icon(Icons.star, size: 20, color: AppColors.mainGold),
//                         ),
//                         TextSpan(text: ' $_rating',
//                           style: AppTextStyle.productCardRatingTextStyle,
//                         ),
//                       ]
//                   ),
//                 ),
//                 subtitle: Text(
//                   '$_price р',
//                   style: AppTextStyle.productCardPriceTextStyle,
//                 ),
//                 trailing: IconButton(
//                   icon: const Icon(Icons.delete),
//                   color: AppColors.mainBlue,
//                   onPressed: () => _groupModel.deleteFromCart(index),
//                 )
//             ),
//           ),
//         ),
//         const SizedBox(height: 5),
//         Row(
//           children: const [
//             Expanded(child: SizedBox.shrink(), flex: 1,),
//             Expanded(child: Divider(height: 2), flex: 4,)
//           ],
//         )
//       ],
//     );
//   },
//     childCount: ordersList.length,
//   ),
// );