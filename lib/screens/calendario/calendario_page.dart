// // import 'package:flutter/material.dart';

// // class CalendarioPage extends StatefulWidget {
// //   // const CalendarioPage({super.key});

// //   @override
// //   State<CalendarioPage> createState() => _CalendarioPageState();
// // }

// // class _CalendarioPageState extends State<CalendarioPage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Calendario page'),
// //       ),
// //     );
// //   }
// // }
// // //

// import 'package:flutter/material.dart';
// import 'package:flutterfire_samples/res/custom_colors.dart';
// import 'package:table_calendar/table_calendar.dart';

// class CalendarioScreen extends StatefulWidget {
//   const CalendarioScreen({Key? key}) : super(key: key);

//   @override
//   State<CalendarioScreen> createState() => _CalendarioScreenState();
// }

// class _CalendarioScreenState extends State<CalendarioScreen> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Calendario'),
//         backgroundColor: CustomColors.firebaseNavy,
//       ),
//       body: TableCalendar(
//         firstDay: DateTime.utc(2000, 1, 1),
//         lastDay: DateTime.now().add(const Duration(days: 300)),
//         focusedDay: _focusedDay,
//         calendarFormat: _calendarFormat,
//         selectedDayPredicate: (day) {
//           return isSameDay(_selectedDay, day);
//         },
//         onDaySelected: (selectedDay, focusedDay) {
//           if (!isSameDay(_selectedDay, selectedDay)) {
//             // Se llama el setState cuando se actualiza el día seleccionado
//             setState(() {
//               _selectedDay = selectedDay;
//               _focusedDay = focusedDay;
//             });
//           }
//         },
//         onFormatChanged: (format) {
//           if (_calendarFormat != format) {
//             // Se llama el setState cuando se actualiza el formato del mes
//             setState(() {
//               _calendarFormat = format;
//             });
//           }
//         },
//         onPageChanged: (focusedDay) {
//           _focusedDay = focusedDay;
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CitasPage extends StatefulWidget {
  const CitasPage({Key? key}) : super(key: key);

  @override
  _CitasPageState createState() => _CitasPageState();
}

class _CitasPageState extends State<CitasPage> {
  // CitaService citaService = CitaService();

  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late bool expanded;
  Map<String, int> appts = Map<String, int>();

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    expanded = false;
    if (appts.isEmpty) {
      // loadAppts(_selectedDay);
    }
  }

  // Future loadAppts(DateTime from) async {
  //   appts.addAll(await citaService.getApptsCount(from: from));
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    var count = 2;
    if (MediaQuery.of(context).size.width < 700) {
      count = 1;
    }

    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        crossAxisCount: count,
        children: [
          TableCalendar(
            // locale: 'es_ES',
            headerStyle:
                HeaderStyle(titleCentered: true, formatButtonVisible: false),
            selectedDayPredicate: (day) => _selectedDay == day,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
                _selectedDay = selectedDay;
              });
            },
            focusedDay: _focusedDay,
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(Duration(days: 300)),
            calendarBuilders: CalendarBuilders(
              todayBuilder: (context, day, focusedDay) => Center(
                child: Text(day.day.toString()),
              ),
              markerBuilder: (context, day, events) {
                var key = "${day.day}/${day.month}/${day.year}";
                var count = appts.containsKey(key) ? appts[key] : 0;

                if (count == 0) {
                  return null;
                }

                return Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.cyan),
                    child: Text(
                      count.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
            onPageChanged: (focusedDay) async {
              _focusedDay = focusedDay;
              // await loadAppts(focusedDay);
            },
          ),
          Column(
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      expanded = !expanded;
                    });
                  },
                  child: Text("Agregar Cita")),
              // Visibility(
              //     visible: expanded,
              //     child: CitaForm(
              //       day: _selectedDay,
              //       refreshDay: () {
              //         setState(() {});
              //       },
              //     )),
              // Expanded(
              //   child: CitaList(
              //     day: _selectedDay,
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
