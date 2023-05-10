import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workroom_flutter_app/counter/counter.dart';

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
            // await getIt<AuthHive>().writeValue<String>('key1', 'value1');
            // await getIt<AuthHive>().writeValue<int>('key2', 123);
            // final value1 = await getIt<AuthHive>().readValue<String>('key1');
            // final value2 = await getIt<AuthHive>().readValue<int>('key2');
            // print(value1);
            // print(value2);
            // final hiveService = HiveService();
            // await hiveService.openBox('myBox');
            // await hiveService.writeValue('key1', 'value1');
            // await hiveService.writeValue('key2', 123);
            // // Read values from the box
            // final value1 = hiveService.readValue<String>('key1');
            // final value2 = hiveService.readValue<int>('key2');

            // print(value2);
            // await hiveService.deleteValue('key1');
            // await hiveService.closeBox();
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
