// import 'package:flutter/foundation.dart';
// ignore_for_file: cascade_invocations

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workroom_flutter_app/common/services/dio_api_service.dart';
// import 'package:hive/hive.dart';
import 'package:workroom_flutter_app/counter/counter.dart';
// import 'package:workroom_flutter_app/l10n/l10n.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: const Text('WorkRoom Automation')),
      body: const Center(child: CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            // ! just for testing hive initialization.
            // onPressed: () async {
            //   final box = await Hive.openBox<String>('workroom');
            //   await box.put('name', 'animesh');
            //   if (kDebugMode) {
            //     print(box.get('name'));
            //   }
            // },

            // ! just for testing dio.
            // onPressed: () async {
            //   try {
            //     final dioApiService = DioApiService();
            //     dioApiService.baseUrl = 'https://httpbin.org/';
            // await dioApiService.get('get', null).then((value) {
            //   if (kDebugMode) {
            //     print(value.data);
            //     print(value.statusCode);
            //   }
            // });
            // await dioApiService
            //     .post(
            //   'post',
            //   {
            //     'id': 8,
            //     'info': {'name': 'wendux', 'age': 25}
            //   },
            //   null,
            // )
            //     .then((value) {
            //   if (kDebugMode) {
            //     print(value.statusCode);
            //     print(value.data);
            //   }
            // });
            // } catch (e) {
            //   if (kDebugMode) {
            //     print(e);
            //   }
            // }
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.displayLarge);
  }
}
