import 'package:laundry_data/repository/laundry_repository.dart';
import 'package:laundry_domain/entity/laundry_entity.dart';
import 'package:laundry_domain/mapper/laundry_mapper.dart';

class GetAllLaundryListUseCase {
  final LaundryRepository _laundryRepository;

  const GetAllLaundryListUseCase({required LaundryRepository laundryRepository})
      : _laundryRepository = laundryRepository;

  Future<List<LaundryEntity>> execute() async {
    final laundryResponseList = await _laundryRepository.getAllLaundryList();
    return laundryResponseList
        .map((e) => LaundryMapper.toEntity(laundryResponse: e))
        .toList();
  }
}
