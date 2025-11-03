{ buildNpmPackage, fetchFromGitHub }:

buildNpmPackage {
  name = "comfyui-frontend";

  src = fetchFromGitHub {
    owner = "Comfy-Org";
    repo = "ComfyUI_frontend";
    fetchSubmodules = false;
    rev = "0692253e9020a5c62ec3c5d81c2deed9417c145f";
    hash = "sha256-c4dlS7rPrhzXZ6ikgfGwJuoNz5bR64vaEhu9eCvE7jI=";
  };

  npmDepsHash = "sha256-DtUdY7QaCaAlqkxlawlSGFGHoNA+TWvhMVDgytvLanA=";

  patches = [
    ./0001-use-neutral-colors.patch
  ];

  installPhase = ''
    runHook preInstall

    mkdir --parents $out/share/comfyui
    cp --archive dist $out/share/comfyui/web

    runHook postInstall
  '';
}
