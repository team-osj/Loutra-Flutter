import 'package:laundry_domain/entity/laundry_entity.dart';
import 'package:laundry_domain/repository/laundry_repository.dart';

class GetAllLaundryListUseCase {
  final LaundryRepository _laundryRepository;

  const GetAllLaundryListUseCase({required LaundryRepository laundryRepository})
      : _laundryRepository = laundryRepository;

  Future<List<LaundryEntity>> execute() async =>
      _laundryRepository.getAllLaundryList();
}
