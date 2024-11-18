import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_qlcv/core/configs/assets/app_vectors.dart';

import '../../../domain/usecases/thongtinchung_usecase.dart';
import '../bloc/profile_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(GetThongTinChungtUseCase())..getProfileData(),
      child: Scaffold(
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileError) {
              return Center(child: Text(state.errorMessage));
            } else if (state is ProfileLoaded) {
              final thongTinCaNhan = state.data;
              var name = thongTinCaNhan.tenNv.toString();
              var oneBssId = thongTinCaNhan.nhanvienOnebssId;
              var phone = thongTinCaNhan.soDt;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(
                            AppVectors.defaultAvatar,
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          'OneBSS ID: $oneBssId',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          'SĐT: $phone',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: IconButton(
                          onPressed: () {
                            // Implement logout logic here
                            print("Logging out...");
                          },
                          icon: const Icon(
                            Icons.logout,
                            size: 30,
                            color: Colors.red,
                          ),
                          padding: const EdgeInsets.all(16.0),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return const Center(child: Text('Unknown state'));
          },
        ),
      ),
    );
  }
}
