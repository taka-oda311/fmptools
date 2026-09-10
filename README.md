[![Build Status](https://github.com/taka-oda311/fmptools/actions/workflows/build.yml/badge.svg)](https://github.com/taka-oda311/fmptools/actions/workflows/build.yml)

FMP Tools
--

Some tools for reading FileMaker Pro files (fp3, fp5, fp7, and fmp12). See the
included [HACKING](./HACKING) file for technical information on the FileMaker
format.

Building from the git source first requires [autoconf](https://www.gnu.org/software/autoconf/):

```sh
autoreconf -i -f
```

Building from a source release requires the usual:

```sh
./configure
make
make install
```

The tools installed to `$PREFIX/bin` include:

* `fmpdump` - Dump FileMaker Pro database contents
* `fmp2excel` - Convert a FileMaker Pro database to Excel (requires [libxlsxwriter](http://libxlsxwriter.github.io))
* `fmp2json` - Convert a FileMaker Pro database to JSON (requires [yajl](https://lloyd.github.io/yajl/))
* `fmp2sqlite` - Convert a FileMaker Pro database to SQLite (requires [sqlite](https://www.sqlite.org/index.html))

There is also a C library installed that is used by the above tools, but the
API is subject to change.

You might also enjoy [fp5dump](https://github.com/qwesda/fp5dump), although
that project does not read the newer fp7 and fmp12 formats.

Releases
--

Prebuilt binaries are available from the
[GitHub Releases](https://github.com/taka-oda311/fmptools/releases) page.

Release packages are provided for:

* Linux x64
* macOS ARM64
* Windows x64

Each release includes the available command-line tools:

* `fmp2sqlite`
* `fmpdump`
* `fmp2json`
* `fmp2excel`

On Windows, the required runtime DLLs are included in the release package.

Windows cross-compilation
--

The tools can be cross-compiled for 64-bit Windows from Linux using MinGW-w64.

Required components include:

* `x86_64-w64-mingw32-gcc`
* Windows-targeted SQLite
* Windows-targeted iconv
* Windows-targeted YAJL
* Windows-targeted zlib
* Windows-targeted libxlsxwriter

Example configure command:

```sh
CPPFLAGS="-I/path/to/windows/include" \
LDFLAGS="-L/path/to/windows/lib" \
LIBS="-liconv -lz" \
./configure \
  --host=x86_64-w64-mingw32 \
  --disable-shared \
  --enable-static
```

Then build with:

```sh
make
```

The Windows build produces:

```text
fmp2sqlite.exe
fmpdump.exe
fmp2json.exe
fmp2excel.exe
```

The prebuilt Windows release also includes the required runtime DLLs:

```text
iconv.dll
libyajl.dll
libz.dll
```

This fork also includes fixes for:

* Windows compatibility
* improved FMP12 metadata handling
* improved FMP12 value mapping
* Windows cross-compilation support
