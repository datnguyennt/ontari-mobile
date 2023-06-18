import '../constant/hive_keys.dart';
import '../hive.helper.dart';

class TokenManager {
  const TokenManager();

  Future<String?> getAccessToken() async {
    return await HiveHelper.get(
      HiveKeys.accessToken,
    );
  }

  Future<String> getRefreshToken() async {
    return await HiveHelper.get(HiveKeys.refreshToken) ?? '';
  }

  Future<DateTime?> getTokenExpiredTime() async {
    final String expiredTime = await HiveHelper.get(HiveKeys.expiresIn);
    return DateTime.parse(expiredTime);
  }

  Future<void> setAccessToken(String accessToken) async {
    await HiveHelper.put(
      key: HiveKeys.accessToken,
      value: accessToken,
    );
  }

  Future<void> setRefreshToken(String refreshToken) async {
    await HiveHelper.put(
      key: HiveKeys.refreshToken,
      value: refreshToken,
    );
  }

  Future<void> setTokenExpiredTime(int expiredTime) async {
    await HiveHelper.put(
      key: HiveKeys.expiresIn,
      value:
          DateTime.now().add(Duration(seconds: expiredTime)).toIso8601String(),
    );
  }

  Future<bool> isAccessTokenInvalid() async {
    try {
      final DateTime? expiredTime = await getTokenExpiredTime();
      if (DateTime.now()
          .toUtc()
          .add(const Duration(seconds: 10))
          .isAfter(expiredTime!)) {
        return true;
      }
      return false;
    } catch (_) {
      return true;
    }
  }

  Future<void> cleanAuthBox() async {
    await HiveHelper.clear();
  }
}
