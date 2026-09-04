# hungryZoo/homebrew-tap

hungryZoo의 Homebrew tap입니다.

```bash
brew tap hungryZoo/tap
brew install --cask --no-quarantine quickjaso
```

| Cask | 설명 |
|---|---|
| [quickjaso](Casks/quickjaso.rb) | macOS Finder 서비스로 파일·폴더 이름을 Windows 호환 Unicode NFC로 검사·변환 — https://github.com/hungryZoo/quickJaso |

`--no-quarantine`을 붙이면 다운로드 격리 속성이 붙지 않아 Gatekeeper 경고 없이 실행됩니다 (앱이 Apple 공증되어 있지 않기 때문).
