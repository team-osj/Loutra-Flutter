import 'package:lotura/domain/repository/laundry_repository.dart';

class UpdateLaundryRoomIndexUseCase {
  final LaundryRepository _laundryRepository;

  const UpdateLaundryRoomIndexUseCase(
      {required LaundryRepository laundryRepository})
      : _laundryRepository = laundryRepository;

  Future<void> execute({required int value}) =>
      _laundryRepository.setValue(key: 'laundryRoomIndex', value: value);
}
