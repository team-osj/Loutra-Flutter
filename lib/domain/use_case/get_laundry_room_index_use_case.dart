import 'package:lotura/domain/repository/laundry_repository.dart';

class GetLaundryRoomIndexUseCase {
  final LaundryRepository _laundryRepository;

  const GetLaundryRoomIndexUseCase(
      {required LaundryRepository laundryRepository})
      : _laundryRepository = laundryRepository;

  int get execute =>
      _laundryRepository.getValue<int>(key: "laundryRoomIndex") ?? 0;
}
