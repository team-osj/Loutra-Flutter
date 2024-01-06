import 'package:lotura/domain/repository/laundry_repository.dart';

class GetLaundryRoomIndexUseCase {
  final LaundryRepository laundryRepository;

  const GetLaundryRoomIndexUseCase({required this.laundryRepository});

  int execute({required String key}) =>
      laundryRepository.getValue<int>(key: key) ?? 0;
}
