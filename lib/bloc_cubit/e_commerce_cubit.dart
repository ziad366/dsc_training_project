import 'package:dsc_training_project/bloc_cubit/e_commerce_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ECommerceCubit extends Cubit<ECommerceStates>{
  ECommerceCubit() : super(InitialState());

  static ECommerceCubit get(context)=>BlocProvider.of(context);

  bool isDark = false;
  changeThme(){
    isDark = !isDark;
    print(isDark);
    emit(ChangeThemeModeState());
  }

  int productNumber = 1;
  void incrementProductNumber(){
    productNumber++;
    emit(IncrementProductNumber());
  }
  void decrementProductNumber(){
   if(productNumber>1) {
     productNumber--;
    emit(DecrementProductNumber());
  }else{
     print('couldn\'t minus');
     emit(DecrementProductNumberError());
   }
  }


}


