import 'package:lotura/data/dto/response/laundry_response.dart';
import 'package:lotura/domain/repository/laundry_repository.dart';

class GetAllLaundryListUseCase {
  final LaundryRepository _laundryRepository;

  GetAllLaundryListUseCase({required LaundryRepository laundryRepository})
      : _laundryRepository = laundryRepository;

  Future<List<LaundryResponse>> execute() =>
      _laundryRepository.getAllLaundryList();
}
