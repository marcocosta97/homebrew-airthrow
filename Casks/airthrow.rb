cask "airthrow" do
  version "0.1.2"
  sha256 "4ce2881a711682b2a0e7640b8188208e2154dbd32247609d763d51b835cdfd16"

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
