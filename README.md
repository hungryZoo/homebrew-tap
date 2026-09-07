# hungryZoo/homebrew-tap

hungryZoo의 Homebrew tap입니다. Homebrew 6 기준입니다.

| Cask | 설명 |
|---|---|
| [quickjaso](Casks/quickjaso.rb) | macOS Finder 서비스로 파일·폴더 이름을 Windows 호환 Unicode NFC로 검사·변환 — https://github.com/hungryZoo/quickJaso |
| [everydock](Casks/everydock.rb) | 모든 모니터에 항상 표시되는 macOS 앱 바 — https://github.com/hungryZoo/everyDock |

## 설치

```sh
brew tap hungryZoo/tap
brew trust --cask hungryZoo/tap/quickjaso
brew install --cask hungryZoo/tap/quickjaso
open -a quickJaso
```

## 업데이트

```sh
brew update
brew upgrade --cask quickjaso
```

## 제거

```sh
brew uninstall --cask quickjaso
```

배포본은 ad-hoc 서명이며 Apple 공증은 없습니다. 첫 실행이 차단되면 **시스템 설정 → 개인정보 보호 및 보안 → 그래도 열기**로 승인하거나 `xattr -dr com.apple.quarantine /Applications/quickJaso.app`을 실행하세요.
