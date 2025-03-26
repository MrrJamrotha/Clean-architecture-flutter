 
import 'package:get_it/get_it.dart'; 
import 'package:http/http.dart' as http;
import 'package:job_portal_app/data/remote/network/api_client.dart';
import 'package:job_portal_app/data/remote/search/typesense_client.dart';  

final di = GetIt.instance;
void setupInjector() {
  //API
  di.registerLazySingleton<http.Client>(() => http.Client());
  di.registerLazySingleton<ApiClient>(() => ApiClient(http.Client()));

  di.registerLazySingleton<TypesenseClient>(() => TypesenseClient());

  // //Repositories
  // di.registerLazySingleton<UserRepositoryImpl>(() => UserRepositoryImpl());
  // di.registerLazySingleton<HomeRepositoryImpl>(() => HomeRepositoryImpl());
  // di.registerLazySingleton<CategoryRepositoryImpl>(
  //     () => CategoryRepositoryImpl());

  // di.registerLazySingleton<BrandRepositoryImpl>(() => BrandRepositoryImpl());
  // di.registerLazySingleton<FetchingItemRepositoryImpl>(
  //     () => FetchingItemRepositoryImpl());

  // di.registerLazySingleton<ItemDetailRepositoryImpl>(
  //     () => ItemDetailRepositoryImpl());

  // di.registerLazySingleton<MerchantRepositoryImpl>(
  //     () => MerchantRepositoryImpl());

  // di.registerLazySingleton<ProductByCategoryRepositoryImpl>(
  //     () => ProductByCategoryRepositoryImpl());

  // di.registerLazySingleton<ProductByBrandRepositoryImpl>(
  //     () => ProductByBrandRepositoryImpl());

  // di.registerLazySingleton<AuthRepositoryImpl>(() => AuthRepositoryImpl());
  // di.registerLazySingleton<AddressRepositoryImpl>(
  //     () => AddressRepositoryImpl());

  // di.registerLazySingleton<WishlistRepositoryImpl>(
  //     () => WishlistRepositoryImpl());

  // di.registerLazySingleton<CartRepositoryImpl>(() => CartRepositoryImpl());
  // di.registerLazySingleton<CheckOutRepositoryImpl>(
  //     () => CheckOutRepositoryImpl());

  // di.registerLazySingleton<SearchRepositoryImpl>(() => SearchRepositoryImpl());
  // di.registerLazySingleton<OrderRepositoryImpl>(() => OrderRepositoryImpl());
  // di.registerLazySingleton<WriteReviewRepositoryImpl>(
  //     () => WriteReviewRepositoryImpl());

  // //Services
  // di.registerLazySingleton<GeocodingService>(() => GeocodingService());
  // di.registerSingleton<DatabaseService>(DatabaseService.instance);
  // di.registerLazySingleton<LocaleManager>(() => LocaleManager());
  // di.registerLazySingleton<PhotoManagerService>(
  //     () => PhotoManagerService.instance);
  // di.registerLazySingleton<UserSessionService>(
  //     () => UserSessionService.instance);
  // di.registerLazySingleton<SharedPreferencesService>(
  //     () => SharedPreferencesService.instance);

  // di.registerLazySingleton<BaseCacheManager>(() => DefaultCacheManager());

  // di.registerLazySingleton<SecureStorageService>(() => SecureStorageService());
  // di.registerLazySingleton<GeolocatorService>(() => GeolocatorService());
  // di.registerSingleton<PusherChannelsFlutter>(
  //     PusherChannelsFlutter.getInstance());
}
