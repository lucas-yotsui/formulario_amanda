import 'package:flutter/material.dart';
import 'package:formulario_reservas/shared/reservations.dart';
import '../shared/background_decoration.dart';

class ReservationsPage extends StatefulWidget {
  const ReservationsPage({super.key});

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  List<Widget> listOfReservations = [];

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
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: listOfReservations,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    createListOfReservations();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    createListOfReservations();
    super.setState(fn);
  }

  void createListOfReservations() {
    listOfReservations.clear();

    listOfReservations.add(
      const SizedBox(
        height: 80,
      ),
    );
    listOfReservations.add(
      const Text(
        'Minhas Reservas',
        style: TextStyle(
          fontSize: 36,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
    listOfReservations.add(
      const SizedBox(
        height: 20,
      ),
    );

    int i = 0;
    for (var element in currentReservations) {
      listOfReservations.add(ReservationBlock(
        data: element['data']!,
        inicio: element['inicio']!,
        fim: element['fim']!,
        sala: element['sala']!,
        posicaoNaLista: i++,
      ));
    }
  }
}

class ReservationBlock extends StatelessWidget {
  const ReservationBlock({
    required this.data,
    required this.inicio,
    required this.fim,
    required this.sala,
    required this.posicaoNaLista,
    super.key,
  });

  final String data;
  final String inicio;
  final String fim;
  final String sala;
  final int posicaoNaLista;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 2),
            color: Theme.of(context).shadowColor.withAlpha(32),
          )
        ],
        color: Theme.of(context).highlightColor.withAlpha(172),
      ),
      width: 300,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Data: ',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                data,
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Início: ',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                inicio,
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Fim: ',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                fim,
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sala: ',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                sala,
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Tem certeza que deseja excluir esta reserva?',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    child: Text(
                      'Atenção: Essa ação é irreversível. Caso prossiga com o cancelamento, sua reserva será excluída de nossos sistemas e será necessário fazê-la novamente caso mude de ideia.\nNote que nesse caso, há ainda a possibilidade de outra pessoa fazer a reserva antes, ocupando a sala e impedindo sua remarcação.\nNão nos responsabilizamos por erros cometidos nessa etapa, sugerimos que pense cuidadosamente antes de prosseguir.',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.cancel),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Voltar',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      FilledButton(
                        onPressed: () {
                          currentReservations.removeAt(posicaoNaLista);
                          showModalBottomSheet(
                              context: context,
                              builder: (_) => Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'A reserva foi excluída com sucesso!',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        const Text(
                                          'Um email foi enviado para o endereço cadastrado confirmando esta operação.',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Image.asset(
                                          'assets/cancelado.gif',
                                          scale: 2,
                                        ),
                                      ],
                                    ),
                                  ));
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.delete),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Excluir',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.delete),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Excluir',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
