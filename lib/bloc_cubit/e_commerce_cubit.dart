import 'package:dsc_training_project/bloc_cubit/e_commerce_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dsc_training_project/screens/product_screen.dart';
class ECommerceCubit extends Cubit<ECommerceStates>{
  ECommerceCubit() : super(InitialState());

  static ECommerceCubit get(context)=>BlocProvider.of(context);

  bool isDark = false;
  changeThme(){
    isDark = !isDark;
    print(isDark);
    emit(ChangeThemeModeState());
  }


  // for(int i=0 ; i<cartItems.length ; i++){
  // int p=int.parse(cartItems[i].price);
  // int c= myCounterList[i];
  // sum=(sum+p*c);
  // }

  int sum=0;
  List myCounterList = ones;

  void incrementProductNumber(index){
    sum=0;
    for(int i=0 ; i<cartItems.length ; i++){
      int p=int.parse(cartItems[i].price);
      int c= myCounterList[i];
   sum=(sum+p*c);
    }
    myCounterList[index]++;
    emit(IncrementProductNumber());
  }
  void decrementProductNumber(index){
   if(myCounterList[index]>1) {

     sum=0;
     for(int i=0 ; i<cartItems.length ; i++){
       int p=int.parse(cartItems[i].price);
       int c= myCounterList[i];
       sum=(sum+p*c);
     }

     myCounterList[index]--;
    emit(DecrementProductNumber());
  }else{
     print('couldn\'t minus');
     emit(DecrementProductNumberError());
   }
  }


}


