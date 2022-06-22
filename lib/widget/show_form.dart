// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kritegat/utility/my_constant.dart';

class ShowForm extends StatelessWidget {
  final IconData iconData;
  final Function(String) changeFung;
  final String hint;
  final bool? obSecu;
  final Function()? redEyeFunc;
  const ShowForm({
    Key? key,
    required this.iconData,
    required this.changeFung,
    required this.hint,
    this.obSecu,
    this.redEyeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obSecu ?? false,
      onChanged: changeFung,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.7), //ใส่สีพื้นหลังกับopartity
        //prefixIcon: icon ด้านหน้า
        suffixIcon: redEyeFunc == null
            ? Icon(iconData)
            : IconButton(
                onPressed: redEyeFunc,
                icon: Icon(Icons.remove_red_eye)), //icon ด้านหลัง
        contentPadding: const EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyConstant.dark),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyConstant.active),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hint,
      ),
    );
  }
}

// //แบบที่ดูจากในเน็ต ShowTextfeil
// class ShowTextfeil extends StatelessWidget {
//   const ShowTextfeil({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//           child: TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: 'Username',
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//           child: TextFormField(
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Password',
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
