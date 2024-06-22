import 'package:get/get.dart';

import '../modules/dashbord/bindings/dashbord_binding.dart';
import '../modules/dashbord/views/dashbord_view.dart';
import '../modules/detail-tanah/bindings/detail_tanah_binding.dart';
import '../modules/detail-tanah/views/detail_tanah_view.dart';
import '../modules/form-booking/bindings/form_booking_binding.dart';
import '../modules/form-booking/views/form_booking_view copy.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kategori/bindings/kategori_binding.dart';
import '../modules/kategori/views/kategori_view.dart';
import '../modules/konfirm-pay/bindings/konfirm_pay_binding.dart';
import '../modules/konfirm-pay/views/konfirm_pay_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/status-booking/bindings/status_booking_binding.dart';
import '../modules/status-booking/views/status_booking_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.KATEGORI,
      page: () => const KategoriView(),
      binding: KategoriBinding(),
    ),
    GetPage(
      name: _Paths.STATUS_BOOKING,
      page: () => const StatusBookingView(),
      binding: StatusBookingBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TANAH,
      page: () => const DetailTanahView(),
      binding: DetailTanahBinding(),
    ),
    GetPage(
      name: _Paths.FORM_BOOKING,
      page: () => const FormBookingView(),
      binding: FormBookingBinding(),
    ),
    GetPage(
      name: _Paths.KONFIRM_PAY,
      page: () => const KonfirmPayView(),
      binding: KonfirmPayBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DASHBORD,
      page: () => const DashbordView(),
      binding: DashbordBinding(),
    ),
  ];
}
