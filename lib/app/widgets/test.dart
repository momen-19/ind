// import 'package:flutter/material.dart';
//
//
// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);
//
//   @override
//   State<Test> createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: state.when(
//         data: (products) => Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 20,
//             vertical: 10,
//           ),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 15,
//               ),
//               const Text(
//                 'New Offers',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 22,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 10.0,
//                 ),
//                 child: CarouselSlider(
//                   options: CarouselOptions(
//                     height: 250.0,
//                     autoPlay: true,
//                   ),
//                   items: products.map((products) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 15,
//                             vertical: 15,
//                           ),
//                           margin: const EdgeInsets.symmetric(
//                             horizontal: 5.0,
//                             vertical: 10,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.blue.shade200,
//                                 blurRadius: 0.5,
//                                 offset: const Offset(
//                                   10,
//                                   1,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                     vertical: 10,
//                                     horizontal: 10,
//                                   ),
//                                   child: Image.network(
//                                     products.image,
//                                     height: 220,
//                                     width: 230,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 products.title,
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 2,
//                                 style: const TextStyle(
//                                     fontSize: 16.0,
//                                     color: Colors.blue,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Text(
//                 'New Products',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 22,
//                 ),
//               ),
//               Expanded(
//                 child: GridView.builder(
//                   itemCount: products.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                   ),
//                   itemBuilder: (context, index) => Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: SizedBox(
//                         height: 300,
//                         child: Column(
//                           children: [
//                             Expanded(
//                               flex: 2,
//                               child: Image.network(
//                                 products[index].image,
//                                 width: 100,
//                                 fit: BoxFit.fill,
//                                 height: 200,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Expanded(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       products[index].title,
//                                       maxLines: 2,
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                   Text(
//                                     "${products[index].price.round()}\$",
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 19,
//                                       color: Colors.redAccent,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       elevation: 0,
//                                       backgroundColor: Colors.red),
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => ProviderScope(
//                                           overrides: [
//                                             detailsProduct.overrideWithValue(
//                                               products[index],
//                                             ),
//                                           ],
//                                           child: const ProductDetailsPage(),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: const Text(
//                                     'Show Details',
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         error: (error, stackTrace) => Text(error.toString()),
//         loading: () => const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
