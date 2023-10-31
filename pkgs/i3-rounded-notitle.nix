{ fetchFromGitHub
, lib
, stdenv
, pkg-config
, makeWrapper
, meson
, ninja
, installShellFiles
, libxcb
, xcbutilkeysyms
, xcbutil
, xcbutilwm
, xcbutilxrm
, libstartup_notification
, libX11
, pcre2
, libev
, yajl
, xcb-util-cursor
, perl
, pango
, perlPackages
, libxkbcommon
, xorgserver
, xvfb-run
, asciidoc
, xmlto
, docbook_xml_dtd_45
, docbook_xsl
, findXMLCatalogs
}:

stdenv.mkDerivation {
  pname = "i3-rounded-notitle";
  version = "4.21.1";

  src = fetchFromGitHub {
    owner = "lukerhoads";
    repo = "i3-rounded-notitle";
    rev = "1050d243b1f38f8f20036669a39f942a006f17c8";
    sha256 = "sha256-LAB2UtrsDv6Z+sjllTL3JlqvRTflnd6zPsa0ASCveBw=";
  };

  nativeBuildInputs = [
    pkg-config
    makeWrapper
    meson
    ninja
    installShellFiles
    perl
    asciidoc
    xmlto
    docbook_xml_dtd_45
    docbook_xsl
    findXMLCatalogs
  ];

  mesonFlags = [
    "-Ddocs=true"
    "-Dmans=true"
  ];

  buildInputs = [
    libxcb
    xcbutilkeysyms
    xcbutil
    xcbutilwm
    xcbutilxrm
    libxkbcommon
    libstartup_notification
    libX11
    pcre2
    libev
    yajl
    xcb-util-cursor
    perl
    pango
    perlPackages.AnyEventI3
    perlPackages.X11XCB
    perlPackages.IPCRun
    perlPackages.ExtUtilsPkgConfig
    perlPackages.InlineC
    xorgserver
    xvfb-run
  ];

  configureFlags = [ "--disable-builddir" ];

  postPatch = ''
    patchShebangs .
  '';

  # Tests have been failing (at least for some people in some cases)
  # and have been disabled until someone wants to fix them. Some
  # initial digging uncovers that the tests call out to `git`, which
  # they shouldn't, and then even once that's fixed have some
  # perl-related errors later on. For more, see
  # https://github.com/NixOS/nixpkgs/issues/7957
  doCheck = false; # stdenv.hostPlatform.system == "x86_64-linux";

  checkPhase = lib.optionalString (stdenv.hostPlatform.system == "x86_64-linux")
    ''
      (cd testcases && xvfb-run ./complete-run.pl -p 1 --keep-xserver-output)
      ! grep -q '^not ok' testcases/latest/complete-run.log
    '';

  postInstall = ''
    wrapProgram "$out/bin/i3-save-tree" --prefix PERL5LIB ":" "$PERL5LIB"
    for program in $out/bin/i3-sensible-*; do
    sed -i 's/which/command -v/' $program
    done

    installManPage man/*.1
  '';

  separateDebugInfo = true;
}
