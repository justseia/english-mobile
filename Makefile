q:
    adb shell am start -a android.intent.action.VIEW \ -c android.intent.category.BROWSABLE \ -d https://master.top.kz/jobs/1

git:
	git add .
	git commit -m 'update'
	git push

c:
	@echo "=== Cleaning Flutter, iOS & Android caches and build artifacts ==="
	# Flutter clean
	flutter clean

	# Project build artifacts
	rm -rf build/ .dart_tool/ .packages

	# iOS Pods
	rm -rf ios/Pods
	rm -f ios/Podfile.lock

	# Android Gradle cache & build
	rm -rf android/.gradle
	rm -rf android/app/build

	# Android clean via Gradle
	cd android && ./gradlew clean --no-daemon

	# Pub cache
	yes y | flutter pub cache clean
	flutter pub get

	# Flutter SDK cache
	flutter precache --force

	# Xcode DerivedData
	rm -rf $(HOME)/Library/Developer/Xcode/DerivedData

	# CocoaPods full reset & reinstall
	cd ios && \
	pod deintegrate && \
	rm -rf $(HOME)/Library/Caches/CocoaPods && \
	pod cache clean --all && \
	pod setup && \
	pod install

	@echo "=== All clean ✅ ==="