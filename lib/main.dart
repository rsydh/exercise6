import 'package:exercise6/dear_feature/dear_feature_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dear_feature/dear_feature_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => DearFeatureCubit(),
        child: ButtonWidget(),
      ),
    );
  }
}



// class ButtonWidget extends StatefulWidget {
//   @override
//   _ButtonWidgetState createState() => _ButtonWidgetState();
// }

class _ButtonWidgetState extends State<ButtonWidget> {
  String _buttonStateText = '-';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BeSquare Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // A button to activate or deactivate the feature
            BlocBuilder<DearFeatureCubit, DearFeatureState>(
                bloc: context.read<DearFeatureCubit>(),
                builder: (context, state) {
                  return TextFormField(
                    child: Text(
                      state is DearFeatureEnabledState ? 'deactivate ' : 'activate',
                    ),
                    onChanged: (value)  {
                      if (state is DearFeatureEnabledState) {
                        context.read<DearFeatureCubit>().deactivateFeature();
                      } else if(state is DearFeatureDisabledState) {
                        context.read<DearFeatureCubit>().activateFeature();
                      }
                    },
                  );
                }),

            SizedBox(height: 10),

            // Show the feature state
            BlocConsumer<DearFeatureCubit, DearFeatureState>(
              bloc: BlocProvider.of<DearFeatureCubit>(context),
              listener: (context, state) {
                if (state is DearFeatureEnabledState) {
                  return Text(state.text.toString());
                } else if (state is DearFeatureDisabledState) {
                  return Text(state.text.toString());
                } else {
                  return Text("something worng");
                }
              },
              builder: (context, state) {
                return Text('Feature is $_buttonStateText');
              },
            ),
          ],
        ),
      ),
    );
  }
}
