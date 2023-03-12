import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../shared/background_decoration.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateInput = TextEditingController();
  final TextEditingController _startTimeInput = TextEditingController();
  final TextEditingController _endTimeInput = TextEditingController();

  String? _currentlySelectedRoom;

  final List<String> _availableRooms = <String>[
    'Sala Maior - Unidade Alphaville',
    'Suíte - Unidade Alphaville',
    'Aruna - Unidade Brooklin',
    'Ganesha - Unidade Brooklin',
    'Osho - Unidade Brooklin',
    'Salão - Unidade Brooklin',
  ];

  @override
  void initState() {
    _dateInput.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomPaint(
            painter: PathPainter(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 32.0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Fazer uma Nova Reserva',
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  controller: _dateInput,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Data',
                    filled: true,
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 7)),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        _dateInput.text =
                            DateFormat('dd/MM/yyyy').format(pickedDate);
                        _startTimeInput.clear();
                        _endTimeInput.clear();
                      });
                    }
                  },
                ),
                TextFormField(
                  controller: _startTimeInput,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Horário Inicial',
                    filled: true,
                  ),
                  readOnly: true,
                  onTap: () async {
                    if (_dateInput.text.isNotEmpty) {
                      TimeOfDay? selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (selectedTime != null) {
                        DateTime fullSelectedTime = DateTime(
                          DateTime.now().year,
                          int.parse(_dateInput.text.split('/')[1]),
                          int.parse(_dateInput.text.split('/')[0]),
                          selectedTime.hour,
                          selectedTime.minute,
                        );

                        if (fullSelectedTime.isAfter(
                            DateTime.now().add(const Duration(minutes: 29)))) {
                          _startTimeInput.text =
                              '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
                        }
                      }
                    }
                  },
                ),
                TextFormField(
                  controller: _endTimeInput,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Horário Final',
                    filled: true,
                  ),
                  readOnly: true,
                  onTap: () async {
                    if (_dateInput.text.isNotEmpty) {
                      TimeOfDay? selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (selectedTime != null) {
                        DateTime fullSelectedTime = DateTime(
                          DateTime.now().year,
                          int.parse(_dateInput.text.split('/')[1]),
                          int.parse(_dateInput.text.split('/')[0]),
                          selectedTime.hour,
                          selectedTime.minute,
                        );

                        DateTime selectedInitialTime = DateTime(
                          DateTime.now().year,
                          int.parse(_dateInput.text.split('/')[1]),
                          int.parse(_dateInput.text.split('/')[0]),
                          int.parse(_startTimeInput.text.split(':')[0]),
                          int.parse(_startTimeInput.text.split(':')[1]),
                        );

                        if (fullSelectedTime.isAfter(selectedInitialTime)) {
                          _endTimeInput.text =
                              '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
                        }
                      }
                    }
                  },
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Sala',
                    filled: true,
                  ),
                  items: _availableRooms
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (selectedRoom) =>
                      setState(() => _currentlySelectedRoom = selectedRoom!),
                  value: _currentlySelectedRoom,
                  isExpanded: false,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
