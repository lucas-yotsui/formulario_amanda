import 'package:flutter/material.dart';
import 'package:formulario_reservas/shared/profile.dart';
import '../shared/background_decoration.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _nameController.text = myProfile['nome'] ?? '';
    _whatsappController.text = myProfile['whatsapp'] ?? '';
    _emailController.text = myProfile['email'] ?? '';
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
                  'Editar Minhas Informações',
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    return (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                        ? 'Por favor insira um nome válido'
                        : null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    labelText: 'Nome',
                    filled: true,
                  ),
                ),
                TextFormField(
                  controller: _whatsappController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    return (value == null ||
                            value.isEmpty ||
                            value.length < 10 ||
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                .hasMatch(value))
                        ? 'Por favor insira um número de celular válido com DDD'
                        : null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    labelText: 'Whatsapp',
                    filled: true,
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value))
                        ? 'Por favor insira um endereço de Email válido'
                        : null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    labelText: 'Email de contato',
                    filled: true,
                  ),
                ),
                const Text(
                  'Atenção: Este endereço de Email é apenas aquele para qual serão enviadas as mensagens de confirmação de reserva ou cancelamento.\nO Email associado a sua conta em nosso sistema continua sendo aquele utilizado no momento do cadastro.',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      myProfile['nome'] = _nameController.text;
                      myProfile['whatsapp'] = _whatsappController.text;
                      myProfile['email'] = _emailController.text;
                      showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Seus dados foram salvos',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.save_alt),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Salvar',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
