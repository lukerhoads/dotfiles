{
    lib,
    stdenv,
    fetchFromGitHub,
    python3Packages,
    psutil
}:

python3Packages.buildPythonApplication {
    name = "beautifuldiscord";
    src = fetchFromGitHub {
        owner = "leovoel";
        repo = "BeautifulDiscord";
        rev = "7d79336a1ffa01d89258074d8701860fab865585";
        sha256 = "sha256-F+k/ytcuTM3v7g9u9hO/oDC0+lTL8UhC9kT9NxdHXI0=";
    };

    propagatedBuildInputs = [ psutil ];
    doCheck = false;
}