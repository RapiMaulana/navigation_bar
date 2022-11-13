import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:developer';
import 'package:intl/intl.dart';

class PertamaPage extends StatefulWidget {
  const PertamaPage({super.key});

  @override
  State<PertamaPage> createState() => _PertamaPageState();
}

class _PertamaPageState extends State<PertamaPage> {
  DateTime? dateTimenow = DateTime.now(), dateTimeTomorrow, picked_date;
  var year, month, day;
  TimeOfDay? picked_time, selected_time = TimeOfDay.now();

  Future<Null> getDate(BuildContext context) async {
    picked_date = await showDatePicker(
        context: context,
        initialDate: dateTimeTomorrow!,
        firstDate: DateTime(dateTimenow!.year - 1),
        lastDate: DateTime(dateTimenow!.year + 1));

    if (picked_date != null && picked_date != dateTimenow) {
      setState(() {
        dateTimenow = picked_date;
      });
    }
  }

  Future<Null> getTime(BuildContext context) async {
    picked_time =
        await showTimePicker(context: context, initialTime: selected_time!);
    if (picked_time != null && picked_time! != selected_time) {
      setState(() {
        selected_time = picked_time;
      });
    }
  }

  void dateTime_method() {
    dateTimenow = new DateTime.now();
    dateTimeTomorrow = dateTimeTomorrow!.add(const Duration(days: 1));
    year = dateTimenow!.year;
    month = dateTimenow!.month;
    day = dateTimenow!.day;

    var data = DateFormat('HH:MM:SS').format(dateTimenow!);
    var data1 = DateFormat('dd:MM:yyyy').format(dateTimenow!);
    var data2 = DateFormat('HH:mm').format(dateTimenow!);
    var data3 = DateFormat('yyyy:MM:dd').format(dateTimenow!);
    var data4 = dateTimeTomorrow!.add(const Duration(days: -2));

    log("data sekarang:" + dateTimenow!.toString());
    log("Tahun sekarang:" + year!.toString());
    log("Bulan sekarang:" + month!.toString());
    log("Hari sekarang:" + day!.toString());
    log("data :" + data!.toString());
    log("data 1:" + data1!.toString());
    log("data 2:" + data2!.toString());
    log("data 3:" + data3!.toString());
    log("data 4:" + data4!.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              getDate(context);
            },
            child: Text("test Tangga"),
          ),
          MaterialButton(
            onPressed: () {
              Null;
            },
            child: Text("test waktu"),
          ),
          Text("${dateTimenow.toString().substring(0, 10)}"),
          Text("${selected_time.toString()}"),
        ],
      ),
    );
  }
}
