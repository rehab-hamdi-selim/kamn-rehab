import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // child: ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BlocProvider(create: getIt<MealCubit>()..getMeals()
          //
          // ))
          // ); },
          //     child:Text("test1") ),
          ),
    );
  }
}
