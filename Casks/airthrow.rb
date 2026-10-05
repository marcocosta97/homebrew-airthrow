cask "airthrow" do
  version "0.1.0"
  sha256 "dd68dc8f0a259c3ec8019f192d47ebf34d0afbb1a6c5d19da4e0b9408a0dfded"

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
