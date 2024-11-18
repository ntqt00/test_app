import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_qlcv/presentation/home/bloc/congviec_cubit.dart';

import '../../../common/reusable_widgets/app_header_bar.dart';
import '../bloc/congviec_choduyet_cubit.dart';
import '../widgets/congviec_choduyet_list.dart';
import '../widgets/congviec_hoanthanh_list.dart';
import '../widgets/congviec_lienquan_list.dart';
import '../widgets/congviec_thuchien_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeaderBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CongViecCubit()..getCongViecList(),
          ),
          BlocProvider(
            create: (context) =>
                CongViecChoDuyetCubit()..getCongViecChoDuyetList(),
          ),
        ],
        child: Container(
          color: Colors.grey[50],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CongViecThucHienList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CongViecChoDuyetList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CongViecLienQuanList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CongViecHoanThanhList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
