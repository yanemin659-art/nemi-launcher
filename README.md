# NEMI LAUNCHER

This repository contains the cloud build configuration for NEMI Launcher.

## Cloud builds

GitHub Actions is configured in `.github/workflows/build.yml` to build:

- Windows desktop launcher executable from the upstream HelixLauncher source.
- Android Minecraft Java launcher APK from the upstream Amethyst-Android source.

Open the **Actions** tab and select **NEMI Launcher Cloud Build**. Start it with **Run workflow** when the workflow is enabled. Build outputs are published as workflow artifacts for 14 days.

## Current scope and limitations

- The workflow currently builds upstream HelixLauncher and Amethyst projects. It does not yet integrate the NEMI custom UI, cape/skin cosmetics, or account customization.
- No prebuilt EXE or APK is committed here; successful GitHub Actions runs are required to produce them.
- Android build output is an Amethyst-based Minecraft Java launcher. Device compatibility and sign-in must be tested on a real Android device.
