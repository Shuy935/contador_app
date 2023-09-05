import 'package:flutter/material.dart';
import 'dart:math';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  var random = Random();
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    int numeroAleatorioEntero = random.nextInt(10000) + 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$contador',
              style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
             Text(
              //cambiar txt cuando es un clic o clics
              'clic${contador == 1 ? '' : 's'}',
              style:const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 38, 99, 255)
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            onPressed: (){
              setState(() {
                contador ++;
              });
            },
            icono: Icons.plus_one_outlined,
          ),
        CustomButton(
            onPressed: (){
              setState(() {
                if(contador>0){
                contador --;}
              });
            },
            icono: Icons.plus_one_outlined,
          ),
        FloatingActionButton(
            shape: const StadiumBorder(),
            onPressed: () {
              setState(() {
                contador=0;
              });
            },
            child: const Icon(
              Icons.restart_alt_rounded,
            ),
        ),
        FloatingActionButton(
            shape: const StadiumBorder(),
            onPressed: () {
              setState(() {
                contador=numeroAleatorioEntero;  
              });
            },
            child: const Icon(
              Icons.shuffle,
            ),
        )],
      ),
    );
  }
}


//boton de tipo style widg
class CustomButton extends StatelessWidget {
  final IconData icono;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.icono, this.onPressed});

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icono),
    );
  }
}