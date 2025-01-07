import 'package:bloom/utils/exception.dart';
import 'package:fpdart/fpdart.dart';

typedef FutureEither<T> = Future<Either<ApiException, T>>;
typedef FutureEitherVoid = FutureEither<void>;
