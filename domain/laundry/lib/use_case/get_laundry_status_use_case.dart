import 'package:laundry_data/repository/laundry_repository.dart';
import 'package:laundry_domain/entity/laundry_entity.dart';
import 'package:laundry_domain/mapper/laundry_mapper.dart';

class GetLaundryStatusUseCase {
  final LaundryRepository _laundryRepository;

  GetLaundryStatusUseCase({required LaundryRepository laundryRepository})
      : _laundryRepository = laundryRepository;

  Stream<LaundryEntity> get laundryList => _laundryRepository.laundryList
      .map((event) => LaundryMapper.toEntity(laundryResponse: event));

  void execute() {
    _laundryRepository.webSocketInit();
  }
}
