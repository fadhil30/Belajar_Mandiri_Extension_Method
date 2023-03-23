import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/bloc/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(builder: (context) {
              String nameUser = context.select<UserBloc, String>(
                (value) => value.state['name'],
              );
              return Text('NAMA: $nameUser');
            }),
            Builder(builder: (context) {
              int ageUser = context.select<UserBloc, int>(
                (value) => value.state['age'],
              );
              return Text('UMUR: $ageUser');
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () => context
                        .read<UserBloc>()
                        .changeAge(context.read<UserBloc>().state['age'] - 1),
                    icon: Icon(Icons.remove)),
                IconButton(
                    onPressed: () => context
                        .read<UserBloc>()
                        .changeAge(context.read<UserBloc>().state['age'] + 1),
                    icon: Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
