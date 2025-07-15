import 'package:flutter/material.dart';

class AlarmCalendarWidget extends StatefulWidget {
  @override
  _AlarmCalendarWidgetState createState() => _AlarmCalendarWidgetState();
}

class _AlarmCalendarWidgetState extends State<AlarmCalendarWidget> {
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _selectedTime;

  static void _showAlarmCallback() {
    print("Alarm Triggered!");
  }

  Future<void> _pickStartDate() async {
    final currentDate = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: DateTime(currentDate.year + 10),
    );
    if (pickedDate != null) {
      setState(() => _startDate = pickedDate);
    }
  }

  Future<void> _pickEndDate() async {
    final currentDate = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: DateTime(currentDate.year + 10),
    );
    if (pickedDate != null) {
      setState(() => _endDate = pickedDate);
    }
  }

  Future<void> _pickTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() => _selectedTime = pickedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: _pickStartDate,
            child: AbsorbPointer(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(
                  text:
                      _startDate == null
                          ? ''
                          : '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}',
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Text(
                'to',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          GestureDetector(
            onTap: _pickEndDate,
            child: AbsorbPointer(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'End Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(
                  text:
                      _endDate == null
                          ? ''
                          : '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}',
                ),
              ),
            ),
          ),

          SizedBox(height: 10),

          GestureDetector(
            onTap: _pickTime,
            child: AbsorbPointer(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Select Time',
                  prefixIcon: Icon(Icons.alarm),
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(
                  text:
                      _selectedTime == null
                          ? ''
                          : _selectedTime!.format(context),
                ),
              ),
            ),
          ),

          // ElevatedButton removed as requested
        ],
      ),
    );
  }
}
