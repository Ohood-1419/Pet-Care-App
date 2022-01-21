import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  static String? saveData; //= '22/22/2222';

  late TextEditingController textControllerDate;
  late TextEditingController textControllerStartTime;
  late TextEditingController textControllerEndTime;
  late TextEditingController textControllerTitle;

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  //DateTime currentDate = DateTime.now();
  DateTime currentDate = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now();


  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != currentDate) {
      setState(() {
        currentDate = picked;

        // textControllerDate.text = DateFormat.yMMMMd().format(currentDate);
      });
    }
  }
  //time

  _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedStartTime,
    );
    if (picked != null && picked != selectedStartTime) {
      setState(() {
        selectedStartTime = picked;

        ///  textControllerStartTime.text = selectedStartTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Schedule appointment"),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                // ElevatedButton(

// // )

//                   onPressed: () async => await showDatePicker(
//                               //   context: context,
//                               initialDate: currentDate,
//                               firstDate: DateTime(2015),
//                               lastDate: DateTime(2050),
//                               context: context)
//                           .then((value) {
//                         var saveData = value.toString();
//                         print(value.toString());
//                       }),
//                   //_selectDate(context), // Refer step 3
//                   child: Text(
//                     'Select your event',
//                     style: TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                   style: ButtonStyle(
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(18.0),
//                               side: BorderSide(
//                                   color: Color(0xFF7E149B), width: 2.0))))
//                   //  color: const Color(0xFF7E149B),
//                   ),

                //

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    cursorColor: Colors.blueGrey,
                    // controller: saveData,
                    textCapitalization: TextCapitalization.characters,
                    onTap: () => {},
                    readOnly: true,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                    decoration: new InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black12, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black12, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black12, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black12, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 16,
                        bottom: 16,
                        top: 16,
                        right: 16,
                      ),
                      hintText: ' title ',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    cursorColor: Colors.blueGrey,
                    // controller: saveData,
                    textCapitalization: TextCapitalization.characters,
                    onTap: () => _selectDate(context),
                    readOnly: true,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                    decoration: new InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black12, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black12, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black12, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black12, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 16,
                        bottom: 16,
                        top: 16,
                        right: 16,
                      ),
                      hintText: ' 4-10-2021',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),

                ///time start
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    cursorColor: Colors.blueGrey,
                    // controller: saveData,
                    textCapitalization: TextCapitalization.characters,
                    onTap: () => _selectStartTime(context),
                    readOnly: true,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                    decoration: new InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black12, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black12, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black12, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black12, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 16,
                        bottom: 16,
                        top: 16,
                        right: 16,
                      ),
                      hintText: ' 09:30 AM ',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),

                ///
                ///
                ///
                SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () => {},
                    //_selectDate(context), // Refer step 3
                    child: Text(
                      ' Save ',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Color(0xFF7E149B), width: 2.0))))
                    //  color: const Color(0xFF7E149B),
                    ),
              ],
            ),
          ),
        ));
  }
}
