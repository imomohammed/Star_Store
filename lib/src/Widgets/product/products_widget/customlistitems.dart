//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// import '../../Model/produsct_model.dart';
// import '../../Utils/linkapi.dart';
//
// class CustomListItems extends StatelessWidget {
//   final ProductsModel productsModel;
//   const CustomListItems({Key? key, required this.productsModel}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CachedNetworkImage(
//                     imageUrl: AppLink.imagestItems + "/" + productsModel.productsImage!,
//                     height: 100,
//                     fit: BoxFit.fill,
//                   ),
//                   SizedBox(height: 10) ,
//                   Text(productsModel.productsName!,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold)),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Rating 3.5 ", textAlign: TextAlign.center),
//                       Container(
//                         alignment: Alignment.bottomCenter,
//                         height: 22,
//                         child: Row(
//                           children: [
//                             ...List.generate(
//                                 5,
//                                     (index) => Icon(
//                                   Icons.star,
//                                   size: 15,
//                                 ))
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("${productsModel.price} \$",
//                           style: TextStyle(
//                               color: Colors.purple,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: "sans")),
//                       IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.favorite,
//                             color: Colors.purple,
//                           ))
//                     ],
//                   )
//                 ]),
//           ),
//         ));
//   }
// }