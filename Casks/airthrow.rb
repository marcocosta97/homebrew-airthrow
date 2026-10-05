cask "airthrow" do
  version "0.1.1"
  sha256 "f18d353bfe8257cb488947003c7d92011b43bcb0604485e14e2149568220d66a"

  url "https://github.com/marcocosta97/airthrow/releases/download/v#{version}/AirThrow-#{version}-arm64.zip"
  name "AirThrow"
  desc "Send video links and local files to Apple TV and other AirPlay receivers"
  homepage "https://github.com/marcocosta97/airthrow"

  depends_on arch: :arm64
  depends_on macos: :sonoma
  depends_on formula: ["deno", "ffmpeg", "yt-dlp"]

  app "AirThrow.app"
  binary "#{appdir}/AirThrow.app/Contents/MacOS/athrow"

  caveats <<~EOS
    AirThrow is ad-hoc signed and not notarized. On first launch macOS may
    block it: open System Settings > Privacy & Security and choose
    "Open Anyway" for AirThrow.app. The bundled athrow command line tool may
    require separate approval.
  EOS
end
