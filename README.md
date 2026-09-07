# hungryZoo/homebrew-tap

hungryZoo의 Homebrew tap입니다.

```bash
brew install --cask hungryZoo/tap/quickjaso
```

| Cask | 설명 |
|---|---|
| [quickjaso](Casks/quickjaso.rb) | macOS Finder 서비스로 파일·폴더 이름을 Windows 호환 Unicode NFC로 검사·변환 — https://github.com/hungryZoo/quickJaso |

quickJaso는 Apple 공증(notarization)이 되어 있지 않아 첫 실행을 Gatekeeper가 막습니다. Homebrew 6에는 `--no-quarantine` 옵션이 없으므로 설치 후 다음 중 하나를 실행하세요.

```bash
xattr -dr com.apple.quarantine /Applications/quickJaso.app
```

또는 **시스템 설정 → 개인정보 보호 및 보안 → 그래도 열기**.

## everyDock

Apple Silicon · macOS 26 이상에서 모든 모니터에 Dock을 표시하는 공개 베타입니다.

```sh
brew tap hungryZoo/tap
brew trust --cask hungryZoo/tap/everydock
brew install --cask hungryZoo/tap/everydock
open -a everyDock
```

[cask](Casks/everydock.rb) · [소스와 개발 문서](https://github.com/hungryZoo/everyDock) · [릴리스](https://github.com/hungryZoo/everyDock/releases)

Homebrew 6에서 위 trust 명령은 everyDock cask만 대상으로 합니다. everyDock은 ad-hoc 서명이며 공증되지 않았습니다. 첫 실행 차단 시 출처를 확인하고 시스템 설정의 개인정보 보호 및 보안에서 직접 승인하세요. 창 조작에는 손쉬운 사용, 썸네일에는 화면 기록 권한이 필요합니다.

업데이트·제거 전 everyDock을 정상 종료해 기본 Dock 설정을 복원하세요.

```sh
brew update
brew upgrade --cask everydock
# 제거하려면:
brew uninstall --cask everydock
```
