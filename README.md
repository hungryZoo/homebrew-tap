# hungryZoo/homebrew-tap

hungryZoo의 Homebrew tap입니다. Homebrew 6 기준입니다.

| Cask | 설명 |
|---|---|
| [quickjaso](Casks/quickjaso.rb) | macOS Finder 서비스로 파일·폴더 이름을 Windows 호환 Unicode NFC로 검사·변환 — https://github.com/hungryZoo/quickJaso |
| [everydock](Casks/everydock.rb) | 모든 모니터에 항상 표시되는 macOS 앱 바 — https://github.com/hungryZoo/everyDock |

| Formula | 설명 |
|---|---|
| [tu](Formula/tu.rb) | tmux 세션 메뉴 TUI (macOS / Linux) — https://github.com/hungryZoo/tu |

## tu 설치

```sh
brew tap hungryZoo/tap
brew install hungryZoo/tap/tu
```

`tmux`는 의존성으로 함께 설치됩니다. 업데이트는 `brew update && brew upgrade tu`.

## quickJaso 설치

```sh
brew tap hungryZoo/tap
brew trust --cask hungryZoo/tap/quickjaso
brew install --cask hungryZoo/tap/quickjaso
xattr -dr com.apple.quarantine "/Applications/quickJaso.app"
open -a quickJaso
```

## 업데이트

```sh
brew update
brew upgrade --cask quickjaso
xattr -dr com.apple.quarantine "/Applications/quickJaso.app"
open -a quickJaso
```

## 제거

```sh
brew uninstall --cask quickjaso
/System/Library/CoreServices/pbs -flush
```

제거 후에도 Finder 서비스 메뉴에 항목이 남아 있으면 휴지통·DMG 등 다른 위치의 `quickJaso.app` 사본이 Launch Services에 등록된 것입니다. 자세한 정리 방법은 [quickJaso README의 제거 절](https://github.com/hungryZoo/quickJaso#제거)을 참고하세요.

배포본은 ad-hoc 서명이며 Apple 공증은 없습니다. 첫 실행이 차단되면 **시스템 설정 → 개인정보 보호 및 보안 → 그래도 열기**로 승인하거나 `xattr -dr com.apple.quarantine /Applications/quickJaso.app`을 실행하세요.
