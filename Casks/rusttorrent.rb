cask "rusttorrent" do
  version "0.12.0"
  sha256 "bbf835cdb94b2378db7628852dce3ba5d48027f94eaf45f990f4a00eac7c5a20"

  url "https://github.com/manojknaikade/RustTorrent/releases/download/v#{version}/RustTorrent-#{version}-arm64.zip"
  name "RustTorrent"
  desc "Small, fast torrent client"
  homepage "https://github.com/manojknaikade/RustTorrent"

  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "RustTorrent.app"

  # The app is signed only locally, so macOS would refuse to open a downloaded copy.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/RustTorrent.app"]
  end

  zap trash: "~/Library/Application Support/RustTorrent"
end
