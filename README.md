# build-libarchive-minitar-android

A very small (~200kb) command line tar/gz/bzip2/xz unarchiver utility for Android with hardcoded hard link to symlink conversion.

Just because old Android versions have no even tar/gunzip accessible for applications.

* The only prerequisite is the Android-NDK.
* Just use the prebuilt binaries or run the `./build.sh` script.
* Usage example: `cat something.tgz | minitar`.
