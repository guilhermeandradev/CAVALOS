// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'widgets/nav-drawer.dart';


const List<String> list = <String> ['8:00', '9:00','10:00','11:00','15:00','16:00','17:00'];
class Calendario extends StatefulWidget{
Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  bool horarios = true;
  bool fds = false;
  DateTime today = DateTime.now();
  String diaSemana = "";

  _DiaSemana(String){
    if (String == "Friday"){
      if (list.length == 4){
        list.add('15:00');
        list.add('16:00');
        list.add('17:00');
      }
      setState(() {
      });
      diaSemana = "Sextou papai";
      horarios = true;
      fds = false;
    } else if(String == "Thursday"){
      if (list.length == 4){
        list.add('15:00');
        list.add('16:00');
        list.add('17:00');
      }
      setState(() {
      });
      diaSemana = "Quinta";
      fds = false;
      horarios = true;
    } else if (String == "Wednesday"){
      if (list.length == 4){
        list.add('15:00');
        list.add('16:00');
        list.add('17:00');
      }
      setState(() {
      });
      diaSemana = "Quarta";
      fds = false;
      horarios = true;
    } else if (String == "Tuesday"){
      if (list.length == 4){
        list.add('15:00');
        list.add('16:00');
        list.add('17:00');
      }
      setState(() {
      });
      diaSemana = "Terça";
      fds = false;
      horarios = true;
    } else if (String == "Monday"){
      diaSemana = "Segunda...";
      fds = false;
      horarios = false;
    } else if (String == "Sunday"){
      if (list.length == 6){
        list.removeAt(4);
        list.removeAt(5);
        list.removeAt(6);
      }
      setState(() {
      });
      diaSemana = "Domingo";
      fds = true;
      horarios = false;
    } else if (String == "Saturday"){
      if (list.length == 6){
        list.removeAt(4);
        list.removeAt(5);
        list.removeAt(6);
      }
      setState(() {
      });
      diaSemana = "Sabado";
      fds = true;
      horarios = false;
    }
  }

  void _atualizaHorario(){
    setState(() {
    });
  }

  void _onDaySelected(DateTime day,DateTime focusedDay){
    setState(() {
    today = day;
    _DiaSemana(_DiaSemana("${DateFormat("EEEE").format(today)}"));
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Calendario'),
      ),
    body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Dia Selecionado: ${DateFormat("d MMMM, yyyy").format(today)}"),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TableCalendar(
                  headerStyle: (HeaderStyle(formatButtonVisible: false, titleCentered: true)),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: today,
                  onDaySelected: _onDaySelected,
                ),
              ),
              Visibility(
                visible: fds || horarios,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: ElevatedButton(
                    onPressed: (){
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        title: Text("Horarios"),
                        content:Container(child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [DropdownButtonExample()],)),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
                      ));
                    },
                    child: Text("Marcar Horário")
                ),
                     ),
              ),
              Visibility(
                visible: !fds && !horarios,
                child: Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: Text("Você não pode marcar aulas nesse dia"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
