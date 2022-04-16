import 'package:decor_app/viewmodels/home_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModel = ChangeNotifierProvider.autoDispose<HomeViewModel>(
    (ref) => HomeViewModel(ref.read));
