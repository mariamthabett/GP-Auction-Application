import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //firebase firestore
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  //Cache Helper
//   getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
//   // choose language cubit
//   getIt.registerLazySingleton<ChooseLanguageCubit>(() => ChooseLanguageCubit());
//   //on boarding
//   getIt.registerLazySingleton<OnboardingCubit>(() => OnboardingCubit());
//   // AuthCubit
//   getIt.registerLazySingleton<AuthCubit>(
//       () => AuthCubit(getIt<AuthRepository>()));
//   // AuthRepository
//   getIt.registerLazySingleton<AuthRepository>(
//       () => AuthRepository(getIt<AuthWebService>()));
//   // AuthWebService
//   getIt.registerLazySingleton<AuthWebService>(
//       () => AuthWebService(getIt<Dio>(), baseUrl: NetworkConstants.baseUrl));
//   //home web services
//   getIt.registerLazySingleton<HomeWebServices>(
//       () => HomeWebServices(getIt<Dio>(), baseUrl: NetworkConstants.baseUrl));
//   // home repository
//   getIt.registerLazySingleton<HomeRepository>(
//       () => HomeRepository(homeWebServices: getIt<HomeWebServices>()));
//   // HomeCubit
//   getIt.registerLazySingleton<HomeCubit>(
//       () => HomeCubit(getIt<HomeRepository>()));
//   // TicketsCubit
//   getIt.registerLazySingleton<TicketsCubit>(
//       () => TicketsCubit(getIt<TicketsRepository>()));
//   // TicketsRepository
//   getIt.registerLazySingleton<TicketsRepository>(
//       () => TicketsRepository(ticketsWebService: getIt<TicketsWebService>()));
//   // TicketsWebService
//   getIt.registerLazySingleton<TicketsWebService>(() =>
//       TicketsWebService(getIt<Dio>(), baseUrl: NetworkConstants.mockBaseUrl));
//   //Invoices Web Services
//   getIt.registerLazySingleton<InvoicesWebServices>(() =>
//       InvoicesWebServices(getIt<Dio>(), baseUrl: NetworkConstants.baseUrl));
//   // Invoices Repository
//   getIt.registerLazySingleton<InvoiceRepository>(
//       () => InvoiceRepository(getIt<InvoicesWebServices>()));
//   // InvoiceCubit
//   getIt.registerLazySingleton<InvoicesCubit>(
//       () => InvoicesCubit(getIt<InvoiceRepository>()));

//   //more web services
//   getIt.registerLazySingleton<MoreWebServices>(
//       () => MoreWebServices(getIt<Dio>(), baseUrl: NetworkConstants.baseUrl));
//   // More Repository
//   getIt.registerLazySingleton<MoreRepository>(
//       () => MoreRepository(moreWebServices: getIt()));

// //More cubit
//   getIt.registerLazySingleton<MoreCubit>(
//       () => MoreCubit(getIt<MoreRepository>()));

//   // Dio & ApiService
//   getIt.registerLazySingleton<Dio>(() => setupDio());
}
