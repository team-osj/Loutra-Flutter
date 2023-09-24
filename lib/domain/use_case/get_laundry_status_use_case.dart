import 'package:lotura/data/dto/response/laundry_response.dart';
import 'package:lotura/domain/repository/laundry_repository.dart';

class GetLaundryStatusUseCase {
  final LaundryRepository _laundryRepository;

  GetLaundryStatusUseCase({required LaundryRepository laundryRepository})
      : _laundryRepository = laundryRepository;

  Stream<List<LaundryResponse>> get laundryList =>
      _laundryRepository.laundryList;

  void execute() {
    _laundryRepository.init();
  }
}
