import 'package:exercise6/dear_feature/dear_feature_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DearFeatureCubit extends Cubit<DearFeatureState>{
  DearFeatureCubit() : super(DearFeatureDisabledState());

  void activateFeature(){
    emit(DearFeatureEnabledState());
  }

  void deactivateFeature(){
    emit(DearFeatureDisabledState());
  }
}