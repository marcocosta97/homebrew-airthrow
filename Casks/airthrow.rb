cask "airthrow" do
  version "0.2.1"
  sha256 "7c4ea68eae47e48da4339f581d3f5a32968a134ff1fc9fedcb5589b97eceda10"

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
