import 'package:lotura/domain/entity/laundry_entity.dart';
import 'package:lotura/domain/repository/laundry_repository.dart';

class GetAllLaundryListUseCase {
  final LaundryRepository _laundryRepository;

  GetAllLaundryListUseCase({required LaundryRepository laundryRepository})
      : _laundryRepository = laundryRepository;

  Future<List<LaundryEntity>> execute() =>
      _laundryRepository.getAllLaundryList();
}
