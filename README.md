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
