pub_get:
	flutter pub get
pub_clean:
	flutter clean
pub_fetch:
	flutter clean && flutter pub get && cd ios && pod install && cd ..
pod_get:
	cd ios && pod install && cd ..