import 'package:flutter/material.dart';
import '../shared/background_decoration.dart';

class ReservationsPage extends StatelessWidget {
  const ReservationsPage({super.key});

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
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Minhas Reservas',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ReservationBlock(
                    data: '09/03',
                    inicio: '09:30',
                    fim: '11:30',
                    sala: 'Sala Maior',
                  ),
                  ReservationBlock(
                    data: '10/03',
                    inicio: '14:30',
                    fim: '16:30',
                    sala: 'Suíte',
                  ),
                  ReservationBlock(
                    data: '10/03',
                    inicio: '17:30',
                    fim: '20:00',
                    sala: 'Suíte',
                  ),
                  ReservationBlock(
                    data: '11/03',
                    inicio: '10:30',
                    fim: '12:00',
                    sala: 'Sala Maior',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ReservationBlock extends StatelessWidget {
  const ReservationBlock({
    required this.data,
    required this.inicio,
    required this.fim,
    required this.sala,
    super.key,
  });

  final String data;
  final String inicio;
  final String fim;
  final String sala;

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
                      fontWeight: FontWeight.w600,
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
                        onPressed: () {},
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
