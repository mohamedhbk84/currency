
import 'package:currency/check_internet/check_internet.dart';
import 'package:currency/check_internet/connection_status_cubit.dart';
import 'package:currency/check_internet/show_animation_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WarningInterntWidgetCubit extends StatelessWidget {
  final Function() onClick;
  const WarningInterntWidgetCubit({Key? key,required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectionStatusCubit(),
      child: BlocBuilder<ConnectionStatusCubit, ConnectionStatus>(
          builder: (context, status) {
            status == ConnectionStatus.online?
            is_found_internet = true:is_found_internet = false;
            return Visibility(
              visible: status != ConnectionStatus.online,
              child:Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: AnimationNoInternet(onClick: onClick,)),
              // Container(
              //   padding: const EdgeInsets.all(16),
              //   height: 60,
              //   color: Colors.red,
              //   child: Row(
              //     children: [
              //       const Icon(Icons.wifi_off,color: Colors.white,),
              //       const SizedBox(width: 8),
              //        Text('No_internet_connection.'.tr(),style: TextStyle(color: Colors.white),),
              //     ],
              //   ),
              // ),
            );
          }),
    );
  }
}
