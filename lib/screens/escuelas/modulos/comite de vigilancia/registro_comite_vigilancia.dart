import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/widgets/add_item_form_comite_vigilancia.dart';

class RegistroComiteVigilancia extends StatefulWidget {
  @override
  State<RegistroComiteVigilancia> createState() =>
      _RegistroComiteVigilanciaState();
}

class _RegistroComiteVigilanciaState extends State<RegistroComiteVigilancia> {
  final FocusNode _puestoFocusNode = FocusNode();
  final FocusNode _nombreFocusNode = FocusNode();
  final FocusNode _apellidopaternoFocusNode = FocusNode();
  final FocusNode _apellidomaternoFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _curpFocusNode = FocusNode();
  final FocusNode _calleFocusNode = FocusNode();
  final FocusNode _numeroFocusNode = FocusNode();
  final FocusNode _coloniaFocusNode = FocusNode();
  final FocusNode _cpFocusNode = FocusNode();
  final FocusNode _municipioFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _puestoFocusNode.unfocus();
        _nombreFocusNode.unfocus();
        _apellidopaternoFocusNode.unfocus();
        _apellidomaternoFocusNode.unfocus();
        _phoneFocusNode.unfocus();
        _curpFocusNode.unfocus();
        _calleFocusNode.unfocus();
        _numeroFocusNode.unfocus();
        _coloniaFocusNode.unfocus();
        _cpFocusNode.unfocus();
        _municipioFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: CustomColors.firebaseNavy,
            title: Text('Registro comite de vigilancia')),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(.0),
                    child: AddItemFormComiteVigilancia(
                      puestoFocusNode: _puestoFocusNode,
                      nameFocusNode: _nombreFocusNode,
                      apellidopaternoFocusNode: _apellidopaternoFocusNode,
                      apellidomaternoFocusNode: _apellidomaternoFocusNode,
                      phoneFocusNode: _phoneFocusNode,
                      curpFocusNode: _curpFocusNode,
                      calleFocusNode: _calleFocusNode,
                      numeroFocusNode: _numeroFocusNode,
                      coloniaFocusNode: _coloniaFocusNode,
                      cpFocusNode: _cpFocusNode,
                      municipioFocusNode: _municipioFocusNode,
                    ),
                  ),
                ),
                // Cont ainer(
                //   height: MediaQuery.of(context).size.height * 0.1,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   // color: Colors.red,
                //   child: FutureBuilder(
                //     future: _determinePosition(),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         final Position position = snapshot.data as Position;
                //         return SingleChildScrollView(
                //           child: Container(
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 // Text("Lng : ${_currentPosition?.latitude}"),
                //                 // Text("Latitud : ${_currentPosition.latitude}"),
                //                 // Text(
                //                 //     "Longitud : ${_currentPosition.longitude}"),
                //                 Text('Direccion: $_currentAddress'),
                //               ],
                //             ),
                //           ),
                //         );
                //       } else if (snapshot.hasError) {
                //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //             content: Text(
                //           snapshot.error.toString(),
                //         )));
                //         return Container(
                //           child: Text(snapshot.error.toString()),
                //         );
                //       }
                //       return CircularProgressIndicator();
                //     },
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
