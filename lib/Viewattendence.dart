import 'package:flutter/material.dart';

class ViewAttendence extends StatefulWidget {
  const ViewAttendence({Key? key}) : super(key: key);

  @override
  _ViewAttendenceState createState() => _ViewAttendenceState();
}

class _ViewAttendenceState extends State<ViewAttendence> {
  String date='Select Date';
  String endate='Select Date';
  DateTime currentDate=DateTime.now();
  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    date='${pickedDate!.day}/${pickedDate.month}/${pickedDate.year}';
    endate='${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
    currentDate=pickedDate;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
            child: Text(
          'View Attendence',
        )),
        actions: <Widget>[
          Image.asset(
            'assets/uttar_pradesh.png',
            height: 30,
            width: 30,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                '-> Please select Start to End Date to see your Attendence List with Date and Time ..',
                style: TextStyle(
                    color: Colors.red,

                    fontSize: 13)),
          ),
          SizedBox(
            width: 20,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(onPressed: () {
                    _selectDate();
                  },
                      icon:Icon(Icons.calendar_today_outlined),
                      label: Text('$date')),
                  TextButton.icon(onPressed: () {
                    _selectDate();
                  },
                  icon:Icon(Icons.calendar_today_outlined),
                      label: Text('$endate')),
                ],
              ),
            ),
          ),
          SizedBox(width: 10,),
          Builder(
            builder: (context) {
              return ListTile(
                title: Text(''),
                subtitle: Text(''),
                trailing: Icon(Icons.tag_faces_rounded),

              );
            }
          )
        ],
      ),
    );
  }
}
