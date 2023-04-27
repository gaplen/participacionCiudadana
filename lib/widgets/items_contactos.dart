import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/login_screen.dart';
import 'package:flutterfire_samples/utils/authentication_with_google.dart';
import 'package:flutterfire_samples/utils/database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemListContacts extends StatefulWidget {
  @override
  State<ItemListContacts> createState() => _ItemListContactsState();
}

class _ItemListContactsState extends State<ItemListContacts> {
  bool _isSigningOut = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readContactos(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> noteInfo =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              // var noteInfo = snapshot.data!.docs[index].data()!;
              String docID = snapshot.data!.docs[index].id;
              String? nombre = noteInfo['nombre'];
              String? nombreEscuela = noteInfo['nombreEscuela'];
              String? telefono = noteInfo['telefono'].toString();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () async {
                      // String phone = 'tel:$telefono';
                      // if (await canLaunch(phone)) {
                      //   await launch(phone);
                      // } else {
                      //   throw 'Could not launch $phone';
                      // }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage: AssetImage('assets/perfil.png'),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Text(
                                  'Nombre: $nombre',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Telefono: $telefono',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.green,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              CustomColors.firebaseOrange,
            ),
          ),
        );
      },
    );
  }

  // launchURL() async {
  //   const url = 'https://www.google.com';
  //   final uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}






  // String url() {
  //   if (Platform.isAndroid) {
  //     // add the [https]
  //     return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
  //   } else {
  //     // add the [https]
  //     return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
  //   }
  // }
